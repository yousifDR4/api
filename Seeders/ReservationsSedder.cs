
using Microsoft.EntityFrameworkCore.Migrations;
using Bogus;
namespace api.Seeders
{
    public class ReservationsSedder
    {

        private readonly string[] Stars = { "1", "2", "3", "4", "5" };
        string[] columns = {  "UserId",
        "Stars", "RestaurantId", "Comment"
       };
        private readonly MigrationBuilder _context;


        public ReservationsSedder(MigrationBuilder migrationBuilder)
        {
            _context = migrationBuilder;
        }
        public void Seed(int userId, int restaurantId)
        {

            var faker = new Faker();
            object[] values = new object[] { userId,
             Stars[faker.Random.Number(0, 4)],
              restaurantId,
             faker.Lorem.Sentence()
            };

            _context.InsertData(
                table: "reviews",
                columns: columns,
                values: values
            );
        }

    }
}