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
    public class Territory
    {
        public int Id { get; set; }
        public string Nome { get; set; }
    }

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
                connection = new SqlConnection(connectionString);
                connection.Open();

                string qry = $"SELECT EmployeeId FROM Employees WHERE LastName={LibUtils.Core.DuplicaPlicas(_user)} AND Password={LibUtils.Core.DuplicaPlicas(_pwd)}";
                SqlDataAdapter adapter = new SqlDataAdapter(qry, connection);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
           
                if (dt.Rows.Count != 1)
                {
                    idUser = -1;
                    throw new InvalidOperationException("User/password incorretos!");
                }

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
            int iduser = -1;
            try
            {
                LibDB.DALPro.ConnectionString = connectionString;
                string qry = $"SELECT EmployeeId FROM Employees WHERE LastName={LibUtils.Core.DuplicaPlicas(_user)} AND Password={LibUtils.Core.DuplicaPlicas(_pwd)}";
                var users = LibDB.DALPro.Query<EmployeeLogin>(qry);
                if (users.Count != 0)
                {
                    
                }
            }
            catch
            {

            }
            finally
            {

            }
            return iduser;
        }

        public int Login3()
        {
            int idUser = -1;
            try
            {
                LibDB.DALPro.ConnectionString = Core.connectionString;
               string qry = $"SELECT EmployeeId FROM Employees WHERE LastName={LibUtils.Core.DuplicaPlicas(_user)} AND Password={LibUtils.Core.DuplicaPlicas(_pwd)}";
                //string qry = $"SELECT EmployeeId FROM Employees";
                object result = LibDB.DALPro.ExecuteScalar(qry);
                List<EmployeeLogin> results = LibDB.DALPro.Query<EmployeeLogin>(qry);

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
                    Id = Convert.ToInt32(row["TerritoryID"]),
                    Nome = row["TerritoryDescription"].ToString(),
                });
            }

            return list;
        }
    }


    public class Territories
    {
        public List<EmployeeTerritories> lista {  get; set; }

        
        public Territories(int employeeId)
        {
            lista = Obter2(employeeId);
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
    
        public List<EmployeeTerritories> Obter2(int userId)
        {
            LibDB.DALPro.ConnectionString = Core.connectionString;
            string qry = $"SELECT EmployeeTerritories.EmployeeID, EmployeeTerritories.TerritoryID, TerritoryDescription " +
                    $"FROM EmployeeTerritories INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID " +
                    $"WHERE EmployeeId ='{userId}'";
            var result = LibDB.DALPro.Query<EmployeeTerritories>(qry);

            return result;

           
        }
    }


}
