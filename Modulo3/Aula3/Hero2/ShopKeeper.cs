using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hero2
{
    internal class ShopKeeper : Character
    {
        private Inventory inventory = new();
        
        public int Gold { get; set; }
        public ShopKeeper(string name, int id, Inventory inventory) : base(name, id)
        {
            this.inventory = inventory;
            Gold = 1000;
        }

        public ShopKeeper(string name, int id) : base(name, id)
        {
            Gold = 1000;
        }

        public void AddToInventory(Item item)
        {
            inventory.AddItem(item);
        }
        public void RemoveFromInventory(Item item) 
        { inventory.RemoveItem(item); }

        public void Buy(Item item, int price)
        {
            if (Gold >= price)
            {
                AddToInventory(item);
                Gold -= price;
            }
        }

        public void Sell(int id, int price)
        {
            inventory.RemoveItem(inventory.GetItem(id));
        }


    }
}
