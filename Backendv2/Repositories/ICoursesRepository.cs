using Backendv2.Models.Courses;

namespace Backendv2.Repositories
{
    public interface ICoursesRepository
    {
        void CreateCourse(string name, string description);

        void DeleteCourse(int Id);
        void UpdateCourse(int id, string name, string description);
        IList<CourseModel> GetCourses();
        CourseDetailsModel GetById(int id);
    }
}
