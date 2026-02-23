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

        public void SetMarcas(List<Marcas> newLst)
        {
            List<Marcas> list = [];
            list.Add(new Marcas(0, "Todos as Marcas"));
            list.AddRange(newLst);
            cbMarcas.DataSource = list;
            cbMarcas.DisplayMember = nameof(Marcas.NomeMarca);
            cbMarcas.ValueMember = nameof(Marcas.ID);
        }

        public void SetAno(List<int> newLst)
        {
            List<string> list = new();
            list.Add("Todos os anos"); // Todos
            list.AddRange(newLst.Select(a => a.ToString()));
            cbAnos.DataSource = list;
        }

        public void SetEstado()
        {
            List<string> list = ["Todos os estados", "Disponivel", "Vendido"];
            cbEstado.DataSource = list;
        }

        public MainView()
        {
            
            InitializeComponent();
            SetModelos(new List<Modelos>());
            SetMarcas(new List<Marcas>());
            SetEstado();
            SetAno(new List<int>());

        }

        public EventHandler<PesquisaArgs>? pesquisaHandler;
        private void BtPesquisa_Click(object sender, EventArgs e)
        {
            int filterMarcas = cbMarcas.SelectedValue is int m ? m : 0;
            int filterModelos = cbModelos.SelectedValue is int mo ? mo : 0;
            string filterAnos = cbAnos.SelectedValue as string ?? "Todos os anos";
            string filterEstado = cbEstado.SelectedValue as string ?? "Todos os estados";

            PesquisaArgs args = new(
                filterMarcas,
                filterModelos,
                filterAnos,
                filterEstado);

            pesquisaHandler?.Invoke(this, args);
        }
    }

}
