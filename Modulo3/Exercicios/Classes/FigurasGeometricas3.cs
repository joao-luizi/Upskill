using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesInterface
{
    public interface IFigurasGeometrica
    {
        public string Nome { get; }

        public double CalcularArea();

        protected void MostrarDetalhes()
        {
            Ecran();
        }

        private void Ecran()
        {
            Console.WriteLine($"Figura: {Nome}");
            Console.WriteLine($"Area: {CalcularArea():F2}");
        }
    }

    public class Retangulo : IFigurasGeometrica
    {
        public string Nome { get; protected set; }

        public double Largura { get; private set; }
        public double Altura { get; private set; }

        public Retangulo(double largura, double altura)
        {
            Nome = "Retangulo";
            Largura = largura;
            Altura = altura;
        }

        public double CalcularArea()
        {
            return Largura * Altura;
        }

        public void MostrarDetalhes()
        {
        }
    }

    public class Quadrado : Retangulo
    {
        public Quadrado(double lado) : base(lado, lado)
        {
            Nome = "Quadrado";
        }

        public new void MostrarDetalhes()
        {
            Console.WriteLine($"Area: {CalcularArea():F2}");
            base.MostrarDetalhes();
        }
    }
}
