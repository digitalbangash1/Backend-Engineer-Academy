using Microsoft.AspNetCore.Mvc;
using Backendv2.Services;
using Backendv2.Models.the_courses;

namespace Backendv2.Controllers
{

    [ApiController]
    [Route("[controller]")]

    public class The_coursesController : BaseController
    {

        private readonly IThe_coursesSerivce the_CoursesSerivce;


        public The_coursesController(IThe_coursesSerivce the_CoursesSerivce)
        {
            this.the_CoursesSerivce = the_CoursesSerivce;
        }
        [HttpGet]

        public IActionResult GetThecourses()
        {
            return Ok(the_CoursesSerivce.GetThecourses());
        }

    }
}






