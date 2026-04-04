using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;

namespace WebAppRazor1.Pages.Contactos
{
    public class IndexModel : PageModel
    {
        [BindProperty]
        public ContactoInputModel Formulario  { get; set; } = new();
        private readonly ILogger<IndexModel> _logger;

        public IndexModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }

        public string texto { get; set; }
        public void OnGet()
        {
        }
        public void OnPost()
        {
            texto = "Olá";
            
        }

        public class ContactoInputModel
        {
            [Required(ErrorMessage = "O nome é obrigatório")]
            [StringLength(100, MinimumLength = 2)]
            public string Nome { get; set; } = string.Empty;

            [Required(ErrorMessage = "O email é obrigatório")]
            [EmailAddress(ErrorMessage = "Formato de email inválido")]
            public string Email { get; set; } = string.Empty;

            [Required(ErrorMessage = "O assunto é obrigatório")]
            [StringLength(200, MinimumLength = 5)]
            public string Assunto { get; set; } = string.Empty;

            [Required(ErrorMessage = "A mensagem é obrigatória")]
            [MinLength(10, ErrorMessage = "A mensagem deve ter pelo menos 10 caracteres")]
            [DataType(DataType.MultilineText)]
            public string Mensagem { get; set; } = string.Empty;
        }
    }
}
    



