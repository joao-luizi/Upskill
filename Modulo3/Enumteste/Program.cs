namespace Enumteste
{
    public enum Teste
    {
        UmTeste,
        DoisTeste,
        TresTeste
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            var enuma = Teste.UmTeste;
            var enumb = Teste.DoisTeste;    
            var enumc = Teste.TresTeste;

            Console.WriteLine(enuma);
            Console.WriteLine(enumb);
            Console.WriteLine(enumc);
        }
    }
}
