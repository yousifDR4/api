using api.Models;
using api.Dto;
using Microsoft.AspNetCore.Mvc;
using Org.BouncyCastle.Tls;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using System.Text;
namespace api.Controllers;
[ApiController]
[Route("[controller]")]
public class RegisterController : ControllerBase
{
    DapperContext _dapperContext;
    IConfiguration _config;
    public RegisterController(DapperContext dapperContext, IConfiguration configuration)
    {
        _dapperContext = dapperContext;
        _config = configuration;
    }
    private (string PasswordHash, string PasswordSalt) HashPassword(string Password)
    {
        byte[] PasswordSalt = new byte[128 / 8];
        using (RandomNumberGenerator rng = RandomNumberGenerator.Create())
        {
            rng.GetBytes(PasswordSalt); // Fill the array with a cryptographically strong sequence of random values

        }
        // Get the password key from the appsettings.json file
        string PasswordSaltpluskey = _config.GetSection("AppSettings:PasswordKey").Value + Convert.ToBase64String(PasswordSalt);
        byte[] PasswordHash = KeyDerivation.Pbkdf2(
            password: Password,
            salt: Encoding.ASCII.GetBytes(PasswordSaltpluskey),
            prf: KeyDerivationPrf.HMACSHA512,
            iterationCount: 100000,
            numBytesRequested: 256 / 8);
        return (Convert.ToBase64String(PasswordHash), Convert.ToBase64String(PasswordSalt));
    }
    [HttpPost()]
    public IActionResult RegisterAgent(RegisterAgentDto registerAgentDto)
    {
        (string PasswordHash, string PasswordSalt) = HashPassword(registerAgentDto.Password);
        Users user = new Users()
        {
            Email = registerAgentDto.Email,
            Password = PasswordHash,
            PasswordSalt = PasswordSalt,
            Name = registerAgentDto.Name,
            Type = registerAgentDto.Type
        };
        object id = _dapperContext.Insert(user);
        return Ok(id);
    }
}
