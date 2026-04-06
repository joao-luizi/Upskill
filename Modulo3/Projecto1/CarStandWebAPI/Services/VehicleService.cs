using CarStandBusiness.DTO;
using CarStandBusiness.Models;
using CarStandBusiness.Repositories;
using DalPro;
using Microsoft.Data.SqlClient;

namespace CarStandWebAPI.Services
{
    public class VehicleService : IVehicleService
    {
        private readonly IVehicleRepository _veiculoRepository;
        private readonly IMarcasRepository _marcaRepository;
        private readonly IModelosRepository _modeloRepository;
        private readonly IInspecoesRepository _inspecaoRepository;
        private readonly ILogger _logger;

        public VehicleService(ILogger<VehicleService> logger, IVehicleRepository veiculoRepository,
            IMarcasRepository marcasRepository, IModelosRepository modelosRepository, IInspecoesRepository inspecoesRepository)
        {
            _veiculoRepository = veiculoRepository;
            _marcaRepository = marcasRepository;
            _inspecaoRepository = inspecoesRepository;
            _modeloRepository = modelosRepository;
            _logger = logger;
        }

        public List<MarcasDTO> GetUniqueMarcas()
        {
            _logger.LogInformation("Called GetUniqueMarcas()");
            return [.. _veiculoRepository.GetUniqueMarcas("CarStand")
                .Select(p => new MarcasDTO
                {
                    IDMarca = p.IDMarca,
                    Nome = p.Nome
                })];
        }

        public List<ModelosDTO> GetUniqueModelos()
        {
            _logger.LogInformation("Called GetUniqueModelos()");
            return [.. _veiculoRepository.GetUniqueModelos("CarStand")
                .Select(p => new ModelosDTO
                {
                    IDModelos = p.IDModelos,
                    Modelo = p.Modelo
                })];
        }

        public List<AnoDTO> GetUniqueYears()
        {
            _logger.LogInformation("Called GetUniqueModelos()");
            return [.. _veiculoRepository.GetUniqueYears("CarStand")
                .Select(p => new AnoDTO
                {
                    Ano = p.Ano
                })];
        }

        public void Delete(long id, string tag)
        {
            _logger.LogInformation("Called Delete()");
            _veiculoRepository.Delete(id, tag);
        }

        public VeiculosDTO GetById(long id, string tag)
        {
            _logger.LogInformation("Called GetById()");
            return _veiculoRepository.SearchById(id, tag);
        }
        public List<VeiculosDTO> SearchResult(FilterDTO filter, string tag)
        {
            _logger.LogInformation("Called SearchResult()");
            return _veiculoRepository.SearchResult(filter, tag);
        }

        public VeiculosDTO Upsert(VeiculoUpsertDTO dto, string tag)
        {
            if (dto.VeiculoID.HasValue)
                return Update(dto, tag);
            else
                return Insert(dto, tag);
        }

        private VeiculosDTO Update(VeiculoUpsertDTO upsertDTO,  string tag)
        {
           
            var current = _veiculoRepository.GetById(upsertDTO.VeiculoID.Value, tag);
            
            if (current == null)
                throw new Exception("Veiculo not found");
             
            // Resolve Marca
            var marca = _marcaRepository.GetByNome(upsertDTO.MarcaNome, tag);
            int marcaId = marca?.IDMarca ?? _marcaRepository.Insert(
                new MarcasDTO{ Nome = upsertDTO.MarcaNome }, tag);

            // Resolve Modelo
            var modelo = _modeloRepository.GetByNome(upsertDTO.ModeloNome, tag);
            int modeloId = modelo?.IDModelos ?? _modeloRepository.Insert(new ModelosDTO { Modelo = upsertDTO.ModeloNome }, tag);

            // Check changes
            bool needsUpdate =
                current.MarcaID != marcaId ||
                current.ModeloID != modeloId ||
                current.Ano != upsertDTO.Ano ||
                current.Vendido != upsertDTO.Vendido;

            if (needsUpdate)
            {
                _veiculoRepository.Update(new Veiculos
                {
                    VeiculoID = current.VeiculoID,
                    MarcaID = marcaId,
                    ModeloID = modeloId,
                    Ano = upsertDTO.Ano,
                    Vendido = upsertDTO.Vendido
                }, tag);
            }

            // Handle inspection
            if (needsUpdate && upsertDTO.DataDeInspecao.HasValue)
            {
                _inspecaoRepository.Insert(new Inspecoes
                {
                    VeiculoID = current.VeiculoID,
                    DataDeInspecao = upsertDTO.DataDeInspecao.Value,
                    Resultado = true
                }, tag);
            }
            var res = _veiculoRepository.SearchById(current.VeiculoID, tag);

            return res;

        }

        private VeiculosDTO Insert(VeiculoUpsertDTO upsertDTO, string tag)
        {
            // Resolve Marca
            var marca = _marcaRepository.GetByNome(upsertDTO.MarcaNome, tag);
            int marcaId = marca?.IDMarca ?? _marcaRepository.Insert(
                new MarcasDTO { Nome = upsertDTO.MarcaNome }, tag);

            // Resolve Modelo
            var modelo = _modeloRepository.GetByNome(upsertDTO.ModeloNome, tag);
            int modeloId = modelo?.IDModelos ?? _modeloRepository.Insert(new ModelosDTO { Modelo = upsertDTO.ModeloNome }, tag);

            var current = _veiculoRepository.Insert(new Veiculos
            {
                MarcaID = marcaId,
                ModeloID = modeloId,
                Ano = upsertDTO.Ano,
                Vendido = upsertDTO.Vendido
            }, tag);

            // Handle inspection
            if (upsertDTO.DataDeInspecao.HasValue)
            {
                _inspecaoRepository.Insert(new Inspecoes
                {
                    VeiculoID = current.VeiculoID,
                    DataDeInspecao = upsertDTO.DataDeInspecao.Value,
                    Resultado = true
                }, tag);
            }

            var res = _veiculoRepository.SearchById(current.VeiculoID, tag);

            return res;



        }
    }
}
