

using LiskovFail;

namespace Classes
{
    internal class Program
    {
       
        static void Main(string[] args)
        {
            LiskovFail.Quadrado q = new LiskovFail.Quadrado();
            LiskovFail.Retangulo r = new LiskovFail.Retangulo();

            SetRect(r);
            SetRect(q);

            Console.WriteLine($"Quadrado Altura = {q.Altura}");
            Console.WriteLine($"Quadrado Largura = {q.Largura}");
            Console.WriteLine($"Quadrado Area = {q.CalcularArea()}");
            Console.WriteLine($"Rectangulo Area = {r.CalcularArea()}");


     


            LiskovFixed.Quadrado qf = new LiskovFixed.Quadrado();
            qf.Lado = 5;
            LiskovFixed.Retangulo rf = new LiskovFixed.Retangulo();
            rf.Altura = 10;
            rf.Largura = 5; ;

            PrintArea(qf);
            PrintArea(rf);
           
        }

        private static void SetRect(LiskovFail.Retangulo rect)
        {
            rect.Altura = 10;
            rect.Largura = 5;
        }

        private static void PrintArea(LiskovFixed.IForma f)
        {
            Console.WriteLine($"Forma Corrigida Area = {f.CalcularArea()}");
        }
    }
}
