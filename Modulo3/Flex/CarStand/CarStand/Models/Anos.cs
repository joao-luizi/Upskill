using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStand.Models
{
    public class Anos
    {
        public int ID { get; private set; }
        public string Ano { get; private set; }

        public Anos(int id, string ano)
        {
            ID = id;
            Ano = ano;
        }
    }
}
