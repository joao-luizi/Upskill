using Microsoft.AspNetCore.Mvc;

namespace TaskManagerMVC.Controllers
{
    public class TasksController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
