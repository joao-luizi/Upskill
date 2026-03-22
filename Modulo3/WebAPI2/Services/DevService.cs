
using System.Reflection;
using System.Text;


namespace WebAPI_3.Services
{
    public class DevService
    {
    #if DEV_MODE
    public static string GetModel(List<string>? models)
        {
            return LibNorthWind.Repositories.DevRepository.DevService.GetModel(models);
        }
#endif
    }
}
