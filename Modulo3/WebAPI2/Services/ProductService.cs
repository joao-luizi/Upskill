
using LibNorthWind.DTOs;
using LibNorthWind.Models;
using LibNorthWind.Repositories;

namespace WebAPI_1.Services
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _repo;
        private readonly ILogger _logger;

        public ProductService(ILogger<ProductService> logger, IProductRepository repo)
        {
            _repo = repo;
            _logger = logger;
        }

        public List<ProductDTO> GetAll()
        {
            _logger.LogInformation("Repo ProductService: calling GetAll()");
            
            return _repo.GetAll("Northwind")
                .Select(p => new ProductDTO
                {
                    ProductID = p.ProductID,
                    ProductName = p.ProductName,
                    UnitPrice = p.UnitPrice
                }).ToList();
        }

        public List<ProductDTO> GetAllFilter(ProductFilterDTO dto)
        {
            _logger.LogInformation("Repo ProductService: calling GetAllFilter()");

            return _repo.GetAll("Northwind")
                .Select(p => new ProductDTO
                {
                    ProductID = p.ProductID,
                    ProductName = p.ProductName,
                    UnitPrice = p.UnitPrice
                }).ToList();
        }

        public ProductDTO GetById(int id)
        {
            var p = _repo.GetById(id, "Northwind");

            if (p == null)
                return null;

            return new ProductDTO
            {
                ProductID = p.ProductID,
                ProductName = p.ProductName,
                UnitPrice = p.UnitPrice
            };
        }

        public int Create(ProductCreateDTO dto)
        {
           

            try
            {
                Product p = new Product
                {
                    ProductName = dto.ProductName,
                    SupplierID = dto.SupplierID,
                    CategoryID = dto.CategoryID,
                    UnitPrice = dto.UnitPrice
                };

                int id = _repo.Insert(p, "Northwind");

                

                return id;
            }
            catch
            {
                throw;
            }
        }

        public void Update(int id, ProductCreateDTO dto)
        {
            

            try
            {
                Product p = new Product
                {
                    ProductID = id,
                    ProductName = dto.ProductName,
                    UnitPrice = dto.UnitPrice
                };

                _repo.Update(p, "Northwind");

               
            }
            catch
            {
               
                throw;
            }
        }

        public void Delete(int id)
        {
            

            try
            {
                _repo.Delete(id, "Northwind");

               
            }
            catch
            {
               
                throw;
            }
        }
    }
}
