using System.Security.Claims;
using System.Text;
using api.Models;
using Microsoft.IdentityModel.JsonWebTokens;
using Microsoft.IdentityModel.Tokens;
namespace api;
public class Jwt
{
    IConfiguration _config;
    public Jwt(IConfiguration configuration)
    {
        _config = configuration;
    }
    public string Create(Users user)
    {
        string key = _config.GetSection("AppSettings:JwtKey").Value ?? "defaultkef$32rtyAppSettings";
        SymmetricSecurityKey SecurityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
        var tokenDescriptor = new SecurityTokenDescriptor
        {
            Subject = new ClaimsIdentity([
                new Claim(JwtRegisteredClaimNames.Name, user.Email),
                new Claim(JwtRegisteredClaimNames.Aud, user.Type),
                new Claim(JwtRegisteredClaimNames.Jti, user.Id.ToString())
            ]),
            Expires = DateTime.Now.AddDays(1),
            SigningCredentials = new SigningCredentials(SecurityKey, SecurityAlgorithms.HmacSha256Signature)
        };
        JsonWebTokenHandler handler = new JsonWebTokenHandler();
        string token = handler.CreateToken(tokenDescriptor);
        return token;
    }
}