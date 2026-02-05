

namespace Tabuada
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
        static void Main(string[] args)
        {
            
            Console.WriteLine(TabuadaTable(2, 1, 10));
        }
    }
}
