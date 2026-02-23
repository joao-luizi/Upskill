using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStand.Models
{
    public  class Inspecoes
    {
        public int ID { get; private set; }
        public DateTime dataInspecao { get; private set; }

        public bool Resultado { get; private set; }
        public Inspecoes(int id, DateTime datainspecao, bool resultado)
        {
            ID = id;
            dataInspecao = datainspecao;
            Resultado = resultado;
        }
    }
}
