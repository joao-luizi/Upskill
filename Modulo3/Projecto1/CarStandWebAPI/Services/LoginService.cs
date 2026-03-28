using CarStandBusiness.DTO;
using CarStandBusiness.Models;
using CarStandBusiness.Repositories;

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

        public string? GetToken(LoginDTO loginDTO, string tag)
        {
            var user = _repo.GetByLogin(loginDTO.UserName, loginDTO.Password, tag);

            if (user == null)
                return null;

            return _auth.GenerateToken(user.UserName, user.Role);
        }

    }
}
