using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hero2
{
    internal class Hero :Character
    {
        private Weapon? weapon = null;
        private Armor? armor = null;

        private int health;
        public string GetStatus
        {
            get
            {
                string result = "";
                if (weapon == null)
                    result += "Hero has no weapon.\n";
                else
                    result += "Hero is wielding " + weapon.GetName + " (Type: " + weapon.WeaponType + ").\n";
                if (armor == null)
                    result += "Hero has no armor.";
                else
                    result += "Hero is wearing " + armor.GetName + " (Type: " + armor.ArmorType + ")\n";
                return result;
            }       
        }
        public Hero(string name, int id) :base(name, id) 
        {
            health = 100;
        }

        public void SetWeapon(Weapon weapon)
        {
            this.weapon = weapon;
            Console.WriteLine(this.Name + " equips " + weapon.GetName);
        }

        public void SetArmor(Armor armor)
        {
            this.armor = armor;
            Console.WriteLine(this.Name + " equips " + armor.GetName);
        }
    }
}
