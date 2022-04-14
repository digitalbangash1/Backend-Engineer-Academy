using Backendv2.Models.Courses;
using System.Data;

namespace Backendv2.Services
{
    public class CoursesService : ICoursesService
    {
        private readonly IDbConnectionService dbConnectionService;

        public CoursesService(IDbConnectionService dbConnectionService)
        {
            this.dbConnectionService = dbConnectionService;
        }

        public void CreateCourse(string name, string description)
        {
            using(var conn = dbConnectionService.Create())
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO courses (courseName, courseDescription) VALUES (@name, @description)";

                var nameParam = cmd.CreateParameter();
                nameParam.ParameterName = "@name";
                nameParam.Value = name;
                cmd.Parameters.Add(nameParam);

                var descriptionParam = cmd.CreateParameter();
                descriptionParam.ParameterName = "@description";
                descriptionParam.Value = description;
                cmd.Parameters.Add(descriptionParam);

                cmd.ExecuteNonQuery();
            }
        }

        public void UpdateCourse(int id, string name, string description)
        {
            using (var conn = dbConnectionService.Create())
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "UPDATE courses SET courseName=@name, courseDescription=@description WHERE coursesID=@id";

                var idParam = cmd.CreateParameter();
                idParam.ParameterName = "@id";
                idParam.Value = id;
                cmd.Parameters.Add(idParam);

                var nameParam = cmd.CreateParameter();
                nameParam.ParameterName = "@name";
                nameParam.Value = name;
                cmd.Parameters.Add(nameParam);

                var descriptionParam = cmd.CreateParameter();
                descriptionParam.ParameterName = "@description";
                descriptionParam.Value = description;
                cmd.Parameters.Add(descriptionParam);

                cmd.ExecuteNonQuery();
            }
        }

        public CourseModel GetById(int id)
        {
            using (var conn = dbConnectionService.Create())
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from courses where coursesID=@courseId";

                var idParam = cmd.CreateParameter();
                idParam.ParameterName = "@courseId";
                idParam.Value = id;
                cmd.Parameters.Add(idParam);

                using (var reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return GetCourse(reader);
                    }
                }
            }

            return null;
        }

        public IList<CourseModel> GetCourses()
        {
            var courses = new List<CourseModel>();
            using (var conn = dbConnectionService.Create())
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from courses";

                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        courses.Add(GetCourse(reader));
                    }
                }  
            }

            return courses;
        }

        private CourseModel GetCourse(IDataReader reader)
        {
            return new CourseModel()
            {
                Id = Convert.ToInt32(reader["coursesID"]),
                Name = reader["CourseName"].ToString(),
                Description = reader["CourseDescription"].ToString(),
            };
        }


        public void DeleteCourse( string name)
        {
            using (var conn = dbConnectionService.Delete())
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "DELETE FROM courses WHERE courseName=@name";

                var idParam = cmd.CreateParameter();
                idParam.ParameterName = "@name";
                idParam.Value = name;
                cmd.Parameters.Add(idParam);
                cmd.ExecuteNonQuery();
            }
        }

    }
}
