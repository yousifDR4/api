using System.ComponentModel.DataAnnotations;

namespace api.Dto
{
    public partial class SupportersDto
    {
        [Required]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; } = string.Empty;
        [Required]
        public int RestaurantId { get; set; }
    }
}