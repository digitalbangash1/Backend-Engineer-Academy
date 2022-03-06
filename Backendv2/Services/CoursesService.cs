using Backendv2.Models.Courses;
using MySql.Data.MySqlClient;

namespace Backendv2.Services
{
    public class CoursesService : ICoursesService
    {
        public IList<CourseModel> GetCourses()
        {
            //TODO connec to mysql or any database
            var courses = new List<CourseModel>();
            //TODO conn string must be outside of code
            var connectionString = "server=localhost;port=3306;database=backend;user=root;password=12345";
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select * from courses", conn);

                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        courses.Add(new CourseModel()
                        {
                            Id = Convert.ToInt32(reader["coursesID"]),
                            Name = reader["CourseName"].ToString(),
                            Description = reader["CourseDescription"].ToString(),
                        });
                    }
                }
            }

            return courses;
        }
    }
}
