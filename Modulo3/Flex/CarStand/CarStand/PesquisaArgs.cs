using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStand
{
    public class PesquisaArgs : EventArgs
    {
        public int FilterMarcas { get; private set; }
        public int FilterModelos { get; private set; }

        public string FilterAnos { get; private set; }

        public string FilterEstado { get; private set; }
        public PesquisaArgs(int filterMarcas, int filterModelos, string filterAnos, string filterEstado)
        {
            FilterMarcas = filterMarcas;
            FilterModelos = filterModelos;
            FilterAnos = filterAnos;
            FilterEstado = filterEstado;
        }

    }
}
