using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hero2
{
    internal class Weapon : Item
    {
        public string WeaponType { get; }
        public Weapon(int _peso, string _nome, int _idOwner, int _cost, string _weaponType) : base(_peso, _nome, _idOwner, _cost)
        {
            WeaponType = _weaponType;
        }
    }
}
