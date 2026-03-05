using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesExtended
{
    namespace Reais
    {
        public class Quadrado
        {
            public class Ponto
            {
                public int x;
                public int y;
            }
            public string Nome { get; private set; }
            public double Largura { get; private set; }

            public Quadrado(double largura)
            {
                Nome = "Quadrado";
                Largura = largura;

                Ponto p = new Ponto();
            }

            public Ponto NovoPonto()
            {
                return new Ponto();
            }
            public double CalcularArea()
            {
                return Largura * Largura;
            }

            public void MostrarDetalhes()
            {
                Console.WriteLine($"Figura: {Nome}");
                Console.WriteLine($"Area: {CalcularArea():F2}");
            }
        }
    }

    namespace Imaginarias
    {
        public class Unicornio
        {

        }
    }
}
