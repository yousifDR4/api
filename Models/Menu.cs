using System.ComponentModel.DataAnnotations;
namespace api.Models
{
    public class Menu
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string Image { get; set; } = string.Empty;
        [Required]
        public decimal? Price  { get; set; }
        [Required]
        public int RestaurantId { get; set; }
        public DateTime Created_At { get; set; } = DateTime.Now;
        public DateTime Updated_At { get; set; } = DateTime.Now;
        public int? FoodCategoryId { get; set; }
    }
}
