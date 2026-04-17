using myTinyWebSite.Models;

namespace myTinyWebSite.Service
{
    public interface IContactService
    {
        public Contact? GetById(int id);
        public Contact CreateContact(string _nome, string _email, string _assunto, string? _comment);
        public bool UpdateContact(int id, string _nome, string _email, string _assunto, string? _comment);
        public bool DeleteById(int id);
    }
    public class ContactService:IContactService
    {
        private List<Contact> _contacts = new();

        private int _lastId;
        private readonly ILogger<ContactService> _logger;
        public ContactService(ILogger<ContactService> logger)
        {
            if (_contacts.Count > 0)
                _lastId = _contacts.Max(x => x.Id);
            else
                _lastId = 0;
                _logger = logger;
        }

        

        public Contact? GetById(int id)
        {
            return _contacts.FirstOrDefault(x => x.Id == id);
        }

        public Contact CreateContact(string _nome, string _email, string _assunto, string? _comment)
        {
            var _contact = new Contact()
            {
                Id = ++_lastId,
                Nome = _nome,
                Email = _email,
                Assunto = _assunto,
                Comment = _comment

            };
            
            _contacts.Add(_contact);

            return _contact;
        }

        public bool UpdateContact(int id, string _nome, string _email, string _assunto, string? _comment)
        {
            var contact = GetById(id);
            if (contact == null)
                return false;
            contact.Nome = _nome;
            contact.Email = _email;
            contact.Assunto = _assunto;
            contact.Comment = _comment;
            return true;
        }
        public bool DeleteById(int id)
        {
            var toDelete = _contacts.FirstOrDefault(x => x.Id == id);
            if (toDelete == null)
                return false;

            _contacts.Remove(toDelete);
            return true;
        }

    }
}
