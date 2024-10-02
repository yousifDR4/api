using api.Models;
using api.Dto;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using System.Text;
namespace api.Controllers;
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
    private bool verfiyPassword(string UserPassword, string PasswordSalt, string password)
    {

        string PasswordSaltpluskey = _config.GetSection("AppSettings:PasswordKey").Value + PasswordSalt;
        byte[] PasswordHash = KeyDerivation.Pbkdf2(
      password: UserPassword,
            salt: Encoding.ASCII.GetBytes(PasswordSaltpluskey),
            prf: KeyDerivationPrf.HMACSHA512,
            iterationCount: 100000,
            numBytesRequested: 256 / 8);
        string hash = Convert.ToBase64String(PasswordHash);
        return hash == password;
    }
    [HttpPost()]
    public IActionResult Login(LoginDto loginDtoDto)
    {
        Users? user = _dapperContext.GetBykey<Users, string>("Email", loginDtoDto.email).FirstOrDefault();
        if (user != null)
        {
            if (verfiyPassword(loginDtoDto.Password, user.PasswordSalt, user.Password))
            {
                string token = _jwt.Create(user);
                return Ok(new { token });
            }
            else
                return NotFound("no such user");
        }
        else
            return NotFound("no such user");
    }
}
