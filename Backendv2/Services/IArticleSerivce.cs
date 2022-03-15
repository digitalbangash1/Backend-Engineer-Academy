using Backendv2.Models.Articles;

namespace Backendv2.Services
{
    public interface IArticleSerivce
    {
        IList<ArticleModel> GetArticles();
    }
}
