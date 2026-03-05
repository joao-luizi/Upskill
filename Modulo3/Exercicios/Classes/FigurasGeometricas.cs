using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes
{
    public abstract class FigurasGeometricas
    {
        public string Nome { get; protected set; }

        public abstract double CalcularArea();

        public virtual void MostrarDetalhes()
        {
            Console.WriteLine($"Figura: {Nome}");
            Console.WriteLine($"Area: {CalcularArea():F2}");
        }
    }

    public class Retangulo : FigurasGeometricas
    {
        public double Largura { get; protected set; }
        public double Altura { get; private set; }

        public Retangulo(double largura, double altura)
        {
            Nome = "Retangulo";
            Largura = largura;
            Altura = altura;
        }

        public override double CalcularArea()
        {
            return Largura * Altura;
        }

        public override void MostrarDetalhes()
        {
            base.MostrarDetalhes();
            Console.WriteLine($"Largura: {Largura}, Altura: {Altura}");
        }
    }

    public class Quadrado : FigurasGeometricas
    {
        public double Largura { get; protected set; }

        public Quadrado(double largura)
        {
            Nome = "Quadrado";
            Largura = largura;
        }

        public override double CalcularArea()
        {
            return Largura * Largura;
        }

        public override void MostrarDetalhes()
        {
            Console.WriteLine($"Figura: {Nome}");
            Console.WriteLine($"Area: {CalcularArea():F2}");
        }
    }
}
