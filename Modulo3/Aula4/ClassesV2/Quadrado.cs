using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesV2
{
    internal class Quadrado : FormaGeometrica
    {
 
        public Quadrado(double _lado) : base(_lado, _lado, "Quadrado")
        {
          
        }

        public override double CalcularArea()
        {
            return this.Lado * this.Altura;
        }
    }
}
