using Backendv2.Models.Courses;
using Backendv2.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Backendv2.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CoursesController : BaseController
    {
        private readonly ICoursesRepository CoursesRepository;

        public CoursesController(ICoursesRepository coursesRepository)
        {
            this.CoursesRepository = coursesRepository;
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var model = CoursesRepository.GetById(id);
            if(model == null)
            {
                return NotFound();
            }
            return Ok(model);
        }

        [HttpGet]
        public IActionResult GetCourses()
        {
            return Ok(CoursesRepository.GetCourses());
        }

        [HttpPost]
        public IActionResult CreateCourse(CreateCourseModel model)
        {
            CoursesRepository.CreateCourse(model.Name, model.Description);
            return Ok();
        }



        [HttpDelete("{id}")]
        public IActionResult DeleteCourse(int id)
        {
            CoursesRepository.DeleteCourse(id);
            return Ok();
        }



        [HttpPut("{id}")]
        public IActionResult UpdateCourse(int id, UpdateCourseModel model)
        {
            CoursesRepository.UpdateCourse(id, model.Name, model.Description);
            return Ok();
        }
    }
}

