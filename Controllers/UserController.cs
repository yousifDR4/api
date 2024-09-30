using api.Models;
using Microsoft.AspNetCore.Mvc;
namespace api.Controllers;
[ApiController]
[Route("[controller]")]
public class UserController : ControllerBase
{
    DapperContext _dapperContext;
    public UserController(IConfiguration config)
    {
        _dapperContext = new DapperContext(config);
    }
    [HttpGet("{name}", Name = "GetUser")]
    public string[] Get(string name)
    {
        string[] result = new string[] { "User1", "User2", name };

        return result;
    }
    [HttpGet("", Name = "")]
    public List<User> GetAll(string name)
    {

        return _dapperContext.LoadDate<User>().ToList();

    }
}
