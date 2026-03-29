using CarStandBusiness.DTO;

namespace CarStandWebAPI.Services
{
    public interface IVehicleService
    {
        public List<MarcasDTO> GetUniqueMarcas();

        public List<ModelosDTO> GetUniqueModelos();

        public List<AnoDTO> GetUniqueYears();

        public List<VeiculosDTO> SearchResult(FilterDTO filter, string tag);

    }
}
