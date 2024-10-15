

using System.ComponentModel.DataAnnotations;

namespace api.Models
{
    public class Reservations
    {
        public int Id { get; set; }
        [Required]
        public int RestaurantId { get; set; }
        [Required]
        public int UserId { get; set; }
    
        public int ?TableId { get; set; }
        [Required]
        public int Person_Number { get; set; }
        public string Type { get; set; } = "NORMAL";
        public string? Note { get; set; }
        public DateTime Created_At { get; set; } = DateTime.Now;
        public DateTime Updated_At { get; set; } = DateTime.Now;
        public DateTime AttendanceTime { get; set; } = DateTime.Now;
        public bool IsCancelled { get; set; }
        public bool IsActive { get; set; }
    }
}
