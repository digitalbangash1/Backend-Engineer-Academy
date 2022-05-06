using Backendv2.Models.Courses;
using Backendv2.Repositories;
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

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var model = coursesService.GetById(id);
            if(model == null)
            {
                return NotFound();
            }
            return Ok(model);
        }

        [HttpGet]
        public IActionResult GetCourses()
        {
            return Ok(coursesService.GetCourses());
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteCourse(int id)
        {
            coursesService.DeleteCourse(id);
            return Ok();
        }

        [HttpPost]
        public IActionResult CreateCourse(CreateCourseModel model)
        {
            coursesService.CreateCourse(model.Name, model.Description);
            return Ok();
        }

        [HttpPut("{id}")]
        public IActionResult UpdateCourse(int id, UpdateCourseModel model)
        {
            coursesService.UpdateCourse(id, model.Name, model.Description);
            return Ok();
        }
    }
}

