using Classes.ModelView;
using Ex4;

namespace ValidarLogin_DalPro
{
    internal class Program
    {
        static void Main(string[] args)
        {
            TestarValidarDalPro();
        }

        static void TestarValidarDalPro()
        {
            Console.WriteLine("A correr TestarValidarDalPro");
            try
            {
                Console.Write("User: ");
                string nome = Utils.GetInput();
                Console.Write("Password: ");
                string pwd = Utils.GetInput();

                Core obj = new Core(nome, pwd);
                int userId = obj.LoginDalPro();

                Console.WriteLine($"Obtendo territórios de {nome}...");
                List<Territory> territories = obj.ObterDalPro(userId);
                foreach (Territory t in territories)
                {
                    Console.WriteLine(t.ToString());
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
