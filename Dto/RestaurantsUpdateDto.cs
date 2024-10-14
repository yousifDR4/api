
using System.ComponentModel.DataAnnotations;

namespace api.Models;
public
 class RestaurantsUpdateDto
{
    [Required]
    public string Name { get; set; } = string.Empty;
    public string Country { get; set; } = string.Empty;
    public string City { get; set; } = string.Empty;
    public double Rating { get; set; }
    public string Note { get; set; } = string.Empty;
    public string Street { get; set; } = string.Empty;
    [Required]
    public int Mobile { get; set; }
    public double? Discount { get; set; }
    public string Description { get; set; } = string.Empty;
    public bool? Shisha { get; set; }
}