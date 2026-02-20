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
            if (_inspecoes == null)
                return "Nenhuma inspecção realizada";
            else
            {
                DateTime inspecdate = _inspecoes[0].dataInspecao;
                // Verificar differencia 
                return inspecdate.ToString("dd-mm-yyyy");
            }
        }

        public Veiculos(int id, string )
        {
            ID = id;
          
        }
    }
}
//[VeiculoID] BIGINT IDENTITY(1,1) NOT NULL,
//[MarcaID] INT NOT NULL,
//[ModeloID] INT NOT NULL,
//[Ano] INT NOT NULL,
//[InspecaoID] BIGINT NULL,
//[Vendido] BIT NOT NULL CONSTRAINT [DF_Veiculos_Vendido] DEFAULT ((0)),