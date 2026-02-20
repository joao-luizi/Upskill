using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStand
{
    internal class InitializationFinished
    {
        public bool WasSucessfull { get; }
        public string Message {  get; }

        public InitializationFinished(bool sucess, string message)
        {
            WasSucessfull = sucess;
            Message = message;
        }
    }
}
