using api.Seeders;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace api.Migrations
{
    /// <inheritdoc />
    public partial class seedData9 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            ReservationsSedder reservationsSedders = new ReservationsSedder(migrationBuilder);
            for (int i = 51; i < 153; i++)
            {
                reservationsSedders.Seed(i, 3);
            }
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Person_Number",
                table: "reservations",
                newName: "PersonNumber");
        }
    }
}
