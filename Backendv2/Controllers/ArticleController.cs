using Microsoft.AspNetCore.Mvc;
using Backendv2.Services;
using Backendv2.Models.Articles;

namespace Backendv2.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ArticleController : BaseController
    {

        private readonly IArticleSerivce articleService;

        public ArticleController (IArticleSerivce articleService)
        {
            this.articleService = articleService;
        }
        [HttpGet]

        public IList<ArticleModel> GetArticles()
        {
            return articleService.GetArticles();
        }


    }
}
