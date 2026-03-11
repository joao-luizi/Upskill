using DalPro;
using WebApi1.Models;

namespace WebApi1.Services
{
    public class ProductService
    {
        public List<Product> GetAll()
        {
            string sql = "SELECT * FROM Products";

            return DALPro.Query<Product>(sql);
        }

        public Product GetById(int id)
        {
            string sql = "SELECT * FROM Products WHERE ProductID = @id";

            var parameters = new Dictionary<string, object>
        {
            {"@id", id}
        };

            return DALPro.Query<Product>(sql, parameters).FirstOrDefault();
        }

        public void Insert(Product p)
        {
            string sql = @"INSERT INTO Products
                       (ProductName, SupplierID, CategoryID, UnitPrice, Discontinued)
                       VALUES
                       (@ProductName, @SupplierID, @CategoryID, @UnitPrice, @Discontinued)";

            var parameters = new Dictionary<string, object>
        {
            {"@ProductName", p.ProductName},
            {"@SupplierID", p.SupplierID},
            {"@CategoryID", p.CategoryID},
            {"@UnitPrice", p.UnitPrice},
            {"@Discontinued", p.Discontinued}
        };

            DALPro.Execute(sql, parameters);
        }


        public void Update(Product p)
        {
            string sql = @"UPDATE Products
                       SET ProductName = @ProductName,
                           UnitPrice = @UnitPrice
                       WHERE ProductID = @ProductID";

            var parameters = new Dictionary<string, object>
        {
            {"@ProductID", p.ProductID},
            {"@ProductName", p.ProductName},
            {"@UnitPrice", p.UnitPrice}
        };

            DALPro.Execute(sql, parameters);
        }
    }
}