using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;

namespace ClassesV2
{
    internal class Rectangulo : FormaGeometrica
    {
        public Rectangulo(double _lado, double _altura) : base (_lado, _altura, "Rectangulo") 
        { 
        
        }

        public override double CalcularArea()
        {
            return this.Lado * this.Altura;
        }
    }
}
