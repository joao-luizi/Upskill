using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStand.Models
{
    public class Modelos
    {
        public int ID { get; private set; }
        public string NomeModelo { get; private set; }

        public Modelos(int id, string nomeModelo ) 
        {
            ID = id;
            NomeModelo = nomeModelo;
        }
    }
}
