using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesLiskov
{
    public class Retangulo
    {
        public virtual double Largura { get; set; }
        public virtual double Altura { get; set; }

        public double CalcularArea()
        {
            return Largura * Altura;
        }
    }

    public class Quadrado : Retangulo
    {
        public override double Largura
        {
            set
            {
                base.Largura = value;
                base.Altura = value;
            }
        }
        public override double Altura
        {
            set
            {
                base.Largura = value;
                base.Altura = value;
            }
        }
    }

    public class Teste
    {
        int x = 1;

        public static void Testar()
        {
            //x++;

            Retangulo r = new Retangulo();
            RedimensionarRetangulo(r, "Retangulo", 10, 5);

            Quadrado q = new Quadrado();
            RedimensionarRetangulo(q, "Quadrado", 5, 10);

            Retangulo rq = new Quadrado();
            RedimensionarRetangulo(rq, "Hibrido", 10, 5);
        }

        public static void RedimensionarRetangulo(Retangulo rect, string nome, double L, double A)
        {
            rect.Altura = A;
            rect.Largura = L;

            Console.WriteLine($"");
            Console.WriteLine($"{nome}");
            Console.WriteLine($"Área esperada: {L * A}");
            Console.WriteLine($"Área calculada: {rect.CalcularArea()}");
        }
    }
}
