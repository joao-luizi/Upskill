using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ValidarPassword
{
    public class BaseDados
    {
        private static string connectionString = "Server=localhost;Database=P2_VEntrega;Trusted_Connection=True;TrustServerCertificate=True;";

        public static DataTable? GetFullTable(string dataTableName)
        {
            SqlConnection connection = null;
            DataTable dt = null;
            try 
            {
                connection = new SqlConnection(connectionString);
                string qry = $"SELECT * FROM {dataTableName}" ;
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(qry, connection);
                dt = new DataTable();
                dt.TableName = dataTableName;
                adapter.Fill(dt);

            }
            catch 
            {
                throw new Exception("Isto é so um exemplo do prof");
            }
            finally
            {
                try {
                    if (connection != null && connection.State != ConnectionState.Open)
                    {
                        connection.Close();
                    }
                } catch { }
            }
            return dt;
        }
        public static bool isActiveUser(long idUser)
        {
            
            SqlConnection connection = new SqlConnection(connectionString);
            bool result = false;
            try
            {
                string qry = $"SELECT * FROM Utilizadores where ID_Utilizador = {idUser} ";
                SqlDataAdapter adapter = new SqlDataAdapter(qry, connection);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                    result = (bool)(dt.Rows[0]["Ativo"]);
            }
            catch
            {

            }
            finally
            {
                connection.Close();
            }
            return result;

        }
        public static long? VerificarPass(string user, string pass)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            long? resultId = null;
            try
            {
                connection.Open();
                string qry = $"SELECT * FROM Utilizadores where UserName = '{user}' " +
                    $"AND PassWord = '{pass}'";

                SqlDataAdapter adapter = new SqlDataAdapter(qry, connection);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                     resultId = (long)(dt.Rows[0]["ID_Utilizador"]);
                }
            }
            catch 
            { 
            
            }
            finally
            {
                connection.Close();
            }
            return resultId;
        }

        public static long? VerificarPassBySP(string user, string pass)
        {
            SqlConnection conn = null;
            SqlTransaction transaction = null;
            long? result = null;
            try
            {

                string queryCreate = "CREATE PROCEDURE tempValPass\r\n\t" +
                    $" @util NVARCHAR(50),\r\n\t@pass NVARCHAR(50)\r\nAS\r\nBEGIN\r\n\t" +
                    $" SELECT * FROM Utilizadores WHERE UserName = @util AND PassWord = @pass;\r\n" +
                    $" END";

                conn = new SqlConnection(connectionString);
                conn.Open();
                transaction = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand(queryCreate, conn, transaction);
                cmd.ExecuteNonQuery();

                string SPExecute = $"tempValPass";

                cmd = new SqlCommand(SPExecute, conn, transaction);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@util", user);
                cmd.Parameters.AddWithValue("@pass", pass);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (result != null)
                        throw new Exception("Dois utilizadores encontrados");
                    result = (long)reader["ID_Utilizador"];
                }
                reader.Close();
                reader.Dispose();


                string queryDelete = $"DROP PROCEDURE tempValPass";
                cmd = new SqlCommand(queryDelete, conn, transaction);
                cmd.ExecuteNonQuery();
                transaction.Commit();
            }
            catch
            {
                if (transaction != null)
                    transaction.Rollback();
            }
            finally
            {
                if (conn != null)
                    conn.Close();
            }
            return result;
        }
    }
}
