using Microsoft.AspNetCore.Mvc;
using Backendv2.Models.Articles;
using Backendv2.Repositories;

namespace Backendv2.Controllers
{
    [ApiController]
    [Route("Articles")]
    public class ArticlesController : BaseController
    {

        private readonly IArticlesRepository articleService;

        public ArticlesController (IArticlesRepository articleService)
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
