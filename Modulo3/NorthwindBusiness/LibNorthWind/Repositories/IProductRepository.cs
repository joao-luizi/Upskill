using Microsoft.Data.SqlClient;
using LibNorthWind.Models;

namespace LibNorthWind.Repositories
{
    public interface IProductRepository
    {
        List<Product> GetAll();

        Product GetById(int id);

        int Insert(Product product);

        void Update(Product product);

        void Delete(int id);
    }
}
