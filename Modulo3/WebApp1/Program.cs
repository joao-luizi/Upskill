using System.Reflection.Metadata.Ecma335;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
// Add services to the container.

var app = builder.Build();
app.UseSwagger();
app.UseSwaggerUI();
// Configure the HTTP request pipeline.

//var summaries = new[]
//{
//    "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
//};

app.MapGet("/", () =>  "WeatherForecast API" );

app.MapGet("/getAll", WeatherService.GetAll);

app.MapGet("/getRange", WeatherService.GetRange);


//app.MapGet("/weatherforecast", () =>
//{
//    var forecast = Enumerable.Range(1, 5).Select(index =>
//        new WeatherForecast
//        (
//            DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
//            Random.Shared.Next(-20, 55),
//            summaries[Random.Shared.Next(summaries.Length)]
//        ))
//        .ToArray();
//    return forecast;
//});



app.Run();

internal record WeatherForecast(DateOnly Date, int TemperatureC, string? Summary)
{
    public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
}

internal class WeatherService
{
    private static readonly string[] summaries = new[]
    {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };
    public static WeatherForecast[] GetAll()
    {
        var forecast =new List<WeatherForecast>();

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

    public static WeatherForecast[] GetRange(int tTotal, int tMin, int tMax)
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
