using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class OwnersController : ControllerBase
    {
        DapperContext _dapperContext;
        private readonly RestaurantModel _Model;
        public OwnersController(DapperContext dapperContext)
        {
            _dapperContext = dapperContext;
            _Model = new RestaurantModel(_dapperContext);
        }

        [Authorize]
        [HttpGet("{restaurantId}")]
        public async Task<IActionResult> Get(int restaurantId)
        {
            int userId;
            var userIdClaim = User.FindFirst("jti")?.Value + "";
            if (!string.IsNullOrEmpty(userIdClaim) && int.TryParse(userIdClaim, out int parsedUserId))
            {
                userId = parsedUserId;
                object restaurants = await _Model.Owners<object>(restaurantId, userId);
                if (restaurants != null)
                    return Ok(restaurants);
                else
                    return BadRequest("Invalid Restaurant Id");
            }
            else
                return BadRequest("Invalid User Id");
        }
        [Authorize]
        [HttpGet("")]
        public async Task<IActionResult> GetAll()
        {
            int userId;
            var userIdClaim = User.FindFirst("jti")?.Value + "";
            if (!string.IsNullOrEmpty(userIdClaim) && int.TryParse(userIdClaim, out int parsedUserId))
            {
                userId = parsedUserId;
                object restaurants = await _Model.OwnersAll<object>(userId);
                if (restaurants != null)
                    return Ok(restaurants);
                else
                    return BadRequest("Invalid Restaurant Id");
            }
            else
                return BadRequest("Invalid User Id");
        }
    }
}
