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
                            Ficha1.Exercicio1();
                            break;
                        case 2://Arredondar
                            Ficha1.Exercicio2();
                            break;
                        case 3://isNegative
                            Ficha1.Exercicio3();
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
                            Ficha2.Exercicio1();
                            break;
                        case 2://Maximo
                            Ficha2.Exercicio2();
                            break;
                        case 3://Minimo
                            Ficha2.Exercicio3();
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
                            Ficha3.Exercicio1();
                            break;
                        case 2://randomWithin
                            Ficha3.Exercicio2();
                            break;
                        case 3://randomEven
                            Ficha3.Exercicio3();
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
                            Ficha4.Exercicio1();
                            break;
                        case 2://Arraysum
                            Ficha4.Exercicio2();
                            break;
                        case 3://Arrayfill
                            Ficha4.Exercicio3();
                            break;
                        default:
                            return inputState;
                    }
                    Console.ReadLine();
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
