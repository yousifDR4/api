
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
namespace api.Middleware
{
    public class TestMiddlewareAttribute : Attribute, IAsyncActionFilter     
    {

        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            Console.WriteLine("Before Action Execution\n");
            if (true)
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
    }

} 