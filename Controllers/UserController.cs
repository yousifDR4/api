using api.Models;
using Microsoft.AspNetCore.Mvc;
using Org.BouncyCastle.Tls;
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
    public List<Users> GetAll()
    {

        return _dapperContext.LoadData<Users>().ToList();

    }
    [HttpGet("/{id}", Name = "GetUserById")]
    public Users GetById(int id)
    {
        return _dapperContext.GetById<Users>(id);
    }

    [HttpPost("", Name = "insertUser")]
    public Users Store(Users user)
    {

        List<string> Fields = new List<string>
{
    "Email",
    "Password",
    "Mobile",
    "CreatedAt",
    "UpdatedAt",
    "Type",
    "City",
    "Address1",
    "Address2",
    "GovId",
    "CityId",
    "Name"
};
        string query = "INSERT INTO Users (Name, Email) VALUES (@Name, @Email)";
        _dapperContext.Execute(query, user);
        return user;
    }

}
