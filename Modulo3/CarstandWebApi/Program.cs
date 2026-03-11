using DalPro;

namespace CarstandWebApi
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddAuthorization();
            builder.Services.AddCors();


            builder.Services.AddScoped<CarStandServices>();
            var app = builder.Build();
            app.UseCors(policy =>
                policy.AllowAnyOrigin()
                      .AllowAnyHeader()
                      .AllowAnyMethod());

            // Configure the HTTP request pipeline.

            app.UseAuthorization();


            DALPro.ConnectionString = "Server=localhost;Database=Upskill_Project1;Trusted_Connection=True;TrustServerCertificate=True";

            app.MapGet("/Modelos", (CarStandServices service) =>
            {
                return service.GetAllModels();
            });

            app.Run();
        }
    }
}
