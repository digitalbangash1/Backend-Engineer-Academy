﻿namespace Backendv2.Models.Videos
{
    public class VideoModel
    {
        public int Id { get; set; }

        public int coursesID { get; set; }
        public string Title { get; set; }
        
        public string Description { get; set; }

        public string VideoLinks { get; set; }
    }
}
