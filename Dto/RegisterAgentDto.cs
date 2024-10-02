using System.ComponentModel.DataAnnotations;

namespace api.Dto
{
    public partial class RegisterAgentDto
    {
        [Required]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; } = string.Empty;

        [Required]
        [MinLength(8, ErrorMessage = "Password must be at least 8 characters long")]
        public string Password { get; set; } = string.Empty;

        [Required]
        [Compare("Password", ErrorMessage = "Passwords do not match")]
        public string ConfirmPassword { get; set; } = string.Empty;

        public string Type { get; set; } = "AGEEN";

        [Required]
        public string Name { get; set; } = string.Empty;
    }
}