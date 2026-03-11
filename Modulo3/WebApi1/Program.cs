#if false
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

var app = builder.Build();

// Configure the HTTP request pipeline.

/*
var summaries = new[]
{
    "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
};
*/

app.MapGet("/", () => "WeatherForecast API");

/*
app.MapGet("/weatherforecast", () =>
{
    var forecast = Enumerable.Range(1, 5).Select(index =>
        new WeatherForecast
        (
            DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
            Random.Shared.Next(-20, 55),
            summaries[Random.Shared.Next(summaries.Length)]
        ))
        .ToArray();
    return forecast;
});
*/
app.MapGet("/getAll", WeatherService.GetAll);
app.MapGet("/getRange", WeatherService.GetRange);

app.Run();

internal record WeatherForecast(DateOnly Date, int TemperatureC, string? Summary)
{
    public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
}

internal class WeatherService
{
    private static readonly string[] summaries =
    {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild",
        "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };

    static public WeatherForecast[] GetAll()
    {
        var forecast = new List<WeatherForecast>();

        for (int i = 1; i <= 5; i++)
        {
            forecast.Add(new WeatherForecast(
                DateOnly.FromDateTime(DateTime.Now.AddDays(i)),
                Random.Shared.Next(-20, 55),
                summaries[Random.Shared.Next(summaries.Length)]
            ));
        }

        return forecast.ToArray();
    }

    static public WeatherForecast[] GetRange(int tTotal, int tMin, int tMax)
    {
        var forecast = new List<WeatherForecast>();

        for (int i = 1; i <= tTotal; i++)
        {
            forecast.Add(new WeatherForecast(
                DateOnly.FromDateTime(DateTime.Now.AddDays(i)),
                Random.Shared.Next(tMin, tMax),
                summaries[Random.Shared.Next(summaries.Length)]
            ));
        }

        return forecast.ToArray();
    }
}
#else
using DalPro;
using WebApi1.Models;
using WebApi1.Services;

var builder = WebApplication.CreateBuilder(args);

DALPro.ConnectionString = "Server=localhost;Database=Northwind;Trusted_Connection=True;TrustServerCertificate=True";

// Add services to the container.
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<ProductService>();
//builder.Services.AddSingleton<ProductService>();
//builder.Services.AddTransient<ProductService>();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

app.MapGet("/", () => "Northwind Minimal API");

app.MapGet("/products", (ProductService service) =>
{
    return service.GetAll();
});

//app.MapGet("/products", ProductService.GetAll)
//.WithSummary("Lista todos os produtos")
//.WithDescription("Devolve todos os produtos da base de dados Northwind");


app.MapGet("/products/{id}", (int id, ProductService service) =>
{
    //if (id <= 0)
    //{
    //    return Results.BadRequest("Invalid Productg Id");
    //}
    //var product = service.GetById(id);

    //return Results.Ok(product);

    return Results.Ok(service.GetById(id));
});

app.MapPost("/productAdd", (Product p, ProductService service) =>
{
#if true
    service.Insert(p);
    return Results.Created($"/products/{p.ProductID}", p);
#else
    //Product p1 = service.Insert(p);
    //return Results.Ok(p1);
#endif
});

app.MapPost("/productUpdate", (Product p, ProductService service) =>
{
    service.Update(p);
    return Results.Ok();
    //return Results.Ok($"Updated /products/{p.ProductID}");
});

app.Run();

#endif