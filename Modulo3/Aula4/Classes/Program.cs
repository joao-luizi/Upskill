namespace Classes
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Quadrado q = new (2.0, 2.0, "Quadrado");
            Rectangulo r = new (2.0, 2.0, "Rectangulo");
            Circulo c = new (2.0, 2.0, "Circulo");
            Elipse e = new(2.0, 4.0, "Elipse");

            q.MostrarDetalhes();
            r.MostrarDetalhes();
            c.MostrarDetalhes();
            e.MostrarDetalhes();
        }
    }
}
