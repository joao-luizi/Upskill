using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace ClassesV3
{
    public interface IFigurasGeometricas
    {
        public string Nome {  get;  set; }
      
        public double CalcularArea();

        public void MostrarDetalhes();
    }

    public class Retangulo : IFigurasGeometricas
    {
        public string Nome {  get;  set; }
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
            Console.WriteLine($"Figura: {Nome}");
            Console.WriteLine($"Area: {CalcularArea():F2}");

        }

        public class Quadrado : Retangulo
        {
            public Quadrado(int lado) :base(lado, lado)
            {
                base.Nome = "Quadrado";
            }
        }
    }
}
