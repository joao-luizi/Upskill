using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace WebAPI_3.Services
{
    public class AuthService
    {
        public string GenerateToken(string username, string JWTKey)
        {
            try
            {
                var key = new SymmetricSecurityKey(
                    Encoding.UTF8.GetBytes(JWTKey));

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
