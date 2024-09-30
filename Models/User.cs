namespace api.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int Mobile { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public string Type { get; set; }
        public string Address1 { get; set; }=string.Empty;
        public string Address2 { get; set; }=string.Empty;
        public int GovId { get; set; }
        public int CityId { get; set; }
        public string Name { get; set; }
    }
}
