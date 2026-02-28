using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
namespace ValidarPassword
{
    public class BaseDados
    {
        private static string connectionString = "Server=localhost;Database=P2_VEntrega;Trusted_Connection=True;TrustServerCertificate=True;";

        public static DataTable GetFullTable(string dataTableName)
        {
            SqlConnection connection = null;
            try
            {
                connection = new SqlConnection(connectionString);
                string qry = $"SELECT * FROM {dataTableName}" ;
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(qry, connection);
                DataTable dt = new DataTable();
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
            string qry = $"SELECT * FROM Utilizadores where ID_Utilizador = {idUser} ";

            SqlDataAdapter adapter = new SqlDataAdapter(qry, connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                return (bool)(dt.Rows[0]["Ativo"]);
            }
            connection.Close();
            return false;

        }
        public static long? VerificarPass(string user, string pass)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            long? resultId = null;
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
            connection.Close();
            return resultId;
        }
    }
}
