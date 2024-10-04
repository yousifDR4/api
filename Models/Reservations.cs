

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
        [Required]
        public int TableId { get; set; }
        [Required]
        public int PersonNumber { get; set; }
        public string Type { get; set; } = "NORMAL";
        public string? Note { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; } = DateTime.Now;
        public DateTime AttendanceTime { get; set; } = DateTime.Now;
        public bool IsCancelled { get; set; }
        public bool IsActive { get; set; }
    }
}
