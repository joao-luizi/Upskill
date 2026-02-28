using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;


namespace BDv1
{
    public  class BD
    {
        public static void testeBD()
        {
            string connectionString = "Server=localhost; Trusted_Connection = True; DataBase=Northwind; TrustServerCertificate=True;";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string qry = "SELECT TOP 10 * FROM Customers";
            SqlCommand cmd = new SqlCommand(qry, connection);

            int n = cmd.ExecuteNonQuery();
            connection.Close();
        }

        public static void testeBD1()
        {
            string connectionString = "Server=localhost; Trusted_Connection = True; DataBase=Northwind; TrustServerCertificate=True;";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string qry = "SELECT TOP 10 * FROM Customers";
            SqlCommand cmd = new SqlCommand(qry, connection);

            SqlDataReader reader = cmd.ExecuteReader();
            //Console.WriteLine(reader.);
            int counter = 0;
            while(reader.Read())
            {
                Console.WriteLine($"Id: {reader["CustomerId"]}, Nome: {reader["CompanyName"]}");
                counter++;
            }
            Console.WriteLine($"Total de registos: {counter}");



            connection.Close();
        }

        public static void testeBD2()
        {
            SqlConnection connection = null;
            SqlTransaction transaction = null;

            try
            {
                string connectionString = "Server=localhost; Trusted_Connection = True; DataBase=Northwind; TrustServerCertificate=True;";
                connection = new SqlConnection(connectionString);
                connection.Open();
                transaction = connection.BeginTransaction();

                string qry = "SELECT TOP 10 * FROM Customers";
                SqlCommand cmd = new SqlCommand(qry, connection, transaction);

                int n = cmd.ExecuteNonQuery();
                connection.Close();

                transaction.Commit();
            }
            catch
            {
                try { transaction.Rollback(); } catch { }
            }
            finally
            {
                try { connection.Close(); } catch { }
            }
        }

        public static void testeBD3()
        {
            string connectionString = "Server=localhost; Trusted_Connection = True; DataBase=Northwind; TrustServerCertificate=True;";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string qry = "SELECT TOP 10 * FROM Customers";

            SqlDataAdapter adapter = new SqlDataAdapter(qry, connection);

            DataTable dt = new DataTable();
           
            adapter.Fill(dt);
            int tot = dt.Rows.Count;
            

            for (int i = 0; i < dt.Rows.Count; i++)
                Console.WriteLine($"Id: {dt.Rows[i]["CustomerID"]} Nome {dt.Rows[i]["CompanyName"]}");
            

            foreach (DataRow dr in dt.Rows)
            {
                var s = dr["CustomerId"].ToString();
                Console.WriteLine($"Id: {dr["CustomerID"]} Nome {dr["CompanyName"]}");
            }
            
            connection.Close();
        }

        public static void testeBD4()
        {
            string connectionString = "Server=localhost; Trusted_Connection = True; DataBase=Northwind; TrustServerCertificate=True;";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string qry = "SELECT TOP 10 * FROM Customers; SELECT TOP 10 * FROM Products;";

            SqlDataAdapter adapter = new SqlDataAdapter(qry, connection);

            DataSet ds = new DataSet();


            adapter.Fill(ds);
            DataTable dt = ds.Tables[0];
            int tot = dt.Rows.Count;


            for (int i = 0; i < dt.Rows.Count; i++)
                Console.WriteLine($"Id: {dt.Rows[i]["CustomerID"]} Nome {dt.Rows[i]["CompanyName"]}");


            foreach (DataRow dr in dt.Rows)
            {
                var s = dr["CustomerId"].ToString();
                Console.WriteLine($"Id: {dr["CustomerID"]} Nome {dr["CompanyName"]}");
            }

            connection.Close();
        }


        public static void testeDB5()
        {
            SqlConnection connection = null;
            SqlTransaction transaction = null;
            try
            {
                string connectionString = "Server=localhost; Trusted_Connection = True; DataBase=Northwind; TrustServerCertificate=True;";
                connection = new SqlConnection(connectionString);
                connection.Open();
                transaction = connection.BeginTransaction();

                string sQry = "CREATE PROCEDURE GetClientesPorCidade " +
                    "@Cidade NVARCHAR(50) AS " +
                    "BEGIN " +
                    "SELECT ClienteId, Nome, Cidade FROM Clientes WHERE Cidade = @Cidade;" +
                    "END; ";

                SqlCommand cmd = new SqlCommand(sQry, connection, transaction);
                cmd.ExecuteNonQuery();

                // TODO

                sQry = "DROP PROCEDURE GetClientesPorCidade;";

                cmd = new SqlCommand (sQry, connection, transaction);
                cmd.ExecuteNonQuery();

                transaction.Commit();
            }
            catch 
            {
                try { transaction.Rollback();  } catch { }
            }
            finally
            {

                try { connection.Close();  } catch { }
                
            }

        }
        public class Ponto
        {
            public int x;
            public int y;

            public override string ToString()
            {
               
                return x + " " + y;
            }
        }
        public static void TesteDummy()
        {
            Ponto p = new Ponto();
            p.x = 9;
            p.y = 5;
            object[] v = new object[5];
            v[0] = 3;
            v[1] = "abc";
            v[2] = p;
            
            
            foreach (object o in v)
            {
                Console.WriteLine(o);
                //Console.WriteLine(o.ToString());
            }
        }
    }
}
