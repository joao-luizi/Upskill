using LibNorthWind.DTOs;

namespace WebAPI_1.Services
{
    public interface IProductService
    {
        List<ProductDTO> GetAll();

        List<ProductDTO> GetAllFilter(ProductFilterDTO dto);

        ProductDTO GetById(int id);

        int Create(ProductCreateDTO dto);

        void Update(int id, ProductCreateDTO dto);

        void Delete(int id);
    }
}
