using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MenuFichas
{
    internal class Ficha4
    {
        public static void Exercicio1()
        {
            int[] numbers = [4, 3, 2, 1];
            int sum = numbers[0];
            sum += numbers[1];
            sum += numbers[2];
            sum += numbers[3];
            Console.WriteLine("Valor da soma = " + sum);
        }
        
        public static void Exercicio2()
        {
            int[] numbers = [4, 3, 2, 1];
            Utils.sum(numbers);
            Console.WriteLine("Resultado = " + numbers[0]);
        }
        public static void Exercicio3()
        {
            int[] digits = [10];
            for (int i = 0; i < digits.Length; i++)
            {
                digits[i] = i;
            }

        }

    }
}
