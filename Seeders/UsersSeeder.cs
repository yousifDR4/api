
using Microsoft.EntityFrameworkCore.Migrations;
using Bogus;
namespace api.Seeders
{
    public class UsersSeeder
    {
        string[] columns = { "Address1", "Address2", "CityId", "Email", "GovId", "Mobile", "Name", "Password", "PasswordSalt", "Type", "Username" };
        private readonly MigrationBuilder _context;


        public UsersSeeder(MigrationBuilder migrationBuilder)
        {
            _context = migrationBuilder;
        }
        public void Seed()
        {

            var faker = new Faker();
            object[] values = new object[] { "",
             "",
              0,
            faker.Internet.Email(),
             0, 0, faker.Name.FindName(),
             "", "",
             "",
              "" };

            _context.InsertData(
                table: "users",
                columns: columns,
                values: values
            );
        }

    }
}