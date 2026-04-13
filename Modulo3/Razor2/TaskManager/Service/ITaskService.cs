using TaskManager.Models;

namespace TaskManager.Service
{
    public interface ITaskService
    {
        public List<TaskItem> GetAll();
    }

    public class TaskService : ITaskService
    {
        
        private readonly List<TaskItem> _tasks = new();

        public TaskService()
        {
            //LoadData();
        }

        public List<TaskItem> GetAll()
        {
            return _tasks.OrderByDescending(x => x.id).ToList();
        }
    }
}
