using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes
{
    public class Jogo
    {
        public abstract class Item
        {
            public string Nome { get; protected set; }

            protected Item(string nome)
            {
                Nome = nome;
            }

            public abstract void Usar(Entidade alvo);
        }

        public class Pocao : Item
        {
            private int Cura { get; set; }

            public Pocao(string nome, int cura) : base(nome)
            {
                Cura = cura;
            }

            public override void Usar(Entidade alvo)
            {
                alvo.Vida += Cura;
                Console.WriteLine($"{alvo.Nome} recuperou {Cura} de vida!");
            }
        }

        public class Arma : Item
        {
            private int BonusAtaque { get; set; }

            public Arma(string nome, int bonus) : base(nome)
            {
                BonusAtaque = bonus;
            }

            public override void Usar(Entidade alvo)
            {
                if (alvo is Personagem personagem) // pattern matching com declaração de variável
                {
                    personagem.Ataque += BonusAtaque;
                    Console.WriteLine($"{personagem.Nome} equipou {Nome} (+{BonusAtaque} ataque)");
                }
            }
        }

        public class Inventario
        {
            private List<Item> itens = new();

            public void Adicionar(Item item)
            {
                itens.Add(item);
                Console.WriteLine($"{item.Nome} foi adicionado ao inventário.");
            }

            // Apenas fornece — não usa
            public Item? ObterPrimeiroItem<T>() where T : Item
            {
                //var item = itens.Find(i => i is T);

                Item? item = null;

                foreach (var i in itens)
                {
                    if (i is T)
                    {
                        item = i;
                        break;
                    }
                }

                if (item != null)
                    itens.Remove(item);

                return item;
            }
        }

        public class Entidade
        {
            public string Nome { get; set; }
            public int Vida { get; set; }

            public Entidade(string nome, int vida)
            {
                Nome = nome;
                Vida = vida;
            }

            public bool EstaVivo() => Vida > 0;
        }

        public class Personagem : Entidade
        {
            public int Ataque { get; set; }

            public Inventario Inventario { get; } = new();

            public Personagem(string nome, int vida, int ataque)
                : base(nome, vida)
            {
                Ataque = ataque;
            }

            public void Atacar(Entidade alvo)
            {
                alvo.Vida -= Ataque;
                Console.WriteLine($"{Nome} causou {Ataque} de dano em {alvo.Nome}");
            }

            public void UsarPocao()
            {
                var item = Inventario.ObterPrimeiroItem<Pocao>();

                if (item == null)
                {
                    Console.WriteLine($"{Nome} não tem poções!");
                    return;
                }

                item.Usar(this);
            }

            public void EquiparArma()
            {
                var item = Inventario.ObterPrimeiroItem<Arma>();

                if (item == null)
                    return;

                item.Usar(this);
            }
        }

        public class Teste
        {
            public static void Lutar(Personagem p1, Personagem p2)
            {
                Console.WriteLine("\nBATALHA INICIADA!\n");

                while (p1.EstaVivo() && p2.EstaVivo())
                {
                    if (p1.Vida < 40)
                        p1.UsarPocao();

                    p1.Atacar(p2);

                    if (!p2.EstaVivo())
                        break;

                    if (p2.Vida < 40)
                        p2.UsarPocao();

                    p2.Atacar(p1);

                    Console.WriteLine($"\nVida {p1.Nome}: {p1.Vida}");
                    Console.WriteLine($"Vida {p2.Nome}: {p2.Vida}");
                    Console.WriteLine("-----------------\n");
                }

                Console.WriteLine(p1.EstaVivo()
                    ? $"{p1.Nome} venceu!"
                    : $"{p2.Nome} venceu!");
            }

            public static void Combate()
            {
                const string nomeHeroi = "Arthur";
                const string nomeInimigo = "Orc";

                var heroi = new Personagem(nomeHeroi, 100, 20);
                var inimigo = new Personagem(nomeInimigo, 90, 15);

                heroi.Inventario.Adicionar(new Arma("Espada Longa", 10));
                heroi.Inventario.Adicionar(new Pocao("Poção Grande", 30));

                inimigo.Inventario.Adicionar(new Pocao("Poção Rústica", 20));

                // Equipar antes da luta
                heroi.EquiparArma();

                Console.WriteLine($"\nAtaque de {nomeHeroi} após equipar: {heroi.Ataque}\n");

                Lutar(heroi, inimigo);
            }
        }
    }
}
