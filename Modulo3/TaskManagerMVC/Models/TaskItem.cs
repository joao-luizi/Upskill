namespace TaskManagerMVC.Models
{
    public class TaskItem
    {
        public int Id { get; set; }

        // [Required] e outras DataAnnotations funcionam diretamente com Razor Pages
        public string Title { get; set; } = string.Empty;

        public string? Description { get; set; }

        public bool IsCompleted { get; set; }

        public Priority Priority { get; set; } = Priority.Medium;

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        public DateTime? DueDate { get; set; }
    }

    public enum Priority
    {
        Low = 1,
        Medium = 2,
        High = 3
    }
}
