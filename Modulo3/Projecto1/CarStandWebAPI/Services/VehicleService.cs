using CarStandWebAPI.DTO;
using CarStandWebAPI.Repositories;

namespace CarStandWebAPI.Services
{
    public class VehicleService
    {
        private readonly IVehicleRepository _repo;
        private readonly ILogger _logger;

        public VehicleService(ILogger<VehicleService> logger, IVehicleRepository repo)
        {
            _repo = repo;
            _logger = logger;
        }

        public List<MarcasDTO> GetUniqueMarcas()
        {
            _logger.LogInformation("Called GetUniqueMarcas()");
            return [.. _repo.GetUniqueMarcas("CarStand")
                .Select(p => new MarcasDTO
                {
                    IDMarca = p.IDMarca,
                    Nome = p.Nome
                })];
        }

        public List<ModelosDTO> GetUniqueModelos()
        {
            _logger.LogInformation("Called GetUniqueModelos()");
            return [.. _repo.GetUniqueModelos("CarStand")
                .Select(p => new ModelosDTO
                {
                    IDModelos = p.IDModelos,
                    Modelo = p.Modelo
                })];
        }

        public List<int> GetUniqueYears()
        {
            _logger.LogInformation("Called GetUniqueModelos()");
            return [.. _repo.GetUniqueYears("CarStand")];
        }
    }
}
