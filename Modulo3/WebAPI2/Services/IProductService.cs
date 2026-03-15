using WebAPI_1.DTOs;

namespace WebAPI_1.Services
{
    public interface IProductService
    {
        List<ProductDTO> GetAll();

        ProductDTO GetById(int id);

        int Create(ProductCreateDTO dto);

        void Update(int id, ProductCreateDTO dto);

        void Delete(int id);
    }
}
