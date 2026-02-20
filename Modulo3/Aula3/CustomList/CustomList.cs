using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CustomList
{
    internal class CustomList<T>
    {
        private T[] array;


        public int Count { get { return array.Length; } }
        public CustomList()
        {
            array = new T[0];
        }

        public void Add(T s)
        {
            array = array.Append(s).ToArray();         
        }

        public void Remove(T s)
        {
            if (array.Any(x => EqualityComparer<T>.Default.Equals(x, s)))
            {
                
                T[] newArr = new T[array.Length - 1];
                bool first = true;
                int j = 0;
                for (int i = 0; i < array.Length; i++)
                {
                    if (EqualityComparer<T>.Default.Equals(array[i],s) && first == true)
                    {
                        first = false;
                        continue;
                    }
                    newArr[j++] = array[i];
                }
                array = newArr;
            }
            
            
        }
    }
}
