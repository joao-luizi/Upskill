namespace Hero2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Weapon weapon = new Weapon(10, "Novice Sword of Bashing", 0, 100, "Sword");
            Armor armor = new Armor(10, "Novice Armor of Avoidance", 0, 100, "Leather");

            Hero heroi = new Hero("Heroi", 1);
            Console.WriteLine(heroi.GetStatus);
            heroi.SetWeapon(weapon);
            heroi.SetArmor(armor);
            
            StateManager manage = new StateManager(heroi);
            manage.Loop();

            Console.WriteLine("Exiting. Come back soon...\n");
            
        }
    }
}
