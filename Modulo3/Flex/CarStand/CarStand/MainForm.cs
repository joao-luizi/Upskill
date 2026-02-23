using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
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

            _mainView = new MainView();
            _mainView.pesquisaHandler += OnPesquisaRequested;
            _mainView.Dock = DockStyle.Fill;
            
            this._databaseManager = _databaseManager;
            this._pageRequest = new PageRequest(new PesquisaArgs(0, 0, "Todos os anos", "Todos os estados"),6);
            InitializeComponent();
        }

        private void OnPesquisaRequested(object? sender, PesquisaArgs args)
        {
            //Pass the PesquisaArgs to DataBaseManager and get the results of the query
            this._pageRequest.ApplyNewFilters(args);

        }

        private void SwitchView(UserControl newView)
        {
            MainPanel.Controls.Clear();
            MainPanel.Controls.Add(newView);
        }
        private void MainForm_Load(object sender, EventArgs e)
        {
            SwitchView(_loadingControl);
            //Get the data required to Set MainView Properly. 
            //MainView lives as reference in _mainView
           

        }

        private async Task LoadDataAsync()
        {
           

            var result = await _databaseManager.GetPagedResult(_pageRequest);

            //_mainView.SetData(result.Items);
            //UpdateStatusStrip(result.TotalCount);

            
        }
        private async void LoadDefaults()
        {
            try
            {
                Task<List<Models.Modelos>> modelosTask = _databaseManager.GetModelosAsync();
                Task<List<Models.Marcas>> marcasTask = _databaseManager.GetMarcasAsync();
                Task<List<int>> anosTask = _databaseManager.GetAnosAsync();

                // Wait for all three queries in parallel
                await Task.WhenAll(modelosTask, marcasTask, anosTask);
                _mainView.SetMarcas(marcasTask.Result);
                _mainView.SetModelos(modelosTask.Result);
                _mainView.SetAno(anosTask.Result);
                _mainView.SetEstado();
              
                SwitchView(_mainView);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Erro ao carregar dados iniciais: {ex.Message}");
               
            }
        }
    }
}
