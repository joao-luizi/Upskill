using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace Classes
{
    public class Ponto : Object
    {
        public int X;
        public int Y;

        public override string ToString()
        {
            return X + " " + Y;
        }
    }
    public class TestBD
    {
        #region Duas funcões
        public static void TesteBD1()
        {
            SqlConnection connection = null;
            SqlTransaction transaction = null;

            try
            {
                string connectionString = "Server=localhost;Database=Northwind1;Trusted_Connection=True;TrustServerCertificate=True;";
                connection = new SqlConnection(connectionString);
                connection.Open();
                transaction = connection.BeginTransaction();

                string qry = "UPDATE Customers SET Final=99 WHERE CustomerId Like 'X%'";
                SqlCommand cmd = new SqlCommand(qry, connection, transaction);

                int n = cmd.ExecuteNonQuery();

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

        public static void TesteBD2()
        {
            string connectionString = "Server=localhost;Database=Northwind;Trusted_Connection=True;TrustServerCertificate=True;";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string qry = "SELECT TOP 10 * FROM Customers";
            SqlCommand cmd = new SqlCommand(qry, connection);

            SqlDataReader reader = cmd.ExecuteReader();
            //  ???? Console.WriteLine(reader.);
            int cont = 0;
            while (reader.Read())
            {
                cont++;
                Console.WriteLine($"Id: {reader["CustomerId"]}, Nome: {reader["CompanyName"]}");
            }
            Console.WriteLine($"Total de registos: {cont}");



            connection.Close();
        }
        #endregion

        public static void TesteBD3()
        {
            string connectionString = "Server=localhost;Database=Northwind;Trusted_Connection=True;TrustServerCertificate=True;";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string qry = "SELECT TOP 10 * FROM Customers";
            SqlDataAdapter adapter = new SqlDataAdapter(qry, connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            int tot = dt.Rows.Count;

            Console.WriteLine($"Total de registos: {dt.Rows.Count}");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Console.WriteLine($"Id: {dt.Rows[i]["CustomerId"]}, Nome: {dt.Rows[i]["CompanyName"]}");
            }

            string s = "";
            foreach (DataRow dr in dt.Rows)
            {
                s += dr["CustomerId"] + "5";
                Console.WriteLine($"Id: {dr["CustomerId"].ToString()}, Nome: {dr["CompanyName"]}");
            }

            connection.Close();
        }

        public static void TesteBD4()
        {
            string connectionString = "Server=localhost;Database=Northwind;Trusted_Connection=True;TrustServerCertificate=True;";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string qry = "SELECT TOP 10 * FROM Customers";
            SqlDataAdapter adapter = new SqlDataAdapter(qry, connection);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            DataTable dt = ds.Tables[0];

            int tot = dt.Rows.Count;

            Console.WriteLine($"Total de registos: {dt.Rows.Count}");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Console.WriteLine($"Id: {dt.Rows[i]["CustomerId"]}, Nome: {dt.Rows[i]["CompanyName"]}");
            }

            string s = "";
            foreach (DataRow dr in dt.Rows)
            {
                s += dr["CustomerId"] + "5";
                Console.WriteLine($"Id: {dr["CustomerId"].ToString()}, Nome: {dr["CompanyName"]}");
            }

            connection.Close();
        }

        public static void TesteBD5()
        {
            SqlConnection connection = null;
            SqlTransaction transaction = null;

            try
            {
                string connectionString = "Server=localhost;Database=Northwind;Trusted_Connection=True;TrustServerCertificate=True;";
                connection = new SqlConnection(connectionString);
                connection.Open();
                transaction = connection.BeginTransaction();

                string qry = "CREATE PROCEDURE GetClientesPorCidade\r\n    " +
                    "@Cidade NVARCHAR(50)\r\nAS\r\nBEGIN\r\n    " +
                    "SELECT ClienteId, Nome, Cidade FROM Clientes WHERE Cidade = @Cidade;\r\n" +
                    "END;\r\n";

                SqlCommand cmd = new SqlCommand(qry, connection, transaction);

                cmd.ExecuteNonQuery();

                // TODO

                qry = "DROP PROCEDURE GetClientesPorCidade";
                cmd.CommandText = qry;
                cmd.ExecuteNonQuery();

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

        public static void TesteDummy()
        {
            Ponto p = new Ponto();
            p.X = 9;
            p.Y = 5;

            object[] v = new object[5];

            v[0] = 3;
            v[1] = "abc";
            v[2] = p;

            foreach (object o in v)
            {
                Console.WriteLine(o);

                /*
                if (o != null)
                {
                    Console.WriteLine(o.ToString());
                }
                */
            }
        }
    }
}
