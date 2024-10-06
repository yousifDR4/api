using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
namespace api.Controllers;
[ApiController]
[Route("[controller]")]
public class SupporterController : ControllerBase
{
    DapperContext _dapperContext;
    RestaurantModel model;

    public SupporterController(DapperContext dapperContext)
    {
        _dapperContext = dapperContext;
        model = new RestaurantModel(_dapperContext);

    }
    [NonAction]
    public int getUserId()
    {
        var userIdClaim = User.FindFirst("jti")?.Value + "";
        if (!string.IsNullOrEmpty(userIdClaim) && int.TryParse(userIdClaim, out int parsedUserId))
        {
            return parsedUserId;
        }
        return 0;
    }
    [HttpPost]
    [Authorize]
    public async Task<IActionResult> AddSupporter(Restaurant_Supporters supporter)
    {
        int userIdClaim = getUserId();
        if (userIdClaim > 0)
        {
            IEnumerable<object> resturant = await model.Owners<object>(supporter.RestaurantId, userIdClaim);
            if (resturant != null && resturant.Any())
            {
                var result = await _dapperContext.InsertAsync(supporter);
                return Ok(result);
            }
            else
            {
                return Unauthorized();
            }
        }
        else
        {
            return BadRequest();
        }

    }
    [HttpDelete("{id}")]
    [Authorize]
    public async Task<IActionResult> DeleteSupporter(int id)
    {
        int userIdClaim = getUserId();
        if (userIdClaim > 0)
        {
            IEnumerable<object> resturant = await model.OwnerToSupporter<object>(id, userIdClaim);
            if (resturant != null && resturant.Any())
            {
                var result = await _dapperContext.DeleteAsync<Restaurant_Supporters>(id);
                return Ok(result);
            }
            else
            {
                return Unauthorized();
            }
        }
        else
        {
            return BadRequest();
        }

    }
}

