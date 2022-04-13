using Backendv2.Models.Articles;
using MySql.Data.MySqlClient;
using System.Data;

namespace Backendv2.Services
{
    public class ArticlesServices : IArticleSerivce

    {
        private readonly IDbConnectionService dbConnectionService;

        public ArticlesServices(IDbConnectionService dbConnectionService)
        {
            this.dbConnectionService = dbConnectionService;
        }

        public IList<ArticleModel> GetArticles()
        {
            var article = new List<ArticleModel>();
            using (var conn = dbConnectionService.Create())
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from article";

                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        article.Add(GetArticles(reader));
                    }
                }
            }

            return article;
        }

        private ArticleModel GetArticles(IDataReader reader)
        {
            return new ArticleModel()
            {
                Id = Convert.ToInt32(reader["ID"]),
                courseId = Convert.ToInt32(reader["coursesID"]),
                Title = reader["articleTitle"].ToString(),
                Description = reader["articleDes"].ToString(),
                Link = reader["articlelink"].ToString(),
            };
        }
    }
}
