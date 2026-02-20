using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace CarStand
{
    internal class DatabaseManager(DatabaseConfiguration config)
    {
        private readonly DatabaseConfiguration _config = config;

        public bool DatabaseExistsInMaster()
        {
            string sql = "SELECT database_id FROM sys.databases WHERE name = @dbName";
            try
            {
                using SqlConnection connection = new(_config.MasterConnectionString);
                connection.Open();
                using SqlCommand cmd = new(sql, connection);
                cmd.Parameters.AddWithValue("@dbName", _config.DatabaseName);
                object result = cmd.ExecuteScalar();
                return result != null;
            }
            catch (SqlException)
            {
                return false;
            }
        }

        public void DropDatabaseIfExistsInMaster()
        {
            using var connection = new SqlConnection(_config.MasterConnectionString);
            connection.Open();

            string sql = $@"
            IF EXISTS (SELECT 1 FROM sys.databases WHERE name = '{_config.DatabaseName}')
            BEGIN
                ALTER DATABASE [{_config.DatabaseName}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
                DROP DATABASE [{_config.DatabaseName}];
            END";

            using var command = new SqlCommand(sql, connection);
            command.ExecuteNonQuery();
        }

        public bool CreateDatabase()
        { 
            string sql = $@"CREATE DATABASE [{_config.DatabaseName}]
                ON (NAME = N'{_config.DatabaseName}',
                FILENAME = '{_config.DatabaseFilePath}')";
            return ExecuteSql(sql, _config.MasterConnectionString);
        }


        public static bool ExecuteSql(string sql, string conn)
        {
            try
            {
                using SqlConnection connection = new(conn);
                connection.Open();
                using SqlCommand command = new(sql, connection);
                command.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool ExecuteSqlScript(string resourceName)
        {

            try
            {
               using Stream? stream = Assembly.GetExecutingAssembly().GetManifestResourceStream(resourceName);

               if (stream == null)
               {
                    throw new Exception("Stream Null Exception");
               }

               using StreamReader reader = new(stream);
               string script = reader.ReadToEnd();
               return ExecuteSql(script, _config.ConnectionString);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool CheckCriticalTablesExist()
        {
            // List all critical tables here
            string sql = @"
            SELECT COUNT(*) 
            FROM sys.tables 
            WHERE name IN ('Veiculos', 'Marcas', 'Inspecoes', 'Modelos')";

            try
            {
                using SqlConnection connection = new(_config.ConnectionString);
                connection.Open();
                using SqlCommand command = new(sql, connection);

                int count = (int)command.ExecuteScalar();

                return count == 4;
            }
            catch
            {
                return false;
            }
        }

    }
}
