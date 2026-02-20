using System.Threading;

namespace CarStand
{
    internal static class Program
    {
        const string mutexName = "Local\\CarStand_SingleInstance"; 
        //Local is the default. It makes the mutex session scoped to user not global.
        //if the intention is to make it one instance across all users change Local\\ to Global\\.
        static Mutex? mutex;
        // we require a mutex to detect another instance of the program already launched
        private static bool EnsureSingleInstance()
        {
            bool createdNew;

            mutex = new Mutex(true, mutexName, out createdNew);

            if (!createdNew)
            {
                MessageBox.Show(
                    "Aplicação já se encontra a correr.",
                    "CarStand",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information);

                // TODO: Bring existing instance to foreground
                return false;
            }

            return true;
        }

        [STAThread]
        static void Main()
        {
           
            if (!EnsureSingleInstance())
                return;
            
            try
            {
                ApplicationConfiguration.Initialize();
                Application.Run(new AppContext());
            }
            finally
            {
                if (mutex != null)
                {
                    mutex.ReleaseMutex();
                    mutex.Dispose();
                }
            }

        }
    }
}