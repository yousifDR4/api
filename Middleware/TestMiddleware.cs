using System.Diagnostics;
namespace api
{
    public class TestMiddleware
    {
        private readonly RequestDelegate _next;

        public TestMiddleware(RequestDelegate next)
        {
            _next = next;
        }
        public TestMiddleware()
        {

        }
        public async Task InvokeAsync(HttpContext context)
        {
            Console.WriteLine("working");
            // Log the request
            Debug.WriteLine($"Incoming request: {context.Request.Method} {context.Request.Path}");

            // Call the next middleware in the pipeline
            await _next(context);
            // Log the response
            Debug.WriteLine($"Outgoing response: {context.Response.StatusCode}");
        }
    }
}