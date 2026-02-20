using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hero2
{
    internal class Inventory
    {
        private int currPeso;
        private List<Item> items = [];
        public Inventory()
        { 
            this.currPeso = 0;
        }

        public void AddItem(Item item)
        {
            items.Add(item);
            currPeso += item.GetPeso;
        }
        public void RemoveItem(Item item) 
        { 
            items.Remove(item);
            currPeso -= item.GetPeso < 0 ? 0 : currPeso -= item.GetPeso;
        }

        public Item GetItem(int index) 
        { 
            Item temp = items[index];
            RemoveItem(temp);
            return temp;
        }

        public string ShowItems()
        {
            if (items.Count == 0)
                return "Inventory has no items.";
            string result = "";
            for (int i = 0; i < items.Count; i++)
                result += "[" + i + 1 + "]: " + items[i].GetName;
            return result;
        }
    }
}
