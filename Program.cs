using api;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Serilog;
var builder = WebApplication.CreateBuilder(args);
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddControllers();
builder.WebHost.ConfigureKestrel(serverOptions =>
{
    serverOptions.ListenAnyIP(5070);  // Listen on all IP addresses
    serverOptions.Limits.KeepAliveTimeout = TimeSpan.FromMinutes(2);
});
Log.Logger = new LoggerConfiguration().MinimumLevel.Information().
WriteTo.File("other/log.log", rollingInterval: RollingInterval.Day)
.CreateLogger();

builder.Services.AddCors(options =>
{
    options.AddPolicy("DevCors", corsBuilder =>
  {
      corsBuilder.WithOrigins("*")
          .AllowAnyHeader()
          .AllowAnyMethod()
          ;
  });
    options.AddPolicy("ProdCors", corsBuilder =>
 {
     corsBuilder.WithOrigins("https://site.com")
         .AllowAnyHeader()
         .AllowAnyMethod().
         AllowCredentials();
 });
});
// Replace 'YourNamespace' with the actual namespace where DapperContext is defined
JwtMiddleware jwtMiddleware = new JwtMiddleware(builder.Configuration);

builder.Services.AddScoped<DapperContext>();
builder.Services.AddScoped<Jwt>();
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = jwtMiddleware.tokenValidationParameters;
    });
// Register the custom middleware

var app = builder.Build();


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseCors("DevCors");
    app.UseSwagger();
    app.UseSwaggerUI();
}
else
{
    app.UseCors("ProdCors");
    app.UseHttpsRedirection();
}
app.UseAuthentication();
app.UseAuthorization();


app.MapControllers();
app.Run();

