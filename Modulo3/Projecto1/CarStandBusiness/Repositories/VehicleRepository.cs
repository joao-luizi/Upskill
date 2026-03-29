using CarStandBusiness.DTO;
using CarStandBusiness.Models;
using DalPro;
using Microsoft.Extensions.Configuration;
using System.Text;

namespace CarStandBusiness.Repositories
{
    public class VehicleRepository : IVehicleRepository
    {
        private readonly IConfiguration _configuration;
        public VehicleRepository(IConfiguration config)
        {
            _configuration = config;
        }

        private string GetConnectionsString(string tag)
        {
            var connectionString = _configuration.GetConnectionString(tag) ?? throw new Exception($"Connection string for tag: {tag} not found!");
            return connectionString;
        }

        public List<Marcas> GetUniqueMarcas(string tag)
        {
            DalPro.DALPro.ConnectionString = GetConnectionsString(tag);
            string sql = "SELECT * FROM Marcas WHERE Marcas.IDMarca IN (SELECT DISTINCT (IDMarca) FROM Veiculos)";

            return DALPro.Query<Marcas>(sql);
        }

        public List<Modelos> GetUniqueModelos(string tag)
        {
            DalPro.DALPro.ConnectionString = GetConnectionsString(tag);
            string sql = "SELECT * FROM Modelos WHERE Modelos.IDModelos IN (SELECT DISTINCT (IDModelos) FROM Veiculos)";

            return DALPro.Query<Modelos>(sql);
        }

        public List<Veiculos> GetUniqueYears(string tag)
        {
            DalPro.DALPro.ConnectionString = GetConnectionsString(tag);
            string sql = "SELECT DISTINCT Ano FROM Veiculos";

            return DALPro.Query<Veiculos>(sql);
        }

        void AddInClause<T>(StringBuilder sql, Dictionary<string, object> parameters,
                    string columnName, string paramBaseName, List<T> values)
        {
            if (values == null || values.Count == 0)
                return;

            var paramNames = new List<string>();

            for (int i = 0; i < values.Count; i++)
            {
                string paramName = $"@{paramBaseName}{i}";
                paramNames.Add(paramName);
                parameters.Add(paramName, values[i]);
            }

            sql.Append($" AND {columnName} IN ({string.Join(",", paramNames)})");
        }

        public List<VeiculosDTO> SearchResult(FilterDTO filter, string tag)
        {
            DalPro.DALPro.ConnectionString = GetConnectionsString(tag);
            var sql = new StringBuilder();
            var parameters = new Dictionary<string, object>();

            sql.Append(@"
            SELECT Veiculos.VeiculoID, Nome, Modelo, Ano, Vendido, DataDeInspecao, Resultado
            FROM Veiculos
            LEFT JOIN Marcas ON Marcas.IDMarca = Veiculos.MarcaID
            LEFT JOIN Modelos ON Modelos.IDModelos = Veiculos.ModeloID
            LEFT JOIN (
                SELECT Inspecoes.*
                FROM Inspecoes
                INNER JOIN (
                    SELECT VeiculoID, MAX(DataDeInspecao) AS MaxData
                    FROM Inspecoes
                    GROUP BY VeiculoID
                ) latest 
                ON Inspecoes.VeiculoID = latest.VeiculoID 
                AND Inspecoes.DataDeInspecao = latest.MaxData
            ) AS UltimaInspecao
            ON UltimaInspecao.VeiculoID = Veiculos.VeiculoID
            WHERE 1 = 1
            ");

            AddInClause(sql, parameters, "Ano", "Ano", filter.Anos);
            AddInClause(sql, parameters, "MarcaID", "Marca", filter.Marcas);
            AddInClause(sql, parameters, "ModeloID", "Modelo", filter.Modelos);

            if (filter.Vendido.HasValue)
            {
                sql.Append(" AND Vendido = @Vendido");
                parameters.Add("Vendido", filter.Vendido.Value);
            }

            return DALPro.Query<VeiculosDTO>(sql.ToString(), parameters);
        }
    }
}
