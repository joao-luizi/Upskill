using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hero2
{
    internal class Armor: Item
    {
        public string ArmorType { get; }
        public Armor(int _peso, string _nome, int _idOwner, int _cost, string _armortype) : base(_peso, _nome, _idOwner, _cost)
        {
            ArmorType = _armortype;
        }
    }
}
