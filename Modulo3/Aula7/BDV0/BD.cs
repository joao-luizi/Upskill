using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDV0
{
    public  class BD
    {
        //Active Data Objects


        public static void testeBD()
        {
            string connectionString = "Server=localhost; Trusted_Connection = True; DataBase=Northwind; TrustServerCertificate=True;";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string qry = "SELECT TOP 10 * FROM Customers";
            SqlCommand cmd = new SqlCommand(qry, connection);
           
            SqlDataReader reader = cmd.ExecuteReader();
            connection.Close();
        }
        
    }
}
