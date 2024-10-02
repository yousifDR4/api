using System.ComponentModel.DataAnnotations;

namespace api.Models
{
    public class Users
    {
        public int Id { get; set; }
        [Required]
        public string Email { get; set; } = string.Empty;
        [Required]
        public string Username { get; set; } = string.Empty;
        [Required]
        public string Password { get; set; } = string.Empty;
        public string PasswordSalt { get; set; } = string.Empty;
        public int Mobile { get; set; } // Changed to nullable int
      
        public string Type { get; set; } = string.Empty;
        public string? Address1 { get; set; } = string.Empty;
        public string? Address2 { get; set; } = string.Empty;
        public int GovId { get; set; }
        public int CityId { get; set; }
        [Required]
        public string Name { get; set; } = string.Empty;
    }
}
