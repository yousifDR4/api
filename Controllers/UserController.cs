using api.Middleware;
using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Org.BouncyCastle.Tls;
namespace api.Controllers;
[ApiController]
[Authorize]
// [AllowAnonymous]
[Route("[controller]")]
public class UserController : ControllerBase
{
    DapperContext _dapperContext;
    public UserController(DapperContext dapperContext)
    {
        _dapperContext = dapperContext;
    }
    [HttpGet("{name}", Name = "GetUser")]
    public string[] Get(string name)
    {
        string[] result = new string[] { "User1", "User2", name };

        return result;
    }
    [HttpGet("GetAll", Name = "")]
    [TestMiddleware]
    public List<Users> GetAll()
    {

        return _dapperContext.LoadData<Users>().ToList();

    }
    [HttpGet("/{id}", Name = "GetUserById")]
    public Users GetById(int id)
    {
        string query = $"SELECT name,email,id FROM Users WHERE Id = @Id";
        return _dapperContext.QuerySingle<Users>(query, new { Id = id });
    }

    [HttpPost("", Name = "insertUser")]
    public IActionResult Store(Users user)
    {
        int id = _dapperContext.Insert(user);

        return Ok(id);
    }

}
