using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
namespace api.Controllers;
[ApiController]
[Route("[controller]")]
public class MenuController : ControllerBase
{
    private readonly DapperContext _dapperContext;
    private readonly MenuModel _MenueModel;

    public MenuController(DapperContext dapperContext)
    {
        _dapperContext = dapperContext;
        _MenueModel = new MenuModel(dapperContext);
    }
    [HttpGet("resturant/{resturantId}")]
    public async Task<IEnumerable<object>> GetAll(int resturantId)
    {
        IEnumerable<object> menus = await _MenueModel.getResturantMenu(resturantId);
        return menus.ToList();
    }


}

