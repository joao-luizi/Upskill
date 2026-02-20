using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Http.Headers;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace CarStand
{
    internal static class DatabaseInitializer
    {
 
        public static InitializationFinished Initialize(DatabaseManager manager,
                      IProgress<InitializationProgress> progress)
        {
            
            try
            {
                progress.Report(new InitializationProgress("Checking database...", 10));
                if (!manager.DatabaseExistsInMaster())
                {
                    manager.DropDatabaseIfExistsInMaster();
                    progress.Report(new InitializationProgress("Creating database...", 30));
                    bool created = manager.CreateDatabase();
                    if (!created)
                        return new InitializationFinished(false, "Database Creation Failed");

                    progress.Report(new InitializationProgress("Creating schema...", 50));
                    if (!CreateDatabaseSchema(manager))
                        return new InitializationFinished(false, "Schema creation failed.");

                    progress.Report(new InitializationProgress("Seeding data...", 70));
                    if (!SeedData(manager))
                        return new InitializationFinished(false, "Seeding failed.");

                }

                progress.Report(new InitializationProgress("Validating schema...", 80));
                if (!ValidateSchema(manager))
                    return new InitializationFinished(false, "Schema validation failed");


                progress.Report(new InitializationProgress("Done", 100));
                Thread.Sleep(1000);
                return new InitializationFinished(true, "");
            }
            catch (Exception ex)
            {
                return new InitializationFinished(false, ex.Message);
            }
        }

        private static bool CreateDatabaseSchema(DatabaseManager manager)
        {
            
            return manager.ExecuteSqlScript("CarStand.DataBase.Scripts.CreateTablesAndRelationships.sql");
        }

        private static bool SeedData(DatabaseManager manager)
        {
            return manager.ExecuteSqlScript("CarStand.DataBase.Scripts.SeedData.sql");
        }
        private static bool ValidateSchema(DatabaseManager manager)
        {
            return manager.CheckCriticalTablesExist();
        }
    }
}
