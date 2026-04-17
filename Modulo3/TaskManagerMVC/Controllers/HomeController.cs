using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TaskManagerMVC.Models;
using TaskManagerMVC.Services;

namespace TaskManagerMVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ITaskService _taskService;

        public HomeController(ITaskService taskService, ILogger<HomeController> logger)
        {
            _taskService = taskService;
            _logger = logger;
        }

        [HttpGet]
        public IActionResult Index()
        {
            var recentTasks = _taskService.GetAll().Take(5).ToList();
            ViewBag.RecentTasks = recentTasks;
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
