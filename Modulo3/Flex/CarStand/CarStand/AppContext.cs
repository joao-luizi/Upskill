using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace CarStand
{
    internal class AppContext : ApplicationContext
    {
        
        //TODO: TrayIcon is not showing
        //TODO: trayIOcon has no context strip with EXit and show Main.

        private NotifyIcon trayIcon;
        private DatabaseManager _databaseManager;
        public AppContext() : base ()
        {
            _databaseManager = new DatabaseManager(new DatabaseConfiguration());
            trayIcon = new NotifyIcon
            {
                Icon = Properties.Resources.TrayIcon,
                Visible = true
            };
            var assembly = Assembly.GetExecutingAssembly();
            foreach (var name in assembly.GetManifestResourceNames())
            {
                Debug.WriteLine(name);
            }
            _ = StartAsync();
        }



        private async Task StartAsync()
        {
            SplashForm splash = new();
            splash.Show();

            var progress = new Progress<InitializationProgress>(progressReport =>
            {
                splash.UpdateStatus(progressReport.Message, progressReport.Progress); 
            });
            InitializationFinished initResult;
            try
            {
                initResult = await Task.Run(() =>
                    DatabaseInitializer.Initialize(_databaseManager, progress)
                );
            }
            catch (Exception ex)
            {
                initResult = new InitializationFinished(false, ex.Message);
            }

            splash.Close();

            if (initResult.WasSucessfull)
            {
                MainForm form = new(_databaseManager);
                form.FormClosed += OnMainFormClosed;
                form.Show();
            }
            else
            {
                MessageBox.Show(
                    $"A inicialização falhou com o seguint erro: ${initResult.Message}",
                    "CarStand",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
                ExitThread();
            }
        }
        private void OnMainFormClosed(object sender, FormClosedEventArgs e)
        {
            ExitThread();
        }

        protected override void ExitThreadCore()
        {
            if (trayIcon != null)
            {
                trayIcon.Visible = false;
                trayIcon.Dispose();
            }

            base.ExitThreadCore();
        }

    }
}
