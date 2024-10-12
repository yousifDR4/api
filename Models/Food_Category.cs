namespace api.Models
{
    public class Food_Category
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public DateTime Created_At { get; set; } = DateTime.Now;
        public DateTime Updated_At { get; set; } = DateTime.Now;
    }
}
