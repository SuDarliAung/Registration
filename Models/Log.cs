namespace StudentRegistration.Models
{
    public class Log
    {
        public string id { get; set; }
        public DateTime actionTime { get; set; }
        public string actionDescription { get; set; }
        public Guid userId { get; set; }
        public DateTime? createdOn { get; set; }
        public string? createdBy { get; set; }
        public DateTime? modifiedOn { get; set; }
        public string? modifiedBy { get; set; }
    }
}