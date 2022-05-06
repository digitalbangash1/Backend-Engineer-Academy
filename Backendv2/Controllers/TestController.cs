using Microsoft.AspNetCore.Mvc;

namespace Backendv2.Controllers
{
    [ApiController]
    [Route("Test")]
    public class TestController : BaseController
    {
        [HttpGet]

        public IActionResult Test()
        {
            return Content("It works");
        }
    }
}
