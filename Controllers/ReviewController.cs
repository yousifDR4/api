using api.Models;
using Microsoft.AspNetCore.Mvc;
namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ReviewController : ControllerBase
    {
        DapperContext _dapperContext;
        public ReviewController(DapperContext dapperContext)
        {
            _dapperContext = dapperContext;
        }
        [HttpGet("")]
        public async Task<IEnumerable<Reviews>> GetAll()
        {
            return await _dapperContext.LoadDataAsync<Reviews>();
        }
        [HttpGet("{RestaurantId}")]
        public async Task<IEnumerable<object>> RestaurantReviewsCount(int RestaurantId)
        {
            return await _dapperContext.QueryAsync<object>
            (@"SELECT  stars,COUNT(*) as Count 
            FROM Reviews 
           WHERE RestaurantId=@RestaurantId 
           GROUP BY stars", new { RestaurantId });
        }

    }
}
