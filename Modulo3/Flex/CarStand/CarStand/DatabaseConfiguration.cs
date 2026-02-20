using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStand
{
    internal class DatabaseConfiguration
    {
        public string DatabaseFolderPath { get; }
        public string ConnectionString { get; }
        public string DatabaseName { get; }
        public string MasterConnectionString { get; }
        public string DatabaseFilePath { get; }
        public DatabaseConfiguration()
        {
            // Folder for DB
            string root = Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData);
            DatabaseFolderPath = Path.Combine(root, "JML", "CarStand", "DataBase");

            // Ensure folder exists
            Directory.CreateDirectory(DatabaseFolderPath);

            // Database file and name
            DatabaseName = "CarStand";
            DatabaseFilePath = Path.Combine(DatabaseFolderPath, $"{DatabaseName}.mdf");

            // Build connection strings
            ConnectionString = BuildConnectionString();
            MasterConnectionString = BuildMasterConnectionString();
        }

        private string BuildConnectionString()
        {
            var builder = new SqlConnectionStringBuilder
            {
                DataSource = @"(localdb)\MSSQLLocalDB",
                InitialCatalog = "CarStand",
                IntegratedSecurity = true,
                ConnectTimeout = 30
            };
            return builder.ConnectionString;
        }

        private string BuildMasterConnectionString()
        {
            var builder = new SqlConnectionStringBuilder
            {
                DataSource = @"(localdb)\MSSQLLocalDB",
                InitialCatalog = "master",
                IntegratedSecurity = true,
                ConnectTimeout = 30
            };
            return builder.ConnectionString;
        }
    }
}
