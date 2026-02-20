namespace CustomList
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<string> list = new List<string>();
            list.Add("1");

            CustomList<string> lst = new();
            lst.Add("Primeiro");
            lst.Add("Segundo");
            lst.Add("Terceiro");
            lst.Add("Terceiro");
            lst.Remove("Terceiro");
        }
    }
}
