using CarStand.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.DirectoryServices.ActiveDirectory;
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
        //SetVeiculos
        public void SetVeiculos(PagedResult<Veiculos> veiculosLsdt)
        {
           dgvMain.Columns["Marca"].DataPropertyName = nameof(Veiculos.Marca);
           dgvMain.Columns["Modelo"].DataPropertyName = nameof(Veiculos.Modelo);
           dgvMain.Columns["Ano"].DataPropertyName = nameof(Veiculos.Ano);
           dgvMain.Columns["Inspecao"].DataPropertyName = nameof(Veiculos.UltimaInspecao);
           dgvMain.Columns["Estado"].DataPropertyName = nameof(Veiculos.Estado);
           dgvMain.AutoGenerateColumns = false;
           dgvMain.DataSource = veiculosLsdt.Items;
        }
        public void SetModelos(List<Modelos> newLst)
        {
            var list = new List<Modelos> { new Modelos(0, "Todos as Modelos") };
            if (newLst != null && newLst.Count > 0)
            {
                foreach (var m in newLst)
                {
                    if (!list.Any(x => x.ID == m.ID))
                        list.Add(m);
                }
            }
            cbModelos.DataSource = null;
            cbModelos.Items.Clear();
            cbModelos.DataSource = list;
            cbModelos.DisplayMember = nameof(Modelos.NomeModelo);
            cbModelos.ValueMember = nameof(Modelos.ID);
        }

        public void SetMarcas(List<Marcas> newLst)
        {
            // Create a new list with the "Todos as Marcas" first
            var list = new List<Marcas> { new Marcas(0, "Todos as Marcas") };

            // Only add new items that are not already in the list
            if (newLst != null && newLst.Count > 0)
            {
                foreach (var m in newLst)
                {
                    if (!list.Any(x => x.ID == m.ID))
                        list.Add(m);
                }
            }

          
            cbMarcas.DataSource = null;
            cbMarcas.Items.Clear();
            cbMarcas.DataSource = list; 
            cbMarcas.DisplayMember = nameof(Marcas.NomeMarca);
            cbMarcas.ValueMember = nameof(Marcas.ID);

            cbMarcas.SelectedIndex = 0;      
        }

        public void SetAno(List<int> newLst)
        {
            List<string> list = new();
            list.Add("Todos os anos"); // Todos
            list.AddRange(newLst.Select(a => a.ToString()));
            cbAnos.DataSource = null;
            cbAnos.Items.Clear();
            cbAnos.DataSource = list;
        }

        public void SetEstado()
        {
            List<string> list = ["Todos os estados", "Disponivel", "Vendido"];
            cbEstado.DataSource = null;
            cbEstado.Items.Clear();
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
