using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ex6
{
    public static class RandomClient
    {
        private static List<string> firstNames = new()
    {
        "João", "Maria", "Pedro", "Ana", "Miguel",
        "Inês", "Ricardo", "Sofia", "Tiago", "Carla"
    };

        private static List<string> lastNames = new()
    {
        "Silva", "Santos", "Ferreira", "Pereira",
        "Costa", "Oliveira", "Martins", "Rodrigues"
    };



        public static Person GetRandomClient(Random r)
        {
            string firstName = firstNames[r.Next(firstNames.Count)];
            string lastName = lastNames[r.Next(lastNames.Count)];
            string fullName = $"{firstName} {lastName}";

            var randomSubject = subjects[r.Next(subjects.Count)];

            return new BankClient(fullName, randomSubject.Subject, randomSubject.Minutes + r.Next(randomSubject.Minutes / 2));
        }
    }
    public class Pessoa
    {
        public string Nome { get; private set; }
        public Pessoa(string nome)
        {
            Nome = nome;
        }
    }
}
