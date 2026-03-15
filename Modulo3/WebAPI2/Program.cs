/*
✔ Swagger
✔ DTOs
✔ Repository Pattern
✔ Service Layer
✔ Transações com DALPro
✔ Separação de responsabilidades
*/

using DalPro;
using Microsoft.AspNetCore.Mvc;
using WebAPI_1.DTOs;
using WebAPI_1.Repositories;
using WebAPI_1.Services;

var builder = WebApplication.CreateBuilder(args);

DALPro.ConnectionString = builder.Configuration.GetConnectionString("Northwind");
if (string.IsNullOrEmpty(DALPro.ConnectionString))
    throw new Exception("Connection string Northwind não definida");

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//builder.Services.AddScoped<ProductService>();
builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<IProductService, ProductService>();

builder.Services.AddCors(options =>
{
    options.AddPolicy("frontend",
        policy =>
        {
            policy
                  .AllowAnyHeader()
                  .AllowAnyMethod()
                  .AllowAnyOrigin();
        });
});

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();
app.UseCors("frontend");
app.MapGet("/", () => "Northwind Minimal API");

app.MapGet("/products", (IProductService service) =>
{
    return service.GetAll();
});

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