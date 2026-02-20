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
        public MainForm(DatabaseManager _databaseManager)
        {
            _loadingControl = new LoadingControl();
            _loadingControl.Dock = DockStyle.Fill;

            _mainView = new MainView();
            _mainView.Dock = DockStyle.Fill;
            
            this._databaseManager = _databaseManager;
            InitializeComponent();
        }

        private void SwitchView(UserControl newView)
        {
            MainPanel.Controls.Clear();
            MainPanel.Controls.Add(newView);
        }
        private void MainForm_Load(object sender, EventArgs e)
        {
            SwitchView(_loadingControl);
            //run the task of getting all records from veicules (Repecting Paging)
            
           

        }
    }
}
