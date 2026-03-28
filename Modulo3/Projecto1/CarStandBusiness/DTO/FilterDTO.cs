namespace CarStandBusiness.DTO
{
    public class FilterDTO
    {
        public List<long> Marcas { get; set; } = null!;
        public List<long> Modelos { get; set; } = null!;
        public List<int> Anos { get; set; } = null!;
        public List<bool> Vendido { get; set; } = null!;
    }
}
