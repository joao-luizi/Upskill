using CarStand.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CarStand
{
    public partial class MainView : UserControl
    {
        
        public void SetModelos(List<Modelos> newLst)
        {
            List<Modelos> list = [];
            list.Add(new Modelos(0, "Todos os Modelos"));
            list.AddRange(newLst);
            cbModelos.DataSource = list;
            cbModelos.DisplayMember = nameof(Modelos.NomeModelo);
            cbModelos.ValueMember = nameof(Modelos.ID);
        }
       
        public MainView()
        {
            
            InitializeComponent();
            SetModelos(new List<Modelos>());
        }

        public EventHandler<PesquisaArgs>? _pesquisaHandler;
        private void btPesquisa_Click(object sender, EventArgs e)
        {
            string filterMarcas = cbMarcas.Text;
            
            //string filterModelos = cbModelos.Text;
            string filterAnos = cbAnos.Text;
            string filterEstado = cbEstado.Text;
            //_pesquisaHandler?.Invoke(this, new PesquisaArgs());
        }
    }

    public class PesquisaArgs : EventArgs
    {
        public PesquisaArgs(string filterMarcas, string filterModelos, string filterAnos, string filterEstado)
        {

        }

    }
}
