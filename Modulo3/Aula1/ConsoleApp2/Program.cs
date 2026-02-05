namespace ConsoleApp2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Console.WriteLine("Diga o Seu nome");
            //string s = Console.ReadLine();
            //Console.WriteLine("Hello," + s + "!");

            int numero = 0;
            bool fim = false;
            string[] entradas = new string[20];
 
            int pos = -1;
            while (!fim)
            {
                Console.Write("Diga um numero: ");
                string s = Console.ReadLine();
                try
                {
                    numero = Int32.Parse(s);
                    Console.WriteLine("O numero é " + s);
                    fim = true;
                }
                catch
                {
                    entradas[++pos] = s;
                    Console.WriteLine("Deve indicar um numero");
                }            
            }
            Console.WriteLine(pos >= 0 ? "O numero de entradas inválidas foi " + (pos + 1).ToString() + "!" : "Não houve entradas invalidas!");
            for (int i = 1; i <= pos + 1; i++) 
            {
                Console.WriteLine(i.ToString() + ": " + entradas[i - 1]);
            }
        }
    }
}
