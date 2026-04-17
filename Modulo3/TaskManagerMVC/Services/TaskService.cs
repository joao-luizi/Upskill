using System.Threading.Tasks;
using System.Xml.Linq;
using TaskManagerMVC.Models;

namespace TaskManagerMVC.Services
{
    public record TaskStats(int Total, int Completed, int Pending, int Overdue);
    public interface ITaskService
    {
        List<TaskItem> GetAll();
        TaskItem? GetById(int id);
        TaskItem Create(string title, string? description, Priority priority, DateTime? dueDate);
        bool Update(int id, string title, string? description, Priority priority, DateTime? dueDate, bool isCompleted);
        bool Delete(int id);
        bool ToggleComplete(int id);
        TaskStats GetStats();
    }

    public class InMemoryTaskService : ITaskService
    {
        private readonly List<TaskItem> _tasks = new();
        private int _nextId = 1;

        public InMemoryTaskService()
        {
            // Dados de exemplo para demonstração
            LoadData();
        }

        public List<TaskItem> GetAll()
        {
            return _tasks.OrderByDescending(t => t.Priority)
                         .ThenBy(t => t.DueDate)
                         .ThenBy(t => t.CreatedAt)
                         .ToList();
        }

        public TaskItem? GetById(int id) =>
            _tasks.FirstOrDefault(t => t.Id == id);

        public TaskItem Create(string title, string? description, Priority priority, DateTime? dueDate)
        {
            var task = new TaskItem
            {
                Id = _nextId++,
                Title = title,
                Description = description,
                Priority = priority,
                DueDate = dueDate,
                CreatedAt = DateTime.Now
            };

            _tasks.Add(task);
            return task;
        }

        public bool Update(int id, string title, string? description, Priority priority, DateTime? dueDate, bool isCompleted)
        {
            var task = GetById(id);
            if (task is null) return false;

            task.Title = title;
            task.Description = description;
            task.Priority = priority;
            task.DueDate = dueDate;
            task.IsCompleted = isCompleted;
            return true;
        }

        public bool Delete(int id)
        {
            var task = GetById(id);
            if (task is null) return false;

            _tasks.Remove(task);
            return true;
        }

        public bool ToggleComplete(int id)
        {
            var task = GetById(id);
            if (task is null) return false;

            task.IsCompleted = !task.IsCompleted;
            return true;
        }

        public TaskStats GetStats()
        {
            var total = _tasks.Count;
            var completed = _tasks.Count(t => t.IsCompleted);
            var pending = total - completed;
            var overdue = _tasks.Count(t => !t.IsCompleted && t.DueDate.HasValue && t.DueDate < DateTime.Today);
            return new TaskStats(total, completed, pending, overdue);
        }

        private void LoadData()
        {
#if true
            Create("Estudar Razor Pages", "Aprender os fundamentos de Page Models e Routing", Priority.High, DateTime.Today.AddDays(3));
            Create("Configurar base de dados", "Integrar Entity Framework Core com SQLite", Priority.Medium, DateTime.Today.AddDays(7));
            Create("Escrever testes unitários", "Cobrir os serviços com xUnit", Priority.Low, DateTime.Today.AddDays(14));

            // Uma tarefa concluída
            var done = Create("Instalar .NET Core SDK", "Descarregar e configurar o ambiente", Priority.High, DateTime.Today.AddDays(-2));
            done.IsCompleted = true;

            // Uma tarefa em atraso
            Create("Rever documentação", "Ler os guias oficiais da Microsoft", Priority.Medium, DateTime.Today.AddDays(-1));
#endif
        }
    }
}
