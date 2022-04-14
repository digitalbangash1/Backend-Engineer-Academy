using System.ComponentModel.DataAnnotations;

namespace Backendv2.Models.Courses
{
    public class DeleteCourseModel
    {

        [Required(ErrorMessage = "Required")]
        public string Name { get; set; }

    }
}





