using Ex1;
using System.Data;

namespace ValidarPassword
{
    internal class Program
    {
        //Obras disponiveis
        static void Main(string[] args)
        {
            long? userId = null;
            
            Console.Clear();
            userId = null;
            while (userId == null)
            {
                Console.Clear();
                Console.WriteLine("Introduza o Utilizador:");
                string user = Utils.GetInput();
                Console.WriteLine("Introduza a Password:");
                string pass = Utils.GetInput();
                userId = BaseDados.VerificarPass(user, pass);
                if (userId == null)
                {
                    Console.WriteLine("Utilizador não encontrado ou password errada.");
                    Utils.PressToContinue();
                    continue;
                }
                if (!BaseDados.isActiveUser((long)userId))
                {
                    Console.WriteLine("O seu utilizador está inativo.");
                    Utils.PressToContinue();
                    userId = null;
                    continue;
                }
                DataTable obras = BaseDados.GetFullTable("Obras");
                if (obras.Rows.Count == 0)
                {
                    Console.WriteLine("Não existem obras a mostrar");
                    break;
                }
                foreach (DataRow dr in obras.Rows)
                    Console.WriteLine($"ISBN: {dr["ISBN"]}, do autor {dr["Autor"]} com o Titulo: {dr["Titulo"]}");

            }
        }
    }
}
