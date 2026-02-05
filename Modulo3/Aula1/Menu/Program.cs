using System.ComponentModel.Design;

namespace Menu
{
    
    internal class Program
    {
        static int calc(int x, int y)
        {
            return x * y;
        }
        static string TabuadaLine(int x, int y)
        {
            string txt = "";
            txt = x + " X " + y + " = " + calc(x, y) + "\n";
            return txt;
        }
        static string TabuadaTable(int x, int ti, int tf)
        {
            string result = "";
            int i = ti;
            while (ti <= tf)
            {
                result += TabuadaLine(x, ti);
                ti++;
            }

            return result;
        }
        

           
        
        static void Teste1()
        {
            Console.WriteLine("A correr teste 1");
        }
        static void Teste2() 
        {
            Console.WriteLine("A correr Teste 2");
        }
        static void Teste3() 
        {
            Console.WriteLine("A correr Teste 3");
        }

        static void Tabuada()
        {   
            Console.WriteLine(TabuadaTable(2, 1, 20));
        }
        static void Menu()
        {
            int input = 0;
            bool exit = false;
            while (!exit)
            {
                Console.WriteLine("Selecione uma opção:\n1 : Teste1\n2 : Teste2\n3 : Teste3\n4 : Tabuada\n0 : Sair da aplicação\n");
                string s = Console.ReadLine();
                if (int.TryParse(s, out input ))
                {
                    switch (input)
                    {
                        case 0: 
                            exit = true; 
                            break;
                        case 1:
                            Teste1();
                            break;
                        case 2:
                            Teste2();
                            break;
                        case 3:
                            Teste3();
                            break;
                        case 4:
                            Tabuada();
                            break;
                        default: 
                            Console.WriteLine("Selecione uma opção!");
                            break;

                    }
                }
            }
            Console.WriteLine("Exiting");

        }
        static void Main(string[] args)
        {
            Menu();
        }
    }
}
