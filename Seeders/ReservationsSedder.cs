
using Microsoft.EntityFrameworkCore.Migrations;
using Bogus;
namespace api.Seeders
{
    public class ReservationsSedder
    {

        string[] columns = {  "UserId",
        "RestaurantId",
         "TableId",
         "Person_Number"
         ,"AttendanceTime"
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
              restaurantId,
               faker.Random.Number(2, 12),
                faker.Random.Number(0, 8),
             faker.Date.Between(new DateTime(2024, 10, 5), new DateTime(2024, 12, 31))
            };

            _context.InsertData(
                table: "reservations",
                columns: columns,
                values: values
            );
        }

    }
}