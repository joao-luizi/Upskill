using DalPro;
using WebAPI_1.DTOs;
using WebAPI_1.Models;
using WebAPI_1.Repositories;

namespace WebAPI_1.Services
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _repo;

        public ProductService(IProductRepository repo)
        {
            _repo = repo;
        }

        public List<ProductDTO> GetAll()
        {
            return _repo.GetAll()
                .Select(p => new ProductDTO
                {
                    ProductID = p.ProductID,
                    ProductName = p.ProductName,
                    UnitPrice = p.UnitPrice
                }).ToList();
        }

        public ProductDTO GetById(int id)
        {
            var p = _repo.GetById(id);

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
            var trans = DALPro.BeginTransaction();

            try
            {
                Product p = new Product
                {
                    ProductName = dto.ProductName,
                    SupplierID = dto.SupplierID,
                    CategoryID = dto.CategoryID,
                    UnitPrice = dto.UnitPrice
                };

                int id = _repo.Insert(p, trans);

                DALPro.Commit(trans);

                return id;
            }
            catch
            {
                DALPro.Rollback(trans);
                throw;
            }
        }

        public void Update(int id, ProductCreateDTO dto)
        {
            var trans = DALPro.BeginTransaction();

            try
            {
                Product p = new Product
                {
                    ProductID = id,
                    ProductName = dto.ProductName,
                    UnitPrice = dto.UnitPrice
                };

                _repo.Update(p, trans);

                DALPro.Commit(trans);
            }
            catch
            {
                DALPro.Rollback(trans);
                throw;
            }
        }

        public void Delete(int id)
        {
            var trans = DALPro.BeginTransaction();

            try
            {
                _repo.Delete(id, trans);

                DALPro.Commit(trans);
            }
            catch
            {
                DALPro.Rollback(trans);
                throw;
            }
        }
    }
}
