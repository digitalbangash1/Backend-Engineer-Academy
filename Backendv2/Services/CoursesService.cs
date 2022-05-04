using Backendv2.Models.Courses;
using Backendv2.Repositories;

namespace Backendv2.Services
{
    public class CoursesService : ICoursesService
    {
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
        }

        public void CreateCourse(string name, string description)
        {
            coursesRepository.CreateCourse(name, description);
        }

        public CourseDetailsModel GetById(int id)
        {
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
        }

        public IList<CourseModel> GetCourses()
        {
            return coursesRepository.GetCourses();
        }

        public void UpdateCourse(int id, string name, string description)
        {
            coursesRepository.UpdateCourse(id, name, description);
        }
    }
}
