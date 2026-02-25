using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
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
                SqlCommand cmd = new SqlCommand(qry, connection);

                int n = cmd.ExecuteNonQuery();
                connection.Close();
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

            



            connection.Close();
        }
    }
}
