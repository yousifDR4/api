using System.ComponentModel.DataAnnotations;
namespace api.Dto
{
    public class MenuDto
    {
  
        [Required]
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public IFormFile? ImageFile { get; set; }
        [Required]
        public decimal? Price { get; set; }
        public int? FoodCategoryId { get; set; }
    }
}
