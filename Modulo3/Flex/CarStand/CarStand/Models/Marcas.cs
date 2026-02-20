using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStand.Models
{
    public  class Marcas
    {
        public int ID { get; private set; }
        public string NomeMarca{ get; private set; }

        public Marcas(int id, string nomemarca)
        {
            ID = id;
            NomeMarca = nomemarca;
        }
    }
}
