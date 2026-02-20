using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hero2
{
    internal class Item
    {
        private int peso;
        private string name;
        private int owner;
        private int cost;

        public int GetPeso { get { return peso; } }
        public string GetName{ get { return name; } }
        public Item(int _peso, string _name, int _owner, int _cost)
        {
            peso = _peso;
            name = _name;
            owner = _owner;
            cost = _cost;
        }
    }
}
