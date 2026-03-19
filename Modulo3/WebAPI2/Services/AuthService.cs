using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace WebAPI_3.Services
{
    public class AuthService
    {
        public string GenerateToken(string username)
        {
            try
            {
                var key = new SymmetricSecurityKey(
                    Encoding.UTF8.GetBytes("UPSKILL_SUPER_SECRET_KEY_123456789"));

                var creds = new SigningCredentials(
                    key,
                    SecurityAlgorithms.HmacSha256);

                var claims = new[]
                {
            new Claim(ClaimTypes.Name, username)
        };

                var token = new JwtSecurityToken(
                    issuer: "northwind",
                    audience: "northwind",
                    claims: claims,
                    expires: DateTime.Now.AddHours(2),
                    signingCredentials: creds);

                return new JwtSecurityTokenHandler().WriteToken(token);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.StackTrace);
            }

            return null;
        }
    }
}
