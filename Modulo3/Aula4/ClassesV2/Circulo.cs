using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesV2
{
    internal class Circulo : FormaGeometrica
    {
        public Circulo( double _lado) : base (_lado, _lado, "Circulo") 
        { 
        
        }
        public override double CalcularArea()
        {
            return Lado / 2 * Math.PI;
        }

    }
}
