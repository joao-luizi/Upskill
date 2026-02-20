using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hero2
{
    internal class StateManager
    {
        Hero hero;
        Input input;
        public StateManager(Hero hero) 
        { 
            this.hero = hero;
            this.input = new Input();
        }

        bool exit = false;

        public void Loop()
        {
            while (!exit)
            {
                Console.WriteLine(hero.GetStatus);
                Console.WriteLine("O que fazer?");
                Console.WriteLine("1 : Descansar.");
                Console.WriteLine("2 : Patrulha.");
                Console.WriteLine("3 : Sair.");
                switch (input.GetInt(1, 3))
                {
                    case 1:
                        Console.WriteLine("O heroi descansa um pouco...");
                        break;
                    case 2:
                        Console.WriteLine("O heroi vai em patrulha...");
                        break;
                    case 3:
                        exit = true;
                        break;

                }
                
            }
        }
    }
}
