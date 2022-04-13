using Microsoft.AspNetCore.Mvc;
using Backendv2.Services;
using Backendv2.Models.Videos;

namespace Backendv2.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class VideoController :BaseController
    {
        private readonly IVideoService videoServices;

        public VideoController(IVideoService videoServices) { this.videoServices = videoServices; }

        [HttpGet]
        public IList<VideoModel> GetVideos()
        {
            return videoServices.GetVideos();
        }


    }
}
