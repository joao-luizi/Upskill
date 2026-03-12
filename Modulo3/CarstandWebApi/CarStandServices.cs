using DalPro;
using CarstandWebApi.Models;
using System.Security.Cryptography.X509Certificates;

namespace CarstandWebApi
{
    public class CarStandServices
    {
        public List<Modelos> GetAllModels()
        {
            string query = "SELECT * from Modelos";
            return DalPro.DALPro.Query<Modelos>(query);
        }

        public List<Marcas> GetAllMarcas()
        {
            string query = "SELECT * from Marcas";
            return DalPro.DALPro.Query<Marcas>(query);
        }

        public List<Inspecoes> GetAllInspect()
        {
            string query = "SELECT * from Inspecoes";
            return DalPro.DALPro.Query<Inspecoes>(query);
        }

        public List<Veiculos> GetAllVeiculos()
        {
            string query = "SELECT * from Veiculos";
            return DalPro.DALPro.Query<Veiculos>(query);
        }



    }
}
