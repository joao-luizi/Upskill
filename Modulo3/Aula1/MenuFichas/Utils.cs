using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MenuFichas
{
    internal class Utils
    {
        public static int sum(int[] v)
        {
            int tot = 0;
            for (int i = 0; i < v.Length; i++)
                tot += v[i];
            return tot;
        }
    }
}
