using System.ComponentModel.DataAnnotations;

namespace api.Dto
{
    public partial class ReservationsCount
    {
        public int RestaurantId { get; set; }
        public bool IsCancelled { get; set; }
        public int Count { get; set; }
    }
}