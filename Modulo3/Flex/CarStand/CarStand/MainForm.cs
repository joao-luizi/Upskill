using CarStand.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CarStand
{
    internal partial class MainForm : Form
    {
        private DatabaseManager _databaseManager;

        private LoadingControl _loadingControl;

        private MainView _mainView;

        private PageRequest _pageRequest;
        public MainForm(DatabaseManager _databaseManager)
        {
            _loadingControl = new LoadingControl();
            _loadingControl.Dock = DockStyle.Fill;
            _loadingControl.Visible = true;
            _mainView = new MainView();
            _mainView.pesquisaHandler += OnPesquisaRequested;
            _mainView.Dock = DockStyle.Fill;
            _mainView.Visible = false;
            this._databaseManager = _databaseManager;
            this._pageRequest = new PageRequest(new PesquisaArgs(0, 0, "Todos os anos", "Todos os estados"), 6);
            InitializeComponent();
        }

        private void OnPesquisaRequested(object? sender, PesquisaArgs args)
        {
            //Pass the PesquisaArgs to DataBaseManager and get the results of the query
            this._pageRequest.ApplyNewFilters(args);

        }

        private void SwitchView()
        {
            _loadingControl.Visible = !_loadingControl.Visible;
            _mainView.Visible = !_mainView.Visible;
     
        }
        private async void MainForm_Load(object sender, EventArgs e)
        {
            MainPanel.Controls.AddRange(new Control[] { _loadingControl, _mainView });

            try
            {
                await LoadDefaults(); // <-- await the async Task properly
            }
            catch (Exception ex)
            {
                // This is a safety net: any exception escaping LoadDefaults
                MessageBox.Show($"Erro crítico ao carregar dados iniciais: {ex.Message}");
            }
        }


        private async Task LoadDefaults()
        {
            try
            {
                // Start all async tasks in parallel
                var modelosTask = _databaseManager.GetModelosAsync();
                var marcasTask = _databaseManager.GetMarcasAsync();
                var anosTask = _databaseManager.GetAnosAsync();
                var veiculosTask = _databaseManager.GetPagedResult(_pageRequest);

                // Await all tasks in parallel, exceptions propagate correctly
                await Task.WhenAll(modelosTask, marcasTask, anosTask, veiculosTask);

                // Access results safely after awaiting
                _mainView.SetMarcas(await marcasTask);
                _mainView.SetModelos(await modelosTask);
                _mainView.SetAno(await anosTask);
                _mainView.SetEstado();
                _mainView.SetVeiculos(await veiculosTask);

                SwitchView();
            }
            catch (Exception ex)
            {
                // This will now always be triggered if any task fails
                MessageBox.Show($"Erro ao carregar dados iniciais: {ex.Message}");
            }
        }
        private async void CallRecreate()
        {
                SwitchView();
                await Task.Run(() =>
                    _databaseManager.RecreateDataBase()
                );
                SwitchView();

        }
        private void reInicializarBDToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Tem a certeza que deseja (re)inicializar todos os veiculos?", 
                "Reinicializar BD", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                CallRecreate();
            }
        }
    }
}
