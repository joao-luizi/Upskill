using Microsoft.Data.SqlClient;
using LibNorthWind.Models;

namespace LibNorthWind.Repositories
{
    public interface IProductRepository
    {
        List<Product> GetAll(string tag);

        Product GetById(int id, string tag);

        int Insert(Product product, string tag);

        void Update(Product product, string tag);

        void Delete(int id, string tag);
    }
}
