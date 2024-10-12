using api.Models;
using api.Dto;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using System.Text;
using System.Threading.Tasks;

namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class LoginController : ControllerBase
    {
        DapperContext _dapperContext;
        IConfiguration _config;
        Jwt _jwt;

        public LoginController(DapperContext dapperContext, IConfiguration configuration, Jwt jwt)
        {
            _dapperContext = dapperContext;
            _config = configuration;
            _jwt = jwt;
        }

        private bool VerifyPassword(string userPassword, string passwordSalt, string password)
        {
            string passwordSaltPlusKey = _config.GetSection("AppSettings:PasswordKey").Value + passwordSalt;
            byte[] passwordHash = KeyDerivation.Pbkdf2(
                password: userPassword,
                salt: Encoding.ASCII.GetBytes(passwordSaltPlusKey),
                prf: KeyDerivationPrf.HMACSHA512,
                iterationCount: 100000,
                numBytesRequested: 256 / 8);
            string hash = Convert.ToBase64String(passwordHash);
            return hash == password;
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginDto loginDto)
        {
            Users? user = (await _dapperContext.GetByKeyAsync<Users, string>("Email", loginDto.email)).FirstOrDefault();
            if (user != null)
            {
                if (VerifyPassword(loginDto.Password, user.PasswordSalt, user.Password))
                {
                    string token = _jwt.Create(user);
                    return Ok(new { token, user.Id });
                }
                else
                {
                    return NotFound("no such user");
                }
            }
            else
            {
                return NotFound("no such user");
            }
        }
    }
}
