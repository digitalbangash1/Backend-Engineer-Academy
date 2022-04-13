using Backendv2.Models.Videos;
using System.Data;

namespace Backendv2.Services
{
    public class VideoServices : IVideoService
    {
        private readonly IDbConnectionService dbConnectionService;

        public VideoServices(IDbConnectionService dbConnectionService)
        {
            this.dbConnectionService = dbConnectionService;
        }    
        public IList<VideoModel> GetVideos()
        {
            var videos = new List<VideoModel>();
            using (var conn = dbConnectionService.Create())
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from video";

                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        videos.Add(GetVideos(reader));
                    }
                }
            }

            return videos;
        }

        private VideoModel GetVideos(IDataReader reader)
        {
            return new VideoModel()
            {
                Id = Convert.ToInt32(reader["ID"]),
                coursesID = Convert.ToInt32(reader["coursesID"]),
                Title = reader["videoTitle"].ToString(),
                Description = reader["videoDes"].ToString(),
                VideoLinks = reader["videoLink"].ToString(),
            };
        }
    }
}
