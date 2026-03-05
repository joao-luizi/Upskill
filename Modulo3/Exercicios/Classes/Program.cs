using AppUtils;
using Northwind;
using System.Text;
using LibUtils;

namespace Classes
{
    public class Program
    {
        static void Main(string[] args)
        {
            //ClassesLiskov.Retangulo r = new ClassesLiskov.Retangulo();

            //ClassesLiskov.Teste t = new ClassesLiskov.Teste();
            //t.Testar();

            //ClassesLiskov.Teste.Testar();

            TestarNorthwind1();
        }

        static public void Teste1()
        {
            /*
            ClassesExtended.Reais.Quadrado ret1 = new ClassesExtended.Reais.Quadrado(2);
            ClassesExtended.Imaginarias.Unicornio unicornio = new ClassesExtended.Imaginarias.Unicornio();
            Console.WriteLine("Nome do objeto 1: " + ret1.Nome);

            ClassesExtended.Reais.Quadrado.Ponto pt1 = new ClassesExtended.Reais.Quadrado.Ponto();

            //ClassesExtended.Reais.Quadrado.Ponto pt2 = new ret1.Ponto();

            ClassesExtended.Reais.Quadrado.Ponto pt2 = ret1.NovoPonto();
            */

            Retangulo ret = new Retangulo(2, 4);
            Quadrado quad = new Quadrado(2);
        }

        static public void Teste2()
        {
            //Jogo.Teste.Combate();
        }

        static public void TestarNorthwind1()
        {
            try
            {
                Console.Write("User: ");
                string nome = Console.ReadLine();
                Console.Write("Password: ");
                string pwd = Console.ReadLine();

                Northwind.Core obj = new Northwind.Core(nome, pwd);
                int userId = obj.Login();

                Console.WriteLine($"Obtendo territórios de {nome}...");
                TerritoriesExt objT = new TerritoriesExt(userId);

                objT.Listar();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        static public void TestarNorthwind2()
        {
            // TODO (definir Listar(...) static)
            try
            {
                Console.Write("User: ");
                string nome = Console.ReadLine();
                Console.Write("Password: ");
                string pwd = Console.ReadLine();

                Northwind.Core obj = new Northwind.Core(nome, pwd);
                int userId = obj.Login();

                Console.WriteLine($"Obtendo territórios de {nome}...");
                Territories objT = new Territories(userId);

                AppUtils.Core.Listar(objT.lista);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        static public void TestarNorthwind3()
        {
            try
            {
                Console.Write("User: ");
                string nome = Console.ReadLine();
                Console.Write("Password: ");
                string pwd = Console.ReadLine();

                Northwind.Core obj = new Northwind.Core(nome, pwd);
                int userId = obj.Login();

                Console.WriteLine($"Obtendo territórios de {nome}...");
                Territories objT = new Territories(userId);

                objT.Listar();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        public class TerritoriesExt : Territories
        {
            public TerritoriesExt(int id) : base(id) { }

            public void Listar()
            {
                Console.WriteLine("-".Repeat(80));
                foreach (var item in lista)
                {
                    Console.WriteLine(item.Nome);
                }
            }
        }
    }
}
