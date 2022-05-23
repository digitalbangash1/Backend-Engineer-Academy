using Backendv2.Models.Courses;
using Backendv2.Repositories;

namespace Backendv2.Services
{
    public class CoursesService : ICoursesService
    {
<<<<<<< HEAD

        {
=======
        private readonly ICoursesRepository coursesRepository;
        private readonly IVideosRepository videosRepository;
        private readonly IArticlesRepository articlesRepository;

        public CoursesService(
            ICoursesRepository coursesRepository,
            IVideosRepository videosRepository,
            IArticlesRepository articlesRepository)
        {
            this.coursesRepository = coursesRepository;
            this.videosRepository = videosRepository;
            this.articlesRepository = articlesRepository;
>>>>>>> a8ef122c1b5010a48f6a5dce936ab95961cb71fd
        }

        public void CreateCourse(string name, string description)
        {
<<<<<<< HEAD
        }
=======
            coursesRepository.CreateCourse(name, description);
>>>>>>> a8ef122c1b5010a48f6a5dce936ab95961cb71fd
        }

        public void DeleteCourse(int id) { coursesRepository.DeleteCourse(id); }

        public CourseDetailsModel GetById(int id)
        {
<<<<<<< HEAD
            {
            }

            {
=======
            var course = coursesRepository.GetById(id);
            if (course == null)
            {
                return null;
            }

            var videos = videosRepository.GetVideos(id);
            var articles = articlesRepository.GetArticles(id);
            return new CourseDetailsModel
            {
                Id = course.Id,
                Name = course.Name,
                Description = course.Description,
                Videos = videos,
                Articles = articles,
            };
>>>>>>> a8ef122c1b5010a48f6a5dce936ab95961cb71fd
        }

        public IList<CourseModel> GetCourses()
        {
<<<<<<< HEAD
        }

        {
=======
            return coursesRepository.GetCourses();
        }

        public void UpdateCourse(int id, string name, string description)
        {
            coursesRepository.UpdateCourse(id, name, description);
>>>>>>> a8ef122c1b5010a48f6a5dce936ab95961cb71fd
        }
    }
}
