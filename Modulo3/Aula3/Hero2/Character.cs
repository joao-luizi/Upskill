using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hero2
{
    internal class Character
    {
        private string _name;
        private int _id;
        
        public string Name { get { return _name; } }
        public int Id { get{ return _id;} }
        public Character(string name, int id)
        {
            _name = name;
            _id = id;
        }
    }
}
