using DalPro;
using Microsoft.Data.SqlClient;
using LibNorthWind.Models;
using LibNorthWind.Repositories;
using Microsoft.Extensions.Configuration;

namespace LibNorthWind.Repositories
{
    public class ProductRepository : IProductRepository
    {
        public ProductRepository(IConfiguration config) 
        {
            var connectionString = config.GetConnectionString("Northwind");
            DalPro.DALPro.ConnectionString = connectionString;
        }
        public List<Product> GetAll()
        {
            string sql = "SELECT * FROM Products";

            return DALPro.Query<Product>(sql);
        }

        public Product GetById(int id)
        {
            string sql = "SELECT * FROM Products WHERE ProductID=@id";

            var param = new Dictionary<string, object>
        {
            {"@id", id}
        };

            return DALPro.Query<Product>(sql, param).FirstOrDefault();
        }

        public int Insert(Product p)
        {
            SqlTransaction? trans = null;
            try
            {
                trans = DALPro.BeginTransaction();

                string sql = @"INSERT INTO Products
                           (ProductName, SupplierID, CategoryID, UnitPrice, Discontinued)
                           VALUES
                           (@ProductName, @SupplierID, @CategoryID, @UnitPrice, 0);

                           SELECT SCOPE_IDENTITY();";

                var param = new Dictionary<string, object>
                {
                    {"@ProductName", p.ProductName},
                    {"@SupplierID", p.SupplierID},
                    {"@CategoryID", p.CategoryID},
                    {"@UnitPrice", p.UnitPrice}
                };
                    int ret = Convert.ToInt32(DALPro.ExecuteScalar(sql, param, trans));
                    DALPro.Commit(trans);
                    return ret;
            }
            catch
            {
                if (trans != null)
                    DALPro.Rollback(trans);
                throw;
            }
           
        }

        public void Update(Product p)
        {
            SqlTransaction? trans = null;
            try
            {
                trans = DALPro.BeginTransaction();
                string sql = @"UPDATE Products
                       SET ProductName=@ProductName,
                           UnitPrice=@UnitPrice
                       WHERE ProductID=@ProductID";

            var param = new Dictionary<string, object>
        {
            {"@ProductID", p.ProductID},
            {"@ProductName", p.ProductName},
            {"@UnitPrice", p.UnitPrice}
        };

            DALPro.Execute(sql, param, trans);
            }
            catch
            {
                if (trans != null)
                    DALPro.Rollback(trans);
                throw;
            }
        }

        public void Delete(int id)
        {
            SqlTransaction? trans = null;
            try
            {

            string sql = "DELETE FROM Products WHERE ProductID=@id";

            var param = new Dictionary<string, object>
        {
            {"@id", id}
        };

            DALPro.Execute(sql, param, trans);
            }
            catch
            {
                if (trans != null)
                    DALPro.Rollback(trans);
                throw;
            }
        }
    }
}
