using Backendv2.Models.Courses;
using Backendv2.Services;
using Microsoft.AspNetCore.Mvc;

namespace Backendv2.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CoursesController : BaseController
    {
        private readonly ICoursesService coursesService;

        public CoursesController(ICoursesService coursesService)
        {
            this.coursesService = coursesService;
        }

        [HttpGet]
        public IList<CourseModel> GetCourses()
        {
            return coursesService.GetCourses();
        }
    }
}

