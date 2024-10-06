
using api.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
namespace api.Middleware
{
    public class ModfiyRestaurantMiddlewareAttribute : Attribute, IAsyncActionFilter
    {
        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            DapperContext _dapperContext = context.HttpContext.RequestServices.GetService<DapperContext>() ?? throw new ArgumentNullException(nameof(DapperContext));
            int restaurantId = int.Parse(context.RouteData.Values["restaurantId"] + "");
            
            RestaurantModel _Model = new RestaurantModel(_dapperContext);
            var userIdClaim = context.HttpContext.User.FindFirst("jti")?.Value + "";
            if (!string.IsNullOrEmpty(userIdClaim) && int.TryParse(userIdClaim, out int parsedUserId))
            {
                int userId = parsedUserId;
                IEnumerable<object> restaurants = await _Model.Owners<object>(restaurantId, userId);
                if (restaurants != null && restaurants.Any())
                {

                    await next();
                }
                else
                {
                    context.Result = new ContentResult()
                    {
                        Content = "Unauthorized",
                        StatusCode = 401
                    };
                }
            }
            else
            {
                context.Result = new ContentResult()
                {
                    Content = "Unauthorized",
                    StatusCode = 401
                };
            }
        }
    }

}