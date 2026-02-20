using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiskovFixed
{
    public interface IForma
    {
        public double CalcularArea(); 
    }

    public class Retangulo : IForma
    {
        public virtual double Largura { get;  set; }
        public virtual double Altura { get;  set; }
        public Retangulo()
        {

        }
        public double CalcularArea()
        {
            return Largura *  Altura;
        }

    }

    public class Quadrado : IForma
    {
        public virtual double Lado { get; set; }
        public Quadrado()
        {

        }

        public double CalcularArea()
        {
            return Lado * Lado;
        }
    }
}
