// using api.Models;
// using Microsoft.EntityFrameworkCore;
// using Microsoft.Extensions.Configuration;

// namespace api
// {
//     public class DataContext : DbContext
//     {
//         private readonly IConfiguration _config;

//         public DataContext(IConfiguration config)
//         {
//             _config = config;
//         }

//         // virtual for lazy loading
//         public virtual DbSet<Users> Users { get; set; }
//         protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//         {
//             string connectionString = _config.GetConnectionString("DefaultConnection") ?? "";
//             if (connectionString != "")
//             {
//                 optionsBuilder.UseMySQL(connectionString, options => options.EnableRetryOnFailure());
//             }
//             else
//             {
//                 Console.WriteLine("Connection string is empty");
//             }
//         }
//         protected override void OnModelCreating(ModelBuilder modelBuilder)
//         {
//             modelBuilder.Entity<Users>().ToTable("users").
//             HasKey(user => user.Id);
//         }
//     }


// }