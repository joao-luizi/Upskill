using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hero2
{
    internal class Input
    {
        public int GetInt(int min, int max)
        {
            int result = 0;
            while (true)
            {
               string s = Console.ReadLine();
               if (s!= null && int.TryParse(s, out result))
               {
                    if (result >= min && result <=  max)
                        return result;
               }
            }
        }
    }
}
