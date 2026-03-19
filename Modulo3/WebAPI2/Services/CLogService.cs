namespace WebAPI_3.Services
{
    public class CLogService
    {
        private string _filename { get; set; }

        public CLogService(string filename)
        {
            _filename = filename;
        }

        public void Write2Log(string msg)
        {
            // TODO
        }
    }
}
