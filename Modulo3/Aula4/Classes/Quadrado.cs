using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes
{
    internal class Quadrado
    {
        private string _nome;
        private double _lado;
        private double _altura;
        public Quadrado(double lado, double altura, string nome)
        {
            _lado = lado;
            _altura = altura;
            _nome = nome;
        }

        public double CalcularArea()
        {
            return _lado * _altura;
        }
        public void MostrarDetalhes()
        {
            Console.WriteLine("A forma :" + _nome + " tem a area de " + CalcularArea().ToString());
        }
    }
}
