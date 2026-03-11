namespace CarstandWebApi.Models
{
    public class Inspecoes
    {
        public long InspecoesID { get; set; }
        public long VeiculoID { get; set; }
        public DateTime DataDeInspecao { get; set; }
        bool Resultado { get; set; }
    }
}
