using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiskovFail
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
            set { base.Largura = value;  base.Altura = value; } 
        }
        public override double Altura 
        { 
            set { base.Largura = value; base.Altura = value; } 
        }
    }
       
}
