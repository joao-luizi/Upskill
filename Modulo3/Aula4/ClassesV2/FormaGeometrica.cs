using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesV2
{
    internal abstract class FormaGeometrica
    {
        public double Lado { get; protected set; }
        public double Altura { get; protected set; }
        public string Nome { get; protected set; }

        public FormaGeometrica(double lado, double altura, string nome)
        {
            Lado = lado;
            Altura = altura;
            Nome = nome;
        }

        public abstract double CalcularArea();

        public void MostrarDetalhes()
        {
           
            Console.WriteLine($"A forma geométrica: {Nome} tem area de {CalcularArea():F2}.");
           
        }
    }
}
