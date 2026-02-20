using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesV2
{
    internal class Elipse : FormaGeometrica
    {
        public Elipse(double _lado, double _altura) : base (_lado, _altura, "Elipse") 
        { 
        
        }
        public override double CalcularArea()
        {
            double sMaior = Lado > Altura ? Lado / 2 : Altura / 2;
            double sMenor = Lado < Altura ? Lado / 2 : Altura / 2;
            return sMaior * sMenor * Math.PI;
        }
    }
}
