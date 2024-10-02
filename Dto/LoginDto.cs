using System.ComponentModel.DataAnnotations;

namespace api.Dto
{
    public partial class LoginDto
    {
        [Required]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string email { get; set; } = string.Empty;
        [Required]
        [MinLength(8, ErrorMessage = "Password must be at least 8 characters long")]
        public string Password { get; set; } = string.Empty;


    }
}