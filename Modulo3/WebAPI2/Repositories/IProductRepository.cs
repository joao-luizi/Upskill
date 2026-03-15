using Microsoft.Data.SqlClient;
using WebAPI_1.Models;

namespace WebAPI_1.Repositories
{
    public interface IProductRepository
    {
        List<Product> GetAll();

        Product GetById(int id);

        int Insert(Product product, SqlTransaction trans);

        void Update(Product product, SqlTransaction trans);

        void Delete(int id, SqlTransaction trans);
    }
}
