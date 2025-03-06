using System.ComponentModel.DataAnnotations;

namespace StudentRegistration.Models
{
    public class User
    {
        public Guid id { get; set; }
        [Required(ErrorMessage = "userid is required.")]
        public string userid { get; set; }

        [Required(ErrorMessage = "NRIC is required.")]
        public string nric { get; set; }

        [Required(ErrorMessage = "Name is required.")]
        public string name { get; set; }

        [Required(ErrorMessage = "Gender is required.")]
        public string gender { get; set; }

        [Required(ErrorMessage = "Birthday is required.")]
        public DateTime birthday { get; set; }

        public DateTime? availableDate { get; set; }

        [Required(ErrorMessage = "Subjects are required.")]
        public string? subjects { get; set; }

        public DateTime? createdOn { get; set; }
        public string? createdBy { get; set; }
        public DateTime? modifiedOn { get; set; }
        public string? modifiedBy { get; set; }
    }
}