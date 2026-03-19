using CarStandWebAPI.DTO;
using CarStandWebAPI.Models;
using CarStandWebAPI.Repositories;

namespace CarStandWebAPI.Services
{
    public class LoginService :ILoginService
    {

        private readonly IUserRepository _repo;
        private readonly ILogger<LoginService> _logger;
        private readonly AuthService _auth;

        public LoginService(ILogger<LoginService> logger, IUserRepository repo, AuthService auth)
        {
            _repo = repo;
            _logger = logger;
            _auth = auth;
        }

        public string? GetToken(LoginDTO loginDTO)
        {
            var user = _repo.GetByLogin(loginDTO.UserName, loginDTO.Password);

            if (user == null)
                return null;

            return _auth.GenerateToken(user.UserName, user.Role);
        }

    }
}
