using Northwind;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibUtils
{
    public class Core
    {
        public static string DuplicaPlicas(string txt, string sep = "'")
        {
            string resultado = txt;

            //TODO

            return sep + resultado + sep;
        }
    }

    public class DB
    {
    }

    public static class ObjExtensions
    {
        public static string Repeat(this string value, int count)
        {
            if (string.IsNullOrEmpty(value) || count <= 0)
                return string.Empty;

            StringBuilder sb = new StringBuilder(value.Length * count);

            for (int i = 0; i < count; i++)
            {
                sb.Append(value);
            }

            return sb.ToString();
        }
    }
}
