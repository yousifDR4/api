using api.Dto;
using api.Middleware;
using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using api.Repository;
using api.Services;
using Serilog;
namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class RestaurantController : ControllerBase
    {
        DapperContext _dapperContext;
        private readonly RestaurantModel _Model;
        private menuRepository _menueRepository;
        private UploadFile uploadFile;
        public RestaurantController(DapperContext dapperContext)
        {
            _dapperContext = dapperContext;
            _Model = new RestaurantModel(_dapperContext);
            _menueRepository = new menuRepository(dapperContext);
            uploadFile = new UploadFile();

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
            Log.Information("Task<List<Restaurants>> GetAll() {@users}", users);
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
        [HttpPost("{restaurantId}/menue")]
        // [Authorize]
        // [RestaurantMiddlewareOwner]
        public async Task<IActionResult> StoreMenue(int restaurantId, [FromForm] MenuDto menueDto)
        {
            string image1 = "";
            try
            {
                if (menueDto.ImageFile != null)
                {
                    image1 = uploadFile.upload(menueDto.ImageFile, restaurantId.ToString());
                }
            }
            catch (System.Exception e)
            {
                Log.Error("Error in HttpPost(restaurantId/menue) {@e}", e);
                return BadRequest(e.Message);
            }
            try
            {
                Menu menue = new Menu()
                {

                    Name = menueDto.Name,
                    Description = menueDto.Description,
                    Image = image1,
                    Price = menueDto.Price,
                    RestaurantId = restaurantId,
                    FoodCategoryId = menueDto.FoodCategoryId
                };
                return Ok(await _menueRepository.Storemenu(menue));
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }

        }
        [HttpGet("{restaurantId}/menue/{menuId}")]
        [Authorize]
        [RestaurantMiddlewareOwner]
        public async Task<IActionResult> GetmenuById(int menuId)
        {
            try
            {
                return Ok(await _menueRepository.GetmenuById(menuId));
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }

        }
        [HttpGet("{restaurantId}/menue/")]
        [Authorize]
        [RestaurantMiddlewareOwner]
        public async Task<IActionResult> GetAllmenu(int menuId)
        {
            try
            {
                return Ok(await _menueRepository.GetAllmenus());
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }

        }
        [HttpGet("{restaurantId}/menu/{menuId}")]
        [Authorize]
        [RestaurantMiddlewareOwner]
        public async Task<IActionResult> UpdatemenuDish(int menuId, int restaurantId, [FromForm] MenuDto menueDto)
        {
            string image1 = "";
            try
            {
                if (menueDto.ImageFile != null)
                {
                    image1 = uploadFile.upload(menueDto.ImageFile, restaurantId.ToString());
                }
            }
            catch (System.Exception e)
            {

                return BadRequest(e.Message);
            }
            try
            {
                Menu menue = new Menu()
                {

                    Name = menueDto.Name,
                    Description = menueDto.Description,
                    Image = image1,
                    Price = menueDto.Price,
                    RestaurantId = restaurantId,
                    FoodCategoryId = menueDto.FoodCategoryId
                };
                await _menueRepository.UpdatemenuDish(menuId, restaurantId, menue);
                return Ok();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }

        }
        [HttpDelete("{restaurantId}/menu/{menuId}")]
        [Authorize]
        [RestaurantMiddlewareOwner]
        public async Task<IActionResult> DeletemenuDish(int menuId, int restaurantId, Menu menu)
        {
            try
            {
                await _menueRepository.DeletemenuItem(menuId, restaurantId);
                return Ok();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }

        }

    }
}
