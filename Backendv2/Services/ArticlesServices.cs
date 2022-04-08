using Backendv2.Models.Articles;
using MySql.Data.MySqlClient;

namespace Backendv2.Services
{
    public class ArticlesServices : IArticleSerivce
    {
        public IList<ArticleModel> GetArticles()
        {
            var articles = new List<ArticleModel>();
            var connectionString = "server=localhost;port=3306;database=backend2;user=root;password=salim123";
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("Select * from article inner join courses on courses.coursesID = article.coursesID", conn);
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        articles.Add(new ArticleModel()
                            {
                            Id = Convert.ToInt32(reader["article_id"]),
                            courseId = Convert.ToInt32(reader["coursesID"]),
                            Description = reader["articleDes"].ToString(),



                        });
                    }
                }
            }
           return articles;
        }
    }
}
