using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStand
{
    public class Utilis
    {
        public static int MonthDifference(DateTime start, DateTime end)
        {
            //Month here will be an amount of 30 days
            DateTime temp;
            if (start > end)
            {
                temp = end;
                end = start;
                start = temp;
            }
            return (end - start).Days / 30;
        }
    }
}
