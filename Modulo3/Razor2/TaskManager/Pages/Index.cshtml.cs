using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using TaskManager.Models;
using TaskManager.Service;

namespace TaskManager.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        private List<TaskItem> _tasks = new();
        private ITaskService _taskService;
        public IndexModel(ILogger<IndexModel> logger,ITaskService taskService)
        {
            _logger = logger;
            _taskService = taskService;
        }

        public List<TaskItem> Recenttasks = new();
        public void OnGet()
        {
            Recenttasks = _taskService.GetAll().Take(5).ToList();
        }
    }
}
