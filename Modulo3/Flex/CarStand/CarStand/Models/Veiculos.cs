using CarStand.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace CarStand.Models
{
    public  class Veiculos
    {
        public long ID { get; private set; }
        public string Marca { get; private set; }
        public string Modelo { get; private set; }
        public int Ano { get; private set; }

        public string UltimaInspecao { get; private set; }
        
        private List<Inspecoes> _inspecoes;

        public bool Vendido { get; private set; }

        public string Estado
        {
            get
            {
                if (Vendido)
                    return "Vendido";
                return "Disponível";
            }
        }
        private void SetUltimaInspecao()
        {
            if (_inspecoes == null || _inspecoes.Count == 0)
            {
                UltimaInspecao = "Nenhuma inspecção realizada";
                return;
            }

            // Get the latest inspection date
            DateTime lastDate = _inspecoes.Max(i => i.dataInspecao);

            string result = lastDate.ToString("dd-MM-yyyy");

            int monthsDiff = Utilis.MonthDifference(lastDate, DateTime.Now);

            if (monthsDiff > 12)
            {
                result += " (Expirada)";
            }
            else if (monthsDiff > 10)
            {
                result += " (A Expirar)";
            }

            UltimaInspecao = result;
        }

        public Veiculos(long id, string marca, string modelo, int anos, List<Inspecoes> inspecoes, bool estado)
        {
            ID = id;
          Marca = marca;
            Modelo = modelo;
            Ano = anos;
            Vendido = estado;
            _inspecoes = inspecoes;
             SetUltimaInspecao();
        }
        public void AddInspecao(Inspecoes inspect)
        {
            _inspecoes.Add(inspect);
            SetUltimaInspecao();
        }
    }
}



