
namespace api.Models;
public
 class Restaurants
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Contrary { get; set; } = string.Empty;
    public int CityId { get; set; }
    public int GovId { get; set; }
    public double Atu { get; set; }
    public double Ltu { get; set; }
    public string Images { get; set; } = string.Empty;
    public string Cover_Image { get; set; } = string.Empty;
    public double Rating { get; set; }
    public string Note { get; set; } = string.Empty;
    public string Street { get; set; } = string.Empty;
    public int Mobile { get; set; }
    public double Discount { get; set; }
    public string Description { get; set; } = string.Empty;
    public bool Shisha { get; set; }
    public DateTime Created_At { get; set; } = DateTime.Now;
    public DateTime Updated_At { get; set; } = DateTime.Now;
}