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
        public int ID { get; private set; }
        public string Marca { get; private set; }
        public string Modelo { get; private set; }
        public int Ano { get; private set; }

        private List<Inspecoes> _inspecoes;

        public bool Vendido { get; private set; }
        public string UltimaInspecao()
        {
            string result = "";
            if (_inspecoes == null || _inspecoes.Count == 0)
                return "Nenhuma inspecção realizada";
            //this list comes sorted from DataBase
            result += _inspecoes[0].dataInspecao.ToString("dd-MM-yyyy");
            int monthsDiff = Utilis.MonthDifference(_inspecoes[0].dataInspecao, DateTime.Now);
                if (monthsDiff > 12)
                {
                    result += " (Expirada)";
                }
                else if (monthsDiff > 10)
                {
                    result += " (A Expirar)";
                }
           return result;
        }
        public string Estado()
        {
            if (Vendido)
                return "Vendido";
            return "Disponível";
        }
        public Veiculos(int id, string marca, string modelo, int anos, List<Inspecoes> inspecoes, bool estado)
        {
            ID = id;
          Marca = marca;
            Modelo = modelo;
            Ano = anos;
            Vendido = estado;
            _inspecoes = inspecoes;
        }
        public void AddInspecao(Inspecoes inspect)
        {
            _inspecoes.Add(inspect);
        }
    }
}



