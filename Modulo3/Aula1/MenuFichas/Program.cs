namespace MenuFichas
{
    

    internal class Program
    {
        static int switchState(int inputState)
        {
            switch (inputState)
            {
                case 0:
                    int returnState = LerValorInteiro();
                    switch (returnState)
                    {
                        case 0:
                            break;
                    }
                    break;
            }
        }
        static void showMenuState(int state)
        {
            switch (state)
            {
                case 0:
                    Console.WriteLine("Selecione uma opção:\n" +
                        "1: Ficha1\n" +
                        "2: Ficha2\n" +
                        "3: Ficha3\n" +
                        "4: Ficha4\n0 Sair da aplicação");
                    break;
                case 1:
                    Console.WriteLine("Ficha1:" +
                        "\n1: TesteMediaDeDois" +
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
            }
        }

        static int LerValorInteiro()
        {
            bool fim = false;
            int resultado = 0;
            Console.WriteLine("Introduza um numero inteiro");
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
            showMenuState(state);

        }
        static void Main(string[] args)
        {
            Menu();
        }
    }
}
