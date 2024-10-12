using System.ComponentModel.DataAnnotations;

namespace api.Models
{
    public class Restaurant_Supporters
    {
        public int Id { get; set; }
        [Required]
        public int SupporterId { get; set; }
        [Required]
        public int RestaurantId { get; set; }
        // public DateTime Created_At { get; set; } = DateTime.Now;
        // public DateTime Updated_At { get; set; } = DateTime.Now;
    }
}
