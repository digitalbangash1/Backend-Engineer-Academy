using Backendv2.Models.Courses;
using Backendv2.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Backendv2.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CoursesController : BaseController
    {
        private readonly ICoursesRepository coursesRepository;

        public CoursesController(ICoursesRepository coursesRepository)
        {
            this.coursesRepository = coursesRepository;
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var model = coursesRepository.GetById(id);
            if(model == null)
            {
                return NotFound();
            }
            return Ok(model);
        }

        [HttpGet]
        public IActionResult GetCourses()
        {
            return Ok(coursesRepository.GetCourses());
        }

        [HttpPost]
        public IActionResult CreateCourse(CreateCourseModel model)
        {
            coursesRepository.CreateCourse(model.Name, model.Description);
            return Ok();
        }

        [HttpPut("{id}")]
        public IActionResult UpdateCourse(int id, UpdateCourseModel model)
        {
            coursesRepository.UpdateCourse(id, model.Name, model.Description);
            return Ok();
        }
    }
}

