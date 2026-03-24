using CarStandWebAPI.Models;

namespace CarStandWebAPI.Repositories
{
    public interface IVehicleRepository
    {
        public List<Marcas> GetUniqueMarcas(string tag);
        public List<Modelos> GetUniqueModelos(string tag);
        public List<int> GetUniqueYears(string tag);
    }
}
