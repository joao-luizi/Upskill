namespace CarstandWebApi.Models
{
    public class Veiculos
    {
        public long VeiculoID { get; set; }
        public int MarcaID { get; set; }
        public int ModeloID { get; set; }
        public int Ano { get; set; }
        public int InspecaoID { get; set; }
        public bool Vendido { get; set; }
    }
}
