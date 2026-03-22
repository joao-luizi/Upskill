namespace LibNorthWind.DTOs
{
    public class ProductCreateDTO
    {
        public string ProductName { get; set; } = null!;

        public int? SupplierID { get; set; }

        public int? CategoryID { get; set; }

        public decimal? UnitPrice { get; set; }
    }
}
