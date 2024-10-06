using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
namespace api.Controllers;
    [ApiController]
    [Route("[controller]")]
public class menuController : ControllerBase
{
   DapperContext _dapperContext;

    public menuController (DapperContext dapperContext)
    {
    _dapperContext=dapperContext;
    }
}
    
