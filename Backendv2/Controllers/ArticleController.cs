using Microsoft.AspNetCore.Mvc;
using Backendv2.Services;
using Backendv2.Models.Articles;

namespace Backendv2.Controllers
{
    [ApiController]
    [Route("Articles/{courseId}")]
    public class ArticlesController : BaseController
    {

        private readonly IArticleSerivce articleService;

        public ArticleController (IArticleSerivce articleService)
        {
            this.articleService = articleService;
        }
        [HttpGet]

        public IList<ArticleModel> GetArticles(int courseId)
        {
            return articleService.GetArticles(courseId);
        }


    }
}
