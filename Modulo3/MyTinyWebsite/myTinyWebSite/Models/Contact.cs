namespace myTinyWebSite.Models
{
    public class Contact
    {
        public int Id { get; set; }
        public string Nome { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;

        public string Assunto { get; set; } = string.Empty;

        public string? Comment { get; set; } = null;
    }
}
