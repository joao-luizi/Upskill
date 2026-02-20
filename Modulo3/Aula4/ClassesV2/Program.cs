using System.Drawing;

namespace ClassesV2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Quadrado q = new(2.0);
            Circulo c = new(2.0);
            Rectangulo r = new(2.0, 4.0);
            Elipse e = new(2.0, 4.0);
            q.MostrarDetalhes();
            c.MostrarDetalhes();
            r.MostrarDetalhes();
            e.MostrarDetalhes();

          
        }
    }
}
