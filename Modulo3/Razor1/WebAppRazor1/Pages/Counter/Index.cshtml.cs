using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace WebAppRazor1.Pages.Counter
{
    public class IndexModel : PageModel
    {
        public int counter { get; set; }
        public void OnGet()
        {
        }

        public void OnPost()
        {
            counter++;
        }
    }
}
