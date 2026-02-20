using System.Reflection;

namespace Hero
{
    public class Character
    {
        public Character(string _name)
        {
            this.name = _name;
            this.health = 100;
        }
        private string name = "";
        private int health = 0;
        public void Attack(Character c)
        {
            int random = 0;
            Random i = new Random();
            random = i.Next(0, 20);
            c.SetHealth(random);
            Console.WriteLine(this.name + " attacks " + c.name);
            Console.WriteLine(c.name + " now has " + c.health.ToString() + " health.");
        }
        public void SetHealth(int hit) 
        {
            if (health - hit < 0)
                health = 0;
            else
                health -= hit;
        }

        public bool isAlive()
        {
            return health > 0;
        }
    }

    
    class Hero: Character
    {
        public Hero(string _name)
        {
          
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Hero hero = new("Ventura");
            Character enemy = new("Seguro");

            int turn = 0;
            while (hero.isAlive() && enemy.isAlive())
            {
                if (turn % 2 == 0)
                    hero.Attack(enemy);
                else
                    enemy.Attack(hero);
                turn++;
            }
            if (hero.isAlive())
                Console.WriteLine("O heroi venceu");
            else if (enemy.isAlive())
                Console.WriteLine("O inimigo venceu");
            else
                Console.WriteLine("Ninguem ganhou");


        }
    }
}
