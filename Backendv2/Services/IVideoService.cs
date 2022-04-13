using Backendv2.Models.Videos;

namespace Backendv2.Services
{
    public interface IVideoService
    {
        IList<VideoModel> GetVideos();
    }
}