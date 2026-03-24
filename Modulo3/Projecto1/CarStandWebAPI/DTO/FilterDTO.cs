namespace CarStandWebAPI.DTO
{
    public class FilterDTO
    {
        public List<long> Marcas { get; set; }
        public List<long> Modelos { get; set; }
        public List<int> Anos { get; set; }
        public List<bool> Vendido { get; set; }
    }
}
