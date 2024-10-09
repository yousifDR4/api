using System.ComponentModel.DataAnnotations;

namespace api.Dto
{
    public partial class DeleteSupporterDto
    {

        [Required]
        public IEnumerable<int> supporterId { get; set; } = new int[] { };

    }
}