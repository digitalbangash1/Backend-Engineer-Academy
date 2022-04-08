
using Backendv2.Models.the_courses;
using System.Data;

namespace Backendv2.Services
{
    public class The_coursesSerivce : IThe_coursesSerivce
    {
        private readonly IDbConnectionService dbConnectionService;


        public The_coursesSerivce (IDbConnectionService dbConnectionService)
        {
            this.dbConnectionService = dbConnectionService;
        }


        public IList<The_coursesModel> GetThecourses()
        {
            var thecourses = new List<The_coursesModel>();

           
            using (var conn = dbConnectionService.Create())
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM THE_courses;";

               
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {

                        thecourses.Add(GetThecourses(reader));

                    }

                }

            }
            return thecourses;
        }


        private The_coursesModel GetThecourses(IDataReader reader)
        {
            return new The_coursesModel()
            {
                Id = Convert.ToInt32(reader["coursesID"]),

                CourseName = reader["CourseName"].ToString(),

                CourseDescription = reader["CourseDescription"].ToString(),

                articleDes = reader["articleDes"].ToString(),

                videos = reader["videos"].ToString(),

                documentDes = reader["documentDes"].ToString(),
            };
        }
    }
}
