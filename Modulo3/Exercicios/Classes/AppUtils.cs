using Classes.ModelView;
using Northwind;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppUtils
{
    public class Core
    {
        public static void Listar(List<Territory> lista)
        {
            foreach (var t in lista)
            {
                Console.WriteLine($"{t.Id}\t{t.Nome}");
            }
        }
    }
    public static class ObjExtensions
    {
        public static void Listar(this Territories territories)
        {
            foreach (var t in territories.lista)
            {
                Console.WriteLine($"{t.Id}\t{t.Nome}");
            }
        }
    }
}
