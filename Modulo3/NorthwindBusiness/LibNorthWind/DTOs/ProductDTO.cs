namespace LibNorthWind.DTOs
{
    public class ProductDTO
    {
        public int ProductID { get; set; }

        public string ProductName { get; set; } = null!;

        public decimal? UnitPrice { get; set; }
    }
}
