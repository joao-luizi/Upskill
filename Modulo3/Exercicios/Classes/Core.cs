using Classes.ModelView;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Northwind
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

        #region LOGIN
        // Login ADO.NET
        public int Login()
        {
            SqlConnection connection = null;
            int idUser = -1;

            try
            {
                string qry = $"SELECT EmployeeId FROM Employees WHERE LastName={LibUtils.Core.DuplicaPlicas(_user)} AND Password={LibUtils.Core.DuplicaPlicas(_pwd)}";

                connection = new SqlConnection(connectionString);
                connection.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(qry, connection);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count != 1)
                {
                    throw new InvalidOperationException("User/password incorretos!");
                }
                idUser = Convert.ToInt32(dt.Rows[0]["EmployeeId"].ToString());

            }
            catch (InvalidOperationException ex)
            {
                throw new Exception(ex.Message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                try { connection.Close(); } catch { }
            }

            return idUser;
        }

        // Login DALPro
        public int Login2()
        {
            int idUser = -1;
            try
            {
                string qry = $"SELECT EmployeeId FROM Employees WHERE LastName={LibUtils.Core.DuplicaPlicas(_user)} AND Password={LibUtils.Core.DuplicaPlicas(_pwd)}";

                LibDB.DALPro.ConnectionString = connectionString;
                var users = LibDB.DALPro.Query<EmployeeLogin>(qry);

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
            finally
            {
            }

            return idUser;
        }
        public int Login3()
        {
            int idUser = -1;
            try
            {
                string qry = $"SELECT EmployeeId FROM Employees WHERE LastName={LibUtils.Core.DuplicaPlicas(_user)} AND Password={LibUtils.Core.DuplicaPlicas(_pwd)}";

                LibDB.DALPro.ConnectionString = connectionString;
                object result = LibDB.DALPro.ExecuteScalar(qry);

                if (result == null)
                {
                    throw new InvalidOperationException("User/password incorretos!");
                }
                idUser = Convert.ToInt32(result);
            }
            catch (InvalidOperationException ex)
            {
                throw new Exception(ex.Message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
            }

            return idUser;
        }
        #endregion

        public static List<Territory> DataTableToEmployeeList(DataTable table)
        {
            List<Territory> list = new List<Territory>();

            foreach (DataRow row in table.Rows)
            {
                list.Add(new Territory
                {
                    Id = row["TerritoryID"].ToString(),
                    Nome = row["TerritoryDescription"].ToString(),
                });
            }

            return list;
        }
    }

    public class Territories
    {
        public List<Territory> lista {  get; }

        public Territories()
        {
            lista = Obter3();
        }
        public Territories(int employeeId)
        {
            lista = Obter3(employeeId);
        }
        public List<Territory> Obter(int userId)
        {
            SqlConnection connection = null;
            List<Territory> lst = new List<Territory>();

            try
            {
                string connectionString = "Server=localhost;Database=Northwind;Trusted_Connection=True;TrustServerCertificate=True;";
                connection = new SqlConnection(connectionString);
                connection.Open();

                string qry = $"SELECT EmployeeTerritories.EmployeeID, EmployeeTerritories.TerritoryID, TerritoryDescription " +
                    $"FROM EmployeeTerritories INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID " +
                    $"WHERE EmployeeId ='{userId}'";
                SqlDataAdapter adapter = new SqlDataAdapter(qry, connection);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                lst = Core.DataTableToEmployeeList(dt);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                try { connection.Close(); } catch { }
            }

            return lst;
        }
        private List<Territory> Obter2(int? userId = null)
        {
            LibDB.DALPro.ConnectionString = Core.connectionString;
            string sql = @"SELECT EmployeeTerritories.TerritoryID AS Id, EmployeeTerritories.EmployeeID AS EmployeeID, Territories.TerritoryDescription AS Nome
                            FROM EmployeeTerritories
                            INNER JOIN Territories
                            ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
                        ";

            if (userId != null)
            {
                sql += $" WHERE EmployeeTerritories.EmployeeID = {userId}";
            }

            return LibDB.DALPro.Query<Territory>(sql);
        }
        private List<Territory> Obter3(int? userId = null)
        {
            LibDB.DALPro.ConnectionString = Core.connectionString;
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

            return LibDB.DALPro.Query<Territory>(sql, prm);
        }
    }
}
