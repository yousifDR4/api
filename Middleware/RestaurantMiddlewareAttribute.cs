
using api.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
namespace api.Middleware
{
    public class RestaurantMiddlewareAttribute : Attribute, IAsyncActionFilter
    {
        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            DapperContext _dapperContext = context.HttpContext.RequestServices.GetService<DapperContext>() ?? throw new ArgumentNullException(nameof(DapperContext));
            RestaurantModel _Model = new RestaurantModel(_dapperContext);
            var userIdClaim = context.HttpContext.User.FindFirst("jti")?.Value + "";
            if (!string.IsNullOrEmpty(userIdClaim) && int.TryParse(userIdClaim, out int parsedUserId))
            {
                int userId = parsedUserId;
                object restaurants = await _Model.isOwnerToRestaurant<object>(userId);
                if (restaurants != null)
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