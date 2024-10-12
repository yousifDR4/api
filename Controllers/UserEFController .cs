// using api.Models;
// using Microsoft.AspNetCore.Mvc;
// namespace api.Controllers;
// [ApiController]
// [Route("[controller]")]
// public class UserEFController : ControllerBase
// {
//     DataContext _entityfarmwork;
//     public UserEFController(IConfiguration config)
//     {
//         _entityfarmwork = new DataContext(config);
//     }
//     [HttpGet("GetUsers")]
//     public IActionResult GetAll()
//     {

//         List<Users> users = _entityfarmwork.Users.ToList();

//         return Ok(users);

//     } 

// }

