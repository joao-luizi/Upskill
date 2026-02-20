using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes
{
    internal class Elipse
    {
        private string _nome;
        private double _lado;
        private double _altura;

       
        public Elipse(double lado, double altura, string nome) 
        { 
            _lado = lado;
            _altura = altura;
            _nome = nome;
        }

        public double CalcularArea()
        {
            double sMaior = _lado > _altura ? _lado / 2 : _altura / 2;
            double sMenor = _lado < _altura ? _lado / 2: _altura / 2; 
            return sMaior * sMenor * Math.PI ;
        }
        public void MostrarDetalhes()
        {
            Console.WriteLine("A forma :" + _nome + " tem a area de " + CalcularArea().ToString());
        }
    }
}
