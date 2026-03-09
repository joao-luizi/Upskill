using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Classes.ModelView;
using DalPro;
using ValidarLogin_DalPro.Models;

namespace ValidarLogin_DalPro
{
    public class Core
    {
        public const string connectionString = "Server=localhost;Database=Northwind;Trusted_Connection=True;TrustServerCertificate=True;";

        private string _user { get; set; }
        private string _pwd { get; set; }

        public Core(string user, string pwd)
        {
            _user = user;
            _pwd = pwd;
        }

        public int LoginDalPro()
        {
            int idUser = -1;
            try
            {
                string qry = $"SELECT EmployeeId FROM Employees WHERE LastName=@LastName AND Password=@PassWord";

                DALPro.ConnectionString = connectionString;
                Dictionary<string, object> dict = new Dictionary<string, object>();
                dict.Add("@Lastname", this._user);
                dict.Add("@PassWord", this._pwd);
                var users = DALPro.Query<EmployeeLogin>(qry, dict);

                if (users.Count != 1)
                {
                    throw new InvalidOperationException("User/password incorretos!");
                }
                idUser = users[0].EmployeeId;
            }
            catch (InvalidOperationException ex)
            {
                throw new Exception(ex.Message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return idUser;
        }

        public List<Territory> ObterDalPro(int? userId = null)
        {
            DALPro.ConnectionString = Core.connectionString;
            string sql = @"SELECT EmployeeTerritories.TerritoryID AS Id, EmployeeTerritories.EmployeeID AS EmployeeID, Territories.TerritoryDescription AS Nome
                            FROM EmployeeTerritories
                            INNER JOIN Territories
                            ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
                        ";

            Dictionary<string, object> prm = null;

            if (userId != null)
            {
                sql += $" WHERE EmployeeTerritories.EmployeeID = @id";
                prm = new Dictionary<string, object>
                {
                    { "@id", userId }
                };
            }

            return DALPro.Query<Territory>(sql, prm);
        }
    }
}
