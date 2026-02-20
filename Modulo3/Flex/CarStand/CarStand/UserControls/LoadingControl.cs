using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CarStand
{
    public partial class LoadingControl : UserControl
    {
        //problems with a gif animation in a pictureBox
        //ended up creating an image from stream that blowup if i disposed of the stream
        //field set here and disposed of in Dispose()
        private Stream? stream;

        public LoadingControl()
        {
           
            InitializeComponent();
            stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("CarStand.Resources.LoadingSpinner.gif");
            if (stream != null)
                picSpinner.Image = Image.FromStream(stream);
           
        }
    }
}
