using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Threading.Tasks;

namespace api.Middleware
{
    public class TestMiddlewareAttribute : TypeFilterAttribute
    {
        public TestMiddlewareAttribute() : base(typeof(TestMiddlewareFilter))
        {
        }

        private class TestMiddlewareFilter : IAsyncActionFilter
        {
            private readonly TestMiddleware _middleware;

            public TestMiddlewareFilter(TestMiddleware middleware)
            {
                _middleware = middleware;
            }

            public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
            {
                var httpContext = context.HttpContext;
                await _middleware.InvokeAsync(httpContext);
                await next();
            }
        }
    }
}