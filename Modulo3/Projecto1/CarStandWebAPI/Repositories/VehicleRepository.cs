using CarStandWebAPI.Models;
using DalPro;

namespace CarStandWebAPI.Repositories
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

        public List<int> GetUniqueYears(string tag)
        {
            DalPro.DALPro.ConnectionString = GetConnectionsString(tag);
            string sql = "SELECT DISTINCT Ano FROM Veiculos";

            return DALPro.Query<int>(sql);
        }







    }
}
