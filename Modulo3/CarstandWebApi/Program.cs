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
            //app.UseCors(policy =>
            //    policy.AllowAnyOrigin()
            //          .AllowAnyHeader()
            //          .AllowAnyMethod());
            builder.Services.AddCors(options =>
            {
                options.AddPolicy("frontend", policy =>
                {
                    policy.AllowAnyMethod();
                    policy.AllowAnyHeader();
                    policy.AllowAnyOrigin();
                });
            });
            // Configure the HTTP request pipeline.
            var app = builder.Build();
            
            app.UseCors("frontend");
            app.UseAuthorization();
            DALPro.ConnectionString = "Server=localhost;Database=Upskill_Project1;Trusted_Connection=True;TrustServerCertificate=True";

            app.MapGet("/", () => "CarStand");

            app.MapGet("/modelos", (CarStandServices service) =>
            {
                return service.GetAllModels();
            });

            app.MapGet("/marcas", (CarStandServices service) =>
            {
                return service.GetAllMarcas();
            });

            app.MapGet("/inspecoes", (CarStandServices service) =>
            {
                return service.GetAllInspect();
            });

            app.MapGet("/veiculos", (CarStandServices service) =>
            {
                return service.GetAllVeiculos();
            });

            app.Run();
        }
    }
}
