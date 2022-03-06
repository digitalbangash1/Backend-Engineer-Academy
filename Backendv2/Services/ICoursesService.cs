using Backendv2.Models.Courses;

namespace Backendv2.Services
{
    public interface ICoursesService
    {
        IList<CourseModel> GetCourses();
    }
}
