using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStand
{
    internal class InitializationProgress
    {
        public string Message { get; set; }
        public int Progress { get; set; }

        public InitializationProgress(string message, int progress)
        {
            Message = message;
            Progress = progress;
        }
    }
}
