using Azure.Core;
using CarStand.Models;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
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
            await ExecuteSqlScriptAsync("CarStand.DataBase.Scripts.DropTables.sql");
            await ExecuteSqlScriptAsync("CarStand.DataBase.Scripts.CreateTablesAndRelationships.sql");
            await ExecuteSqlScriptAsync("CarStand.DataBase.Scripts.SeedData.sql");
        }

        public async Task  ExecuteSqlAsync(string sql, string conn)
        {
            try
            {
                using SqlConnection connection = new(conn);
                await connection.OpenAsync();
                using SqlCommand command = new(sql, connection);
                await command.ExecuteNonQuery();
               
            }
            catch (Exception)
            {
                
            }
        }
        public async Task ExecuteSqlScriptAsync(string resourceName)
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
                await ExecuteSqlAsync(script, _config.ConnectionString);
            }
            catch (Exception)
            {
                
            }
        }
        public async Task<List<Modelos>> GetModelosAsync()
        {
            var list = new List<Modelos>();

            using (var conn = new SqlConnection(_config.ConnectionString))
            {
                await conn.OpenAsync(); // Async open
                //[IDModelos] INT IDENTITY(1,1) NOT NULL,
                //[NomeModelo] NVARCHAR(50) NOT NULL,
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
                // [IDMarca] INT IDENTITY(1,1) NOT NULL,
                //[Nome] NVARCHAR(50) NOT NULL,
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

        public  async Task<PagedResult<Veiculos>> GetPagedResult(PageRequest request)
        {
            
            using var conn = new SqlConnection(_config.ConnectionString);
            await conn.OpenAsync();

            var (whereClause, parameters) = BuildWhereClause(request.ActiveFilters);
            int totalCount =  await GetVehicleCountAsync(whereClause, parameters, conn);
            Dictionary<int, Veiculos> lstVeiculos = await MapVehicles(whereClause, parameters, request, conn);

            return new PagedResult<Veiculos>(new List<Veiculos>(), totalCount);
        }
        private async Task<int> GetVehicleCountAsync(string whereClause, 
            List<SqlParameter>? parameters, SqlConnection conn)
        {
           
            // 1️⃣ Get total count
            string countSql = $@"
            SELECT COUNT(*)
            FROM Veiculos
            {whereClause}";

            int totalCount;
            using (var countCmd = new SqlCommand(countSql, conn))
            {
                if (parameters != null && parameters.Count > 0)
                    countCmd.Parameters.AddRange(parameters.ToArray());
                object? result = await countCmd.ExecuteScalarAsync();
                totalCount = Convert.ToInt32(result);
            }
            return totalCount;
        }


        private async Task<Dictionary<int, Veiculos>> MapVehicles(string whereClause, 
            List<SqlParameter>? parameters, PageRequest request, SqlConnection conn)
        {
          
            // 2️ Get paged data
            string dataSql = $@"SELECT VeiculoID,
            MarcaID,
            ModeloID,
            Ano,
            Vendido
            FROM Veiculos
            {whereClause}
            ORDER BY VeiculoID
            OFFSET @Offset ROWS
            FETCH NEXT @PageSize ROWS ONLY";

            var items = new Dictionary<int, Veiculos>();

            using (var dataCmd = new SqlCommand(dataSql, conn))
            {
                if (parameters != null )
                    dataCmd.Parameters.AddRange(parameters.ToArray());
                dataCmd.Parameters.AddWithValue("@Offset", request.OffSet());
                dataCmd.Parameters.AddWithValue("@PageSize", request.ResultsPerPage);

                using var reader = await dataCmd.ExecuteReaderAsync();

                while (await reader.ReadAsync())
                {
                    items.Add(reader.GetInt32(0), new Veiculos(
                        reader.GetInt32(0),
                        reader.GetString(1),
                        reader.GetString(2),
                        reader.GetInt32(3),
                        new List<Inspecoes>(),
                         reader.GetBoolean(4)));
                }
            }

            return items;
        }
       
    }
}
