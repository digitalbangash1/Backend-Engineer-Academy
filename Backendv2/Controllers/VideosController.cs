using Microsoft.AspNetCore.Mvc;
using Backendv2.Models.Videos;
using Backendv2.Repositories;

namespace Backendv2.Controllers
{
    [ApiController]
    [Route("Videos/{courseId}")]
    public class VideosController :BaseController
    {
        private readonly IVideosRepository videoServices;

        public VideosController(IVideosRepository videoServices) { this.videoServices = videoServices; }

        [HttpGet]
        public IList<VideoModel> GetVideos(int courseId)
        {
            return videoServices.GetVideos(courseId);
        }


    }
}
