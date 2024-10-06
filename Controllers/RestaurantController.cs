using api.Dto;
using api.Middleware;
using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Mysqlx.Crud;
namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class RestaurantController : ControllerBase
    {
        DapperContext _dapperContext;
        private readonly RestaurantModel _Model;
        public RestaurantController(DapperContext dapperContext)
        {
            _dapperContext = dapperContext;
            _Model = new RestaurantModel(_dapperContext);
        }
        [HttpPost]
        [Authorize]
        public async Task<IActionResult> Store(Restaurants restaurant)
        {
            int Id = await _dapperContext.InsertAsync(restaurant);
            return Created("Id", Id);
        }
        [HttpGet("{restaurantId}")]
        public async Task<IActionResult> Get(int restaurantId)
        {
            object restaurants = await _dapperContext.GetByIdAsync<Restaurants>(restaurantId);
            if (restaurants != null)
                return Ok(restaurants);
            else
                return StatusCode(StatusCodes.Status500InternalServerError);
        }
        [HttpGet]
        public async Task<List<Restaurants>> GetAll()
        {
            var users = await _dapperContext.LoadDataAsync<Restaurants>();
            return users.ToList();
        }
        [HttpPut("{restaurantId}")]
        [Authorize]
        [RestaurantMiddlewareOwner]
        public async Task<IActionResult> update(int restaurantId, Restaurants restaurant)
        {
            await _dapperContext.UpdateAsync(restaurant, restaurantId);
            return Ok();
        }
        [HttpDelete("{restaurantId}")]
        [Authorize]
        [RestaurantMiddlewareOwner]
        public async Task<IActionResult> Delete(int restaurantId)
        {
            await _dapperContext.DeleteAsync<Restaurants>(restaurantId);
            return Ok();
        }
        [HttpGet("accounts/{restaurantId}")]
        [Authorize]
        [RestaurantMiddlewareOwner]
        public async Task<IActionResult> getAccounts(int restaurantId)
        {
            IEnumerable<object> accounts = await _Model.RestaurantAccounts<object>(restaurantId);
            return Ok(accounts);
        }
        [HttpDelete("{restaurantId}/accounts/{supporterId}")]
        [Authorize]
        [RestaurantMiddlewareOwner]
        public async Task<IActionResult> DeleteAccounts(int restaurantId, int supporterId)
        {
            IEnumerable<object> accounts = await _dapperContext.QueryAsync<object>
            ("DELETE FROM restaurant_supporters WHERE restaurantId = @restaurantId AND supporterId = @supporterId",
            new { restaurantId, supporterId }
            );
            return Ok(accounts);
        }
        [HttpDelete("{restaurantId}/accounts")]
        [Authorize]
        [RestaurantMiddlewareOwner]
        public async Task<IActionResult> DeleteAccount(int restaurantId, DeleteSupporterDto deleteSupporterDto)
        {
            IEnumerable<int> Ids = deleteSupporterDto.supporterId;
            if (Ids == null || !Ids.Any())
            {
                return BadRequest("No supporter IDs provided.");
            }
            return Ok(await _dapperContext.DeleteMany(Ids, "DELETE FROM restaurant_supporters WHERE"));

        }

    }
}
