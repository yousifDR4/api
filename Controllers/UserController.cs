using api.Middleware;
using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Org.BouncyCastle.Tls;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserController : ControllerBase
    {
        private readonly DapperContext _dapperContext;

        public UserController(DapperContext dapperContext)
        {
            _dapperContext = dapperContext;
        }

        [HttpGet("{name}", Name = "GetUser")]
        public async Task<string[]> Get(string name)
        {
            string[] result = new string[] { "User1", "User2", name };
            return await Task.FromResult(result);
        }

        [HttpGet("GetAll", Name = "")]
       
        public async Task<List<Users>> GetAll()
        {
            var users = await _dapperContext.LoadDataAsync<Users>();
            return users.ToList();
        }

        [HttpGet("/{id}", Name = "GetUserById")]
        public async Task<Users> GetById(int id)
        {
            string query = $"SELECT name,email,id FROM Users WHERE Id = @Id";
            return await _dapperContext.QuerySingleAsync<Users>(query, new { Id = id });
        }

        [HttpPost("", Name = "insertUser")]
        public async Task<IActionResult> Store(Users user)
        {
            int id = await _dapperContext.InsertAsync(user);
            return Ok(id);
        }
    }
}
