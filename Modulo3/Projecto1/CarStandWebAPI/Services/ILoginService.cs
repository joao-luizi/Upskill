using CarStandWebAPI.DTO;
using CarStandWebAPI.Models;

namespace CarStandWebAPI.Services
{
    public interface ILoginService
    {
        public string? GetToken(LoginDTO loginDTO);
    }
}
