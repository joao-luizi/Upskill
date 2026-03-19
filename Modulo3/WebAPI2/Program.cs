/*
✔ Swagger
✔ DTOs
✔ Repository Pattern
✔ Service Layer
✔ Transações com DALPro
✔ Separação de responsabilidades
*/


using LibNorthWind.Repositories;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi;
using Microsoft.OpenApi.Models;
using Serilog;
using System.Text;
using WebAPI_1.DTOs;
using WebAPI_1.Services;
using WebAPI_3.DTOs;
using WebAPI_3.Services;

Log.Logger = new LoggerConfiguration()
    .WriteTo.Console()
    .WriteTo.File("logs/log.txt",
        rollingInterval: RollingInterval.Day)
    .CreateLogger();


var builder = WebApplication.CreateBuilder(args);

builder.Host.UseSerilog();

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

var secret_key = builder.Configuration["App:JWT:SECRET_KEY"];
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

        ValidIssuer = "northwind",
        ValidAudience = "northwind",

        IssuerSigningKey = new SymmetricSecurityKey(key)
    };
});

//DALPro.ConnectionString = builder.Configuration["ConnectionStrings:Northwind"];
string? conn = builder.Configuration.GetConnectionString("Northwind");
if (conn == null)
    throw new Exception("Connection string Northwind não definida");

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo
    {
        Title = "jwtToken",
        Version = "v1"
    });

    options.AddSecurityDefinition("Bearer", new Microsoft.OpenApi.Models.OpenApiSecurityScheme
    {
        Description = "Enter: Bearer {your JWT token}",
        Name = "Authorization",
        In = Microsoft.OpenApi.Models.ParameterLocation.Header,
        Type = Microsoft.OpenApi.Models.SecuritySchemeType.Http,
        Scheme = "bearer"
    });

    options.AddSecurityRequirement(new Microsoft.OpenApi.Models.OpenApiSecurityRequirement
    {
        {
            new Microsoft.OpenApi.Models.OpenApiSecurityScheme
            {
                Reference = new Microsoft.OpenApi.Models.OpenApiReference
                {
                    Type = Microsoft.OpenApi.Models.ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            Array.Empty<string>()
        }
    });
});

//builder.Services.AddScoped<ProductService>();
builder.Services.AddScoped<AuthService>();
builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<IProductService, ProductService>();

builder.Services.AddAuthorization();


var app = builder.Build();

app.UseCors("cors");

app.UseSwagger();
app.UseSwaggerUI();

app.UseAuthentication();
app.UseAuthorization();

app.MapGet("/", () => "Northwind Minimal API");

app.MapPost("/login", (LoginDTO login, AuthService auth, ILogger<Program> logger) =>
{
    if (login.Username == "admin" && login.Password == "123")
    {
        var token = auth.GenerateToken(login.Username, secret_key);
        logger.LogInformation($"Endpoint /login token: {token}");

        return Results.Ok(new { token });
    }

    return Results.Unauthorized();

});

#if DEV_MODE
app.MapGet("/getModel", (string? models) =>
{
    List<string>? list = models?
    .Split(',', StringSplitOptions.RemoveEmptyEntries)
    .Select(m => m.Trim())
    .ToList();

    return DevService.GetModel(list);
});
#endif

app.MapGet("/products", (IProductService service) =>
{
    return service.GetAll();
})
.RequireAuthorization();

app.MapGet("/products/{id}", (int id, IProductService service) =>
{
    var p = service.GetById(id);

    return p == null ? Results.NotFound() : Results.Ok(p);
});

app.MapPost("/products", (ProductCreateDTO dto, IProductService service) =>
{
    int id = service.Create(dto);

    return Results.Created($"/products/{id}", new { id });
});

app.MapPut("/products/{id}", (int id, ProductCreateDTO dto, IProductService service) =>
{
    service.Update(id, dto);

    return Results.Ok();
});

app.MapDelete("/products/{id}", (int id, IProductService service) =>
{
    service.Delete(id);

    return Results.Ok();
});

app.Run();


/*
 **************
 Testar API
 **************
-> Listar produtos
GET /products

-> Obter produto
GET /products/1

-> Criar produto
POST /products
Body JSON:
{
  "productName": "Produto Teste",
  "supplierID": 1,
  "categoryID": 1,
  "unitPrice": 20,
  "discontinued": false
}

-> Atualizar produto
PUT /products/1
Body JSON:
{
  "productName": "Produto Alterado",
  "unitPrice": 30
}

-> Apagar produto
DELETE /products/1
*/

/*
select TABLE_NAME,COLUMN_NAME,DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='Products'

SELECT
'public ' +
CASE
    WHEN DATA_TYPE='int' THEN 'int'
    WHEN DATA_TYPE='nvarchar' THEN 'string'
    WHEN DATA_TYPE='decimal' THEN 'decimal?'
    WHEN DATA_TYPE='datetime' THEN 'DateTime?'
END
+ ' ' + COLUMN_NAME + ' { get; set; }'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='Products'

 */