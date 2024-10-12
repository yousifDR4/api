using System.ComponentModel.DataAnnotations;

namespace api.Models
{
    public class Reviews
    {
        public int Id { get; set; }
        [Required]
        public string Comment { get; set; } = string.Empty;
        [Required]
        public string Stars { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public bool IsActive { get; set; } = true;
        public int UserId { get; set; }
        public int RestaurantId { get; set; }

    }
}
