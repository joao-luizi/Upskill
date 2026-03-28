using CarStandBusiness.DTO;
using CarStandBusiness.Models;

namespace CarStandBusiness.Repositories
{
    public interface IVehicleRepository
    {
        public List<Marcas> GetUniqueMarcas(string tag);
        public List<Modelos> GetUniqueModelos(string tag);
        public List<Veiculos> GetUniqueYears(string tag);
    }
}
