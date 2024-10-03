using api;
using Microsoft.AspNetCore.Authentication.JwtBearer;
var builder = WebApplication.CreateBuilder(args);
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddControllers();
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

