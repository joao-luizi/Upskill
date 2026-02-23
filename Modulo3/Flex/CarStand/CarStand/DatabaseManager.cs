using Azure.Core;
using CarStand.Models;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace CarStand
{
    internal class DatabaseManager(DatabaseConfiguration config)
    {
        private readonly DatabaseConfiguration _config = config;

        public bool DatabaseExistsInMaster()
        {
            string sql = "SELECT database_id FROM sys.databases WHERE name = @dbName";
            try
            {
                using SqlConnection connection = new(_config.MasterConnectionString);
                connection.Open();
                using SqlCommand cmd = new(sql, connection);
                cmd.Parameters.AddWithValue("@dbName", _config.DatabaseName);
                object result = cmd.ExecuteScalar();
                return result != null;
            }
            catch (SqlException)
            {
                return false;
            }
        }

        public void DropDatabaseIfExistsInMaster()
        {
            using var connection = new SqlConnection(_config.MasterConnectionString);
            connection.Open();

            string sql = $@"
            IF EXISTS (SELECT 1 FROM sys.databases WHERE name = '{_config.DatabaseName}')
            BEGIN
                ALTER DATABASE [{_config.DatabaseName}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
                DROP DATABASE [{_config.DatabaseName}];
            END";

            using var command = new SqlCommand(sql, connection);
            command.ExecuteNonQuery();
        }

        public bool CreateDatabase()
        { 
            string sql = $@"CREATE DATABASE [{_config.DatabaseName}]
                ON (NAME = N'{_config.DatabaseName}',
                FILENAME = '{_config.DatabaseFilePath}')";
            return ExecuteSql(sql, _config.MasterConnectionString);
        }


        public static bool ExecuteSql(string sql, string conn)
        {
            try
            {
                using SqlConnection connection = new(conn);
                connection.Open();
                using SqlCommand command = new(sql, connection);
                command.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool ExecuteSqlScript(string resourceName)
        {

            try
            {
               using Stream? stream = Assembly.GetExecutingAssembly().GetManifestResourceStream(resourceName);

                if (stream == null)
                {
                    throw new Exception("Stream Null Exception");
                }

               using StreamReader reader = new(stream);
               string script = reader.ReadToEnd();
               return ExecuteSql(script, _config.ConnectionString);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool CheckCriticalTablesExist()
        {
            // List all critical tables here
            string sql = @"
            SELECT COUNT(*) 
            FROM sys.tables 
            WHERE name IN ('Veiculos', 'Marcas', 'Inspecoes', 'Modelos')";

            try
            {
                using SqlConnection connection = new(_config.ConnectionString);
                connection.Open();
                using SqlCommand command = new(sql, connection);

                int count = (int)command.ExecuteScalar();

                return count == 4;
            }
            catch
            {
                return false;
            }
        }

        public async Task RecreateDataBase()
        {
            try
            {
                // Run scripts sequentially (safe for dependencies)
                await ExecuteSqlScriptAsync("CarStand.DataBase.Scripts.DropTables.sql");
                await ExecuteSqlScriptAsync("CarStand.DataBase.Scripts.CreateTablesAndRelationships.sql");
                await ExecuteSqlScriptAsync("CarStand.DataBase.Scripts.SeedData.sql");
            }
            catch (Exception ex)
            {
                // Exception is now caught and not swallowed
                MessageBox.Show($"Erro ao recriar base de dados: {ex.Message}");
                throw; // rethrow if you want upstream awareness
            }
        }

        public async Task  ExecuteSqlAsync(string sql, string conn)
        {
            try
            {
                using SqlConnection connection = new(conn);
                await connection.OpenAsync();
                using SqlCommand command = new(sql, connection);
                await command.ExecuteNonQueryAsync();
               
            }
            catch (Exception)
            {
                
            }
        }
        public async Task ExecuteSqlScriptAsync(string resourceName)
        {
           
            using Stream? stream = Assembly.GetExecutingAssembly().GetManifestResourceStream(resourceName);

            if (stream == null)
            {
                throw new Exception("Stream Null Exception");
            }

            using StreamReader reader = new(stream);
            string script = reader.ReadToEnd();
            await ExecuteSqlAsync(script, _config.ConnectionString);
           
        }
        public async Task<List<Modelos>> GetModelosAsync()
        {
            var list = new List<Modelos>();

            using (var conn = new SqlConnection(_config.ConnectionString))
            {
                await conn.OpenAsync(); // Async open
                
                using (var cmd = new SqlCommand("SELECT IDModelos, NomeModelo FROM Modelos", conn))
                using (var reader = await cmd.ExecuteReaderAsync()) // Async query execution
                {
                    while (await reader.ReadAsync()) // Async row reading
                    {
                        list.Add(new Modelos(
                            reader.GetInt32(0),       // Id
                            reader.GetString(1)       // NomeModelo
                        ));
                    }
                }
            }

            return list; // The Task<List<Modelos>> completes with this result
        }

        public async Task<List<Marcas>> GetMarcasAsync()
        {
            var list = new List<Marcas>();

            using (var conn = new SqlConnection(_config.ConnectionString))
            {
                await conn.OpenAsync(); // Async open
                using (var cmd = new SqlCommand("SELECT IDMarca, Nome FROM Marcas", conn))
                using (var reader = await cmd.ExecuteReaderAsync()) // Async query execution
                {
                    while (await reader.ReadAsync()) // Async row reading
                    {
                        list.Add(new Marcas(
                            reader.GetInt32(0),       // Id
                            reader.GetString(1)       // NomeModelo
                        ));
                    }
                }
            }

            return list; // The Task<List<Marcas>> completes with this result
        }

        public async Task<List<int>> GetAnosAsync()
        {
            var list = new List<int>();

            using (var conn = new SqlConnection(_config.ConnectionString))
            {
                await conn.OpenAsync(); // Async open
             
                using (var cmd = new SqlCommand("SELECT DISTINCT Ano FROM Veiculos", conn))
                using (var reader = await cmd.ExecuteReaderAsync()) // Async query execution
                {
                    while (await reader.ReadAsync()) // Async row reading
                    {
                        list.Add(
                            reader.GetInt32(0)
                        );
                    }
                }
            }

            return list; // The Task<List<int>> completes with this result
        }

        private (string whereClause, List<SqlParameter> parameters)
         BuildWhereClause(PesquisaArgs filters)
        {
            List<string> conditions = new();
            List<SqlParameter> parameters = new();

            if (filters.FilterMarcas > 0)
            {
                conditions.Add("MarcaId = @MarcaId");
                parameters.Add(new SqlParameter("@MarcaId", filters.FilterMarcas));
            }

            if (filters.FilterModelos > 0)
            {
                conditions.Add("ModeloId = @ModeloId");
                parameters.Add(new SqlParameter("@ModeloId", filters.FilterModelos));
            }

            if (filters.FilterAnos != "Todos os anos")
            {
                conditions.Add("Ano = @Ano");
                parameters.Add(new SqlParameter("@Ano", int.Parse(filters.FilterAnos)));
            }

            if (filters.FilterEstado != "Todos os estados")
            {
                bool value = false;
                if (filters.FilterEstado == "Disponivel")
                    value = true;
                conditions.Add("Vendido = @Estado");
                parameters.Add(new SqlParameter("@Estado", value));
            }

            string whereClause = conditions.Count > 0
                ? "WHERE " + string.Join(" AND ", conditions)
                : "";

            return (whereClause, parameters);
        }

        public async Task<PagedResult<Veiculos>> GetPagedResult(PageRequest request)
        {
            try
            {
                // Build WHERE clause and parameters
                var (whereClause, parameters) = BuildWhereClause(request.ActiveFilters);

                // 1️⃣ Get total count (each method uses its own connection safely)
                int totalCount = await GetVehicleCountAsync(whereClause, parameters);

                // 2️⃣ Get paged vehicles
                Dictionary<long, Veiculos> vehicles = await MapVehicles(whereClause, parameters, request);

                await AddInspecoesToVehicles(vehicles);
                // 3️⃣ Return result
                return new PagedResult<Veiculos>(vehicles.Values.ToList(), totalCount);
            }
            catch (Exception)
            {
                // Optional: log exception here
                throw; // rethrow so it bubbles up to LoadDefaults
            }
        }
        private async Task<int> GetVehicleCountAsync(string whereClause, List<SqlParameter>? parameters)
        {
            const string sqlTemplate = @"
        SELECT COUNT(*)
        FROM Veiculos
        {0}";

            using var conn = new SqlConnection(_config.ConnectionString);
            await conn.OpenAsync();

            using var cmd = new SqlCommand(string.Format(sqlTemplate, whereClause), conn);
            if (parameters?.Count > 0)
                cmd.Parameters.AddRange(parameters.ToArray());

            object? result = await cmd.ExecuteScalarAsync();
            return Convert.ToInt32(result);
        }


        private async Task<Dictionary<long, Veiculos>> MapVehicles(string whereClause, List<SqlParameter>? parameters, PageRequest request)
        {
            string sql = $@"
        SELECT 
            Veiculos.VeiculoID,
            Marcas.Nome AS MarcaNome,
            Modelos.NomeModelo AS ModeloNome,
            Veiculos.Ano,
            Veiculos.Vendido
        FROM Veiculos
        INNER JOIN Marcas ON Marcas.IDMarca = Veiculos.MarcaID
        INNER JOIN Modelos ON Modelos.IDModelos = Veiculos.ModeloID
        {whereClause}
        ORDER BY VeiculoID
        OFFSET @Offset ROWS
        FETCH NEXT @PageSize ROWS ONLY";

            var vehicles = new Dictionary<long, Veiculos>();

            using var conn = new SqlConnection(_config.ConnectionString);
            await conn.OpenAsync();

            using var cmd = new SqlCommand(sql, conn);

            if (parameters?.Count > 0)
                cmd.Parameters.AddRange(parameters.ToArray());

            cmd.Parameters.AddWithValue("@Offset", request.OffSet());
            cmd.Parameters.AddWithValue("@PageSize", request.ResultsPerPage);

            using var reader = await cmd.ExecuteReaderAsync();
            while (await reader.ReadAsync())
            {
                long id = reader.GetInt64(reader.GetOrdinal("VeiculoID"));
                string a = reader.GetString(reader.GetOrdinal("MarcaNome"));
                string b = reader.GetString(reader.GetOrdinal("ModeloNome"));
                int c = reader.GetInt32(reader.GetOrdinal("Ano"));
                bool d = reader.GetBoolean(reader.GetOrdinal("Vendido"));
                vehicles.Add(id, new Veiculos(
                    id,
                   a,
                    b,
                    c,
                    new List<Inspecoes>(),           // empty for now
                   d)
                );
            }

            return vehicles;
        }

        private async Task AddInspecoesToVehicles(Dictionary<long, Veiculos> vehicles)
        {
            if (vehicles == null || vehicles.Count == 0)
                return;

            // Build a comma-separated list of vehicle IDs for SQL IN clause
            var ids = string.Join(",", vehicles.Keys);

            string sql = $@"
        SELECT InspecoesID, VeiculoID, DataDeInspecao, Resultado
        FROM Inspecoes
        WHERE VeiculoID IN ({ids})
        ORDER BY DataDeInspecao DESC"; // Optional: order by date

            using var conn = new SqlConnection(_config.ConnectionString);
            await conn.OpenAsync();

            using var cmd = new SqlCommand(sql, conn);
            using var reader = await cmd.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                long inspecaoId = reader.GetInt64(reader.GetOrdinal("InspecoesID"));
                long veiculoId = reader.GetInt64(reader.GetOrdinal("VeiculoID"));
                DateTime data = reader.GetDateTime(reader.GetOrdinal("DataDeInspecao"));
                bool resultado = reader.GetBoolean(reader.GetOrdinal("Resultado"));

                var inspecao = new Inspecoes(inspecaoId, data, resultado);

                // Add to the right vehicle
                if (vehicles.TryGetValue(veiculoId, out Veiculos vehicle))
                {
                    vehicle.AddInspecao(inspecao);
                }
            }
        }

    }
}
