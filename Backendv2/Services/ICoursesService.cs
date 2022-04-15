using Backendv2.Models.Courses;

namespace Backendv2.Services
{
    public interface ICoursesService
    {
        void CreateCourse(string name, string description);

        void DeleteCourse(int Id);
        void UpdateCourse(int id, string name, string description);
        IList<CourseModel> GetCourses();
        CourseModel GetById(int id);
        
    }
}
