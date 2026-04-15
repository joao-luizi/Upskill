using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.VisualBasic;
using System.ComponentModel.DataAnnotations;

namespace myTinyWebSite.Pages.Contact
{
    public class IndexModel : PageModel
    {

        private readonly IContactService _contactService;

        public IndexModel(IContactService contactService)
        {
            _contactService = contactService;
        }

        [BindProperty]
        [Required(ErrorMessage = "O nome é obrigatório.")]
        [MaxLength(100, ErrorMessage = "O nome não pode ter mais de 100 caracteres.")]
        [Display(Name = "Nome")]
        public string Nome { get; set; } = string.Empty;

        [BindProperty]
        [Required(ErrorMessage = "O email é obrigatório.")]
        [MaxLength(100, ErrorMessage = "O email não pode ter mais de 100 caracteres.")]
        [Display(Name = "email")]
        public string Email { get; set; } = string.Empty;

        [BindProperty]
        [Required(ErrorMessage = "O assunto é obrigatório.")]
        [MaxLength(100, ErrorMessage = "O assunto não pode ter mais de 100 caracteres.")]
        [Display(Name = "Assunto")]
        public string Assunto { get; set; } = string.Empty;

        [BindProperty]
        [MaxLength(400, ErrorMessage = "O nome não pode ter mais de 400 caracteres.")]
        [Display(Name = "Comentário")]
        public string Comment { get; set; } = string.Empty;
        public void OnGet()
        {
        }

        public IActionResult OnPost() 
        { 
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _taskService.Create(Title, Description, Priority, DueDate);

            TempData["Message"] = $"Tarefa \"{Title}\" criada com sucesso!";

            // PRG Pattern: Post → Redirect → Get
            // Evita submissão duplicada ao recarregar a página
            return RedirectToPage("Index");

        }
    }
}
