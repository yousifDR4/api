using System.Text;
using Microsoft.IdentityModel.JsonWebTokens;
using Microsoft.IdentityModel.Tokens;

namespace api
{
    public class JwtMiddleware
    {
        private IConfiguration _config;
        public TokenValidationParameters tokenValidationParameters;
        public JwtMiddleware(IConfiguration config)
        {
            _config = config;
            string key = _config.GetSection("AppSettings:JwtKey").Value ?? "defaultkef$32rtyAppSettings";
            SymmetricSecurityKey SecurityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
            tokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = SecurityKey,
                ValidateIssuer = false,
                ValidateAudience = false
            };
        }
    }

}