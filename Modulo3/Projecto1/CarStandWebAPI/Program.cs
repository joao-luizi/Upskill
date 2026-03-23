using CarStandWebAPI.DTO;
using CarStandWebAPI.Models;
using CarStandWebAPI.Repositories;
using CarStandWebAPI.Services;
using DalPro;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Serilog;
using System.Security.Claims;
using System.Text;

namespace CarStandWebAPI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Log.Logger = new LoggerConfiguration()
            .WriteTo.Console()
            .WriteTo.File("logs/log.txt",
                rollingInterval: RollingInterval.Day)
            .CreateLogger();

            var builder = WebApplication.CreateBuilder(args);
            builder.Host.UseSerilog();

            // Add services to the container.
            builder.Services.AddCors(options =>
            {
                options.AddPolicy("cors",
                    policy =>
                    {
                        policy
                            .AllowAnyOrigin()
                            .AllowAnyMethod()
                            .AllowAnyHeader();
                    });
            });
            string? conn = builder.Configuration.GetConnectionString("CarStand") ?? throw new Exception("Connection string for CarStand não definida"); 
            string? secret_key = builder.Configuration["App:JWT:SECRET_KEY"] ?? throw new Exception("secret_key string não definida");
            DALPro.ConnectionString = conn;
            var key = Encoding.UTF8.GetBytes(secret_key);
            builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = "CarStand",
                    ValidAudience = "CarStand",
                    IssuerSigningKey = new SymmetricSecurityKey(key),

                    RoleClaimType = ClaimTypes.Role,
                    NameClaimType = ClaimTypes.Name
                };
            });
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();
            builder.Services.AddAuthorization();
            builder.Services.AddScoped<AuthService>();
            builder.Services.AddScoped<IUserRepository, UserRepository>();
            builder.Services.AddScoped<ILoginService, LoginService>();

            var app = builder.Build();

            app.UseCors("cors");
            #if DEV
            app.UseSwagger();
            app.UseSwaggerUI();
            #endif
            app.UseAuthentication();
            app.UseAuthorization();



            // Configure the HTTP request pipeline.

            app.MapGet("/", () => "Carstand Minimal API");

            app.MapGet("/me", (ClaimsPrincipal user) =>
            {
                return Results.Ok(new
                {
                    username = user.Identity?.Name,
                    role = user.FindFirst(ClaimTypes.Role)?.Value
                });
            }).RequireAuthorization();

            #if MockLogin
            app.MapPost("/login", (LoginDTO login, AuthService auth, ILogger<Program> logger) =>
            {
                if (login.UserName == "admin" && login.Password == "123")
                {
                    var token = auth.GenerateToken(login.UserName, "admin");
                    logger.LogInformation($"Mock Endpoint /login token: {token}");

                    return Results.Ok(new { token });
                }

                return Results.Unauthorized();

            });
            #else
            app.MapPost("/login", (LoginDTO login, ILoginService service, ILogger<Program> logger) =>
            {
                var token = service.GetToken(login);
                if (token == null)
                    return Results.Unauthorized();
                logger.LogInformation($"Endpoint /login token: {token}");
                return Results.Ok(new { token });
            });
            #endif
            app.Run();
        }
    }
}
