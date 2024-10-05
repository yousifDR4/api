using api.Middleware;
using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
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
    }
}
