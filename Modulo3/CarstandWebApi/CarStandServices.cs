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
    }
}
