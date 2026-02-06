namespace MenuFichas
{
    

    internal class Program
    {
        static void  PrintArray(int[] array)
        {
            Console.Write("[");
            for (int i = 0; i < array.Length; i++) 
            {
                Console.Write(array[i].ToString());
            }
            Console.Write("]");
        }
        static void TestarArrayfill()
        {
            //SetupTest
            Console.WriteLine("TestarArrayreduce");
            Console.WriteLine("Selecione um tamanho para o array entre 1 e 10");
            int i = LerValorInteiro();
            while (i < 1 || i > 10)
                i = LerValorInteiro();
            int[] array = new int[i];
            int j = 0;
            while (j < i)
                array[j] = j++;
            PrintArray(array);
            Console.WriteLine();
            Console.WriteLine("Pressione qualquer tecla para continuar");
            Console.ReadLine();
        }
        static void TestarArraysum()
        {
            Console.WriteLine("TestarArraysum");
            Console.WriteLine("Pressione qualquer tecla para continuar");
            Console.ReadLine();
        }
        static void TestarArrayreduce()
        {
            Console.WriteLine("TestarArrayfill");
            Console.WriteLine("Pressione qualquer tecla para continuar");
            Console.ReadLine();
        }
        static void TestarrandomUntil()
        {
            Console.WriteLine("TestarrandomUntil");
            Console.WriteLine("Pressione qualquer tecla para continuar");
            Console.ReadLine();
        }
        static void TestarrandomWithin()
        {
            Console.WriteLine("TestarrandomWithin");
            Console.WriteLine("Pressione qualquer tecla para continuar");
            Console.ReadLine();
        }
        static void TestarrandomEven()
        {
            Console.WriteLine("TestarrandomEven");
            Console.WriteLine("Pressione qualquer tecla para continuar");
            Console.ReadLine();
        }
        static void TestarValorAbsoluto()
        {
            Console.WriteLine("TestarValorAbsoluto");
            Console.WriteLine("Pressione qualquer tecla para continuar");
            Console.ReadLine();
        }
        static void TestarMaximo()
        {
            Console.WriteLine("Testar Maximo");
            Console.WriteLine("Pressione qualquer tecla para continuar");
            Console.ReadLine();
        }

        static void TestarMinimo()
        {
            Console.WriteLine("TestarMinimo");
            Console.WriteLine("Pressione qualquer tecla para continuar");
            Console.ReadLine();
        }
        static void TestarisNegative()
        {
            Console.WriteLine("TestarisNegative");
            Console.WriteLine("Pressione qualquer tecla para continuar");
            Console.ReadLine();
        }
        static void TestarArredondar()
        {
            Console.WriteLine("TestarArredondar");
            Console.WriteLine("Pressione qualquer tecla para continuar");
            Console.ReadLine();
        }

        static void TestarMediadeDois()
        {
            Console.WriteLine("TestarMediadeDois");
            Console.WriteLine("Pressione qualquer tecla para continuar");
            Console.ReadLine();
        }
        static int SwitchState(int inputState)
        {
            int returnState = LerValorInteiro();
            switch (inputState)
            {
                case 0: //Selecionar Fichas
                    switch (returnState)
                    {
                        case 0: //Sair da aplicação
                            Console.WriteLine("Aplicação a terminar...");
                            return -1;
                        case 1: //Selecionar função da ficha 1
                        case 2:
                        case 3:
                        case 4:
                            return returnState;
                        default:
                            return inputState;
                    }
                case 1:
                    switch (returnState)
                    {
                        case 0: //Voltar ao Menu
                            return 0;
                        case 1: //MediaDeDois
                            TestarMediadeDois();
                            break;
                        case 2://Arredondar
                            TestarArredondar();
                            break;
                        case 3://isNegative
                            TestarisNegative();
                            break;
                        default:
                            return inputState;
                    }
                    return inputState;
                case 2:
                    switch (returnState)
                    {
                        case 0: //Voltar ao Menu
                            return 0;
                        case 1: //ValorAbsoluto
                            TestarValorAbsoluto();
                            break;
                        case 2://Maximo
                            TestarMaximo();
                            break;
                        case 3://Minimo
                            TestarMinimo();
                            break;
                        default:
                            return inputState;
                    }
                    return inputState;
                case 3:
                    switch (returnState)
                    {
                        case 0: //Voltar ao Menu
                            return 0;
                        case 1: //randomUntil
                            TestarrandomUntil();
                            break;
                        case 2://randomWithin
                            TestarrandomWithin();
                            break;
                        case 3://randomEven
                            TestarrandomEven();
                            break;
                        default:
                            return inputState;
                    }
                    return inputState;
                case 4:
                    switch (returnState)
                    {
                        case 0: //Voltar ao Menu
                            return 0;
                        case 1: //Arrayreduce
                            TestarArrayreduce();
                            break;
                        case 2://Arraysum
                            TestarArraysum();
                            break;
                        case 3://Arrayfill
                            TestarArrayfill();
                            break;
                        default:
                            return inputState;
                    }
                    return inputState;
            }
            return 0;
        }
        static void ShowMenuState(int state)
        {
            Console.Clear();
            switch (state)
            {
                case 0:
                    Console.WriteLine("Selecione uma opção:\n" +
                        "1: Ficha1\n" +
                        "2: Ficha2\n" +
                        "3: Ficha3\n" +
                        "4: Ficha4\n" +
                        "0 Sair da aplicação");
                    break;
                case 1:
                    Console.WriteLine("Ficha1:" +
                        "\n1: MediaDeDois" +
                        "\n2: Arredondar" +
                        "\n3: isNegative" +
                        "\n0: Voltar ao menu");
                    break;
                case 2:
                    Console.WriteLine("Ficha2:" +
                        "\n1: ValorAbsoluto" +
                        "\n2: Maximo" +
                        "\n3: Minimo" +
                        "\n0: Voltar ao menu");
                    break;
                case 3:
                    Console.WriteLine("Ficha3:" +
                        "\n1: randomUntil" +
                        "\n2: randomWithin" +
                        "\n3: randomEven" +
                        "\n0: Voltar ao menu");
                    break;
                case 4:
                    Console.WriteLine("Ficha4:" +
                        "\n1: Arrayreduce" +
                        "\n2: Arraysum" +
                        "\n3: Arrayfill" +
                        "\n0: Voltar ao menu");
                    break;
                default:
                    break;
            }
        }

        static int LerValorInteiro()
        {
            bool fim = false;
            int resultado = 0;
            while (!fim)
            {
                string s = Console.ReadLine();
                if (int.TryParse(s, out resultado))
                    break;
            }
            return resultado; 
        }
        static void Menu()
        {
            int state = 0;
            while (state != -1)
            {
                ShowMenuState(state);
                state = SwitchState(state);
            }
            
        }
        static void Main(string[] args)
        {
            Menu();
        }
    }
}
