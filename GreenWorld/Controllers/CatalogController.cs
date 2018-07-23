using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GreenWorld.Models;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.Threading.Tasks;
using GreenWorld.DAL;
using System.Configuration;
using GreenWorld.Filters;

namespace GreenWorld.Controllers
{
    [ExceptionHandler]
    public class CatalogController : BaseController
    {
        public CatalogController()
        {
           
        }


        public ActionResult MenuBanner()
        {
           // Banner entity = new Banner();

            return PartialView("_MenuBanner");
        }


        public ActionResult HomepageBanner()
        {
            url = baseUrl + "api/BannersApi/GetHomePageBanner";

            var responseMessage = new WebClient().DownloadString(url);

            var entity = JsonConvert.DeserializeObject<BannerMobile>(responseMessage);

            return PartialView("_HomepageBanner", entity);
        }

        public ActionResult Portfolio()
        {
            Portfolio portfolio = new Portfolio();
            portfolio.ParenCategories = Categories;
            portfolio.portfolioChildren= portfolioChildCategories;
            return PartialView("_Portfolio", portfolio);
        }

        public ActionResult Products()
        {
            ProductViewModel vm = new ProductViewModel();
            url = baseUrl + "api/ProductApi/GetHomePageStationaries";

            var responseMessage = new WebClient().DownloadString(url);
            var entity = JsonConvert.DeserializeObject<List<Product>>(responseMessage);
            vm.Stationary = entity;

            url = baseUrl + "api/ProductApi/GetHomePageBooks";

            var responseMessage2 = new WebClient().DownloadString(url);
            var entity2 = JsonConvert.DeserializeObject<List<Product>>(responseMessage2);
            vm.Books = entity2;

            return PartialView("_ProductsHomePage", vm);
        }


    }
}