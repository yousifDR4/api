using System.ComponentModel.DataAnnotations;

namespace api.Dto
{
    public partial class DeleteReservasionsDto
    {

        [Required]
        public IEnumerable<int> ReservasionIds { get; set; } = new int[] { };

    }
}