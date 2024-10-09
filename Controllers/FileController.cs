using api.Models;
using api.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Serilog;
namespace api.Controllers;
[ApiController]
[Route("[controller]")]
public class FileController : ControllerBase
{
    private readonly DapperContext _dapperContext;
    private readonly MenuModel _MenueModel;
    private readonly UploadFile _uploadFile;
    public FileController(DapperContext dapperContext)
    {
        _dapperContext = dapperContext;
        _MenueModel = new MenuModel(dapperContext);
        _uploadFile = new UploadFile();

    }
    [HttpGet("Restaurant/{restaurantId}/Image/{ImageName}")]
    public IActionResult GetImage(int restaurantId, string ImageName)
    {
        string path = Path.Combine(Directory.GetCurrentDirectory(), "..", "uploads", restaurantId.ToString(), ImageName);
        var imageFileStream = _uploadFile.GetImage(path);
        try
        {
            return File(imageFileStream, "image/png");
        }
        catch (System.Exception e)
        {
            if (e is FileNotFoundException)
            {
                Log.Error("Error in Restaurant/{@restaurantId}/Image/{@ImageName} {@e}", restaurantId, ImageName, e);
                return NotFound("File not found");
            }
            else
            {
                Log.Fatal("Internal Server Error Restaurant/{@restaurantId}/Image/{@ImageName} {@e}", restaurantId, ImageName, e);
                return StatusCode(500, "Internal Server Error");
            }
        }

    }
}

