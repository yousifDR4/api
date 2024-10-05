using api.Middleware;
using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
namespace api.Controllers;
[ApiController]
[Route("[controller]")]
public class FoodCategoryController : ControllerBase
{
    DapperContext _dapperContext;

    public FoodCategoryController(DapperContext dapperContext)
    {
        _dapperContext = dapperContext;
    }
    [HttpPost]
    [Authorize]
    [RestaurantMiddleware]
    public async Task<IActionResult> Store(FoodCategoryDto foodCategory)
    {
        Food_Category model = new()
        {
            Name = foodCategory.Name,
        };
        var insertedId = await _dapperContext.QuerySingleAsync<int>("INSERT INTO Food_Category (Name) VALUES (@Name); SELECT LAST_INSERT_ID();", new { model.Name });
        model.Id = insertedId; // Assuming Food_Category has an Id property
        return Ok(model);
    }
    [HttpGet]
    public async Task<IEnumerable<Food_Category>> getAll()
    {

        return await _dapperContext.LoadDataAsync<Food_Category>();
    }
    [HttpGet("{id}")]
    public async Task<Food_Category> get(int id)
    {

        return await _dapperContext.GetByIdAsync<Food_Category>(id);
    }
}

