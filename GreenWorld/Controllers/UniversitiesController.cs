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
using System.IO;
using System.Web.Hosting;
using GreenWorld.Filters;
using GreenWorld.Helpers;


namespace GreenWorld.Controllers
{
    [Authorize(Roles = "Admin")]
    [ExceptionHandler]
    public class UniversitiesController : BaseController
    {
        private readonly FilesHelper _filesHelper;
        readonly string tempPath = "~/Universities/";
        readonly string serverMapPath = "~/Content/images/Universities/";
        private readonly string UrlBase = "/Content/images/Universities/"; //with out '/'
        readonly string DeleteURL = "/Universities/DeleteAdditionalFile/?file=";
        private string StorageRoot => Path.Combine(HostingEnvironment.MapPath(serverMapPath));
        string DeleteType = "GET";

        public UniversitiesController()
        {
            int randN = GetRandomNumber();
            _filesHelper = new FilesHelper(DeleteURL, DeleteType, StorageRoot + randN + "/", UrlBase + randN + "/", tempPath + randN + "/", serverMapPath + randN + "/");
            //api url                  
            url = baseUrl + "api/UniversityApi";
        }


        // GET: Universities
        [AllowAnonymous]
        public async Task<ActionResult> Index()
        {
           url = url + "/" + "GetAllPublishedUniversities";
            var responseMessage = await client.GetAsync(url);
            if (!responseMessage.IsSuccessStatusCode) throw new Exception("Exception");
            var responseData = responseMessage.Content.ReadAsStringAsync().Result;
            var entity = JsonConvert.DeserializeObject<List<University>>(responseData);
            return View(entity);
        }

        public async Task<ActionResult> List()
        {
            var responseMessage = await client.GetAsync(url);
            if (!responseMessage.IsSuccessStatusCode) throw new Exception("Exception");
            var responseData = responseMessage.Content.ReadAsStringAsync().Result;
            var entity = JsonConvert.DeserializeObject<List<University>>(responseData);
            return View(entity);
        }


        public async Task<University> GetDetails(int? id)
        {
            var responseMessage = await client.GetAsync(url + "/" + id);
            if (!responseMessage.IsSuccessStatusCode) throw new Exception("Exception");
            var responseData = responseMessage.Content.ReadAsStringAsync().Result;
            var entity = JsonConvert.DeserializeObject<University>(responseData);
            return entity;
        }

        // GET: Universities/Details/5
        [AllowAnonymous]
        public async Task<ActionResult> Details(int? id)
        {
            var entity = await GetDetails(id);
            return View(entity);
        }


        // GET: Universities/Create
        public ActionResult Create()
        {
            University entity = new University();

            return View(entity);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(University entity)
        {
            if (!ModelState.IsValid) return View(entity);

            var responseMessage = await client.PostAsJsonAsync(url, entity);
            if (responseMessage.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }

            return View(entity);
        }

        [HttpPost]
        public JsonResult Upload()
        {
            var resultList = new List<ViewDataUploadFilesResult>();

            var currentContext = HttpContext;
            _filesHelper.UploadAndShowResults(currentContext, resultList);
            JsonFiles files = new JsonFiles(resultList);

            bool isEmpty = !resultList.Any();
            if (isEmpty)
            {
                return Json("Error ");
            }

            return Json(files);
        }

        [HttpGet]
        public JsonResult DeleteFile(string file)
        {
            _filesHelper.DeleteFile(file);
            return Json("OK", JsonRequestBehavior.AllowGet);
        }
        // GET: Universities/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            //var responseMessage = await client.GetAsync(url + "/" + id);
            //if (!responseMessage.IsSuccessStatusCode) throw new Exception("Exception");
            //var responseData = responseMessage.Content.ReadAsStringAsync().Result;
            //var entity = JsonConvert.DeserializeObject<University>(responseData);        
            var entity = await GetDetails(id);
            return View(entity);
        }



        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(int id, University entity)
        {
            if (!ModelState.IsValid) return View(entity);   
            HttpResponseMessage responseMessage = await client.PutAsJsonAsync(url + "/" + id, entity);
            if (responseMessage.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            return View(entity);
        }



        // GET: Universities/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            //var responseMessage = await client.GetAsync(url + "/" + id);
            //if (!responseMessage.IsSuccessStatusCode) throw new Exception("Exception");
            //var responseData = responseMessage.Content.ReadAsStringAsync().Result;

            //var entity = JsonConvert.DeserializeObject<University>(responseData);
            var entity = await GetDetails(id);

            return View(entity);
        }

        // POST: Universities/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            var responseMessage = await client.DeleteAsync(url + "/" + id);
            if (responseMessage.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            throw new Exception("Exception");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                Db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
