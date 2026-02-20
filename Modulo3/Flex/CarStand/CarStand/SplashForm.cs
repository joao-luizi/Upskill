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
    internal partial class SplashForm : Form
    {
        public void UpdateStatus(string message, int percentage)
        {
            lblInit.Text = message;
            pbarInit.Value = percentage;
        }
        public SplashForm()
        {
            InitializeComponent();
        }
    }
}
