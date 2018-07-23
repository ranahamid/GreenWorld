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
using GreenWorld.Helpers;
using System.IO;
using System.Web.Hosting;

namespace GreenWorld.Controllers
{
    [AllowAnonymous]
    public class TeachersController : BaseController
    {
        private readonly FilesHelper _filesHelper;
        readonly string _tempPath = "~/RegisterTeacher/";
        private readonly string _serverMapPath = "~/Content/images/RegisterTeacher/";
        private readonly string _urlBase = "/Content/images/RegisterTeacher/";
        private readonly string DeleteURL = "/RegisterTeacher/DeleteFile/?file=";

        private string StorageRoot => Path.Combine(HostingEnvironment.MapPath(_serverMapPath));
        private const string DeleteType = "GET";


        public TeachersController()
        {
            var randN = GetRandomNumber();

            _filesHelper = new FilesHelper(DeleteURL, DeleteType, StorageRoot + randN + "/", _urlBase + randN + "/", _tempPath + randN + "/", _serverMapPath + randN + "/");

            //api url                  
            url = baseUrl + "api/TeachersApi";
        }

        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "Teacher")]
        [ExceptionHandler]
        public ActionResult Dashboard()
        {
            return View();
        }

        [Authorize(Roles ="Admin")]
        // GET: Teachers
        public async Task<ActionResult> List()
        {
            var responseMessage = await client.GetAsync(url);
            if (responseMessage.IsSuccessStatusCode)
            {
                var responseData = responseMessage.Content.ReadAsStringAsync().Result;
                var entity = JsonConvert.DeserializeObject<List<RegisterTeacher>>(responseData);
                return View(entity);
            }
            throw new Exception("Exception");
        }

        [Authorize(Roles = "Admin")]
        // GET: Teachers/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            HttpResponseMessage responseMessage = await client.GetAsync(url + "/" + id);
            if (!responseMessage.IsSuccessStatusCode) throw new Exception("Exception");
            var responseData = responseMessage.Content.ReadAsStringAsync().Result;
            var entity = JsonConvert.DeserializeObject<RegisterTeacher>(responseData);
            return View(entity);
        }
        //[AllowAnonymous]
        //// GET: Teachers/Create
        //public async Task<ActionResult> Create()
        //{
        //    var entity = new RegisterTeacher();
        //    return CreateSub(entity);
        //}

        //public ActionResult CreateSub(RegisterTeacher entity)
        //{

        //    entity.CanVisitDays = GetAllWeekDaysName();
        //    return View("Create", entity);
        //}

        public ActionResult EditSub(RegisterTeacher entity)
        {
            entity.CanVisitDays = GetAllWeekDaysName();

            return View("Edit", entity);
        }

        //[AllowAnonymous]
        //// POST: Teachers/Create
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> Create(RegisterTeacher entity)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        //end parent name
        //        var responseMessage = await client.PostAsJsonAsync(url, entity);
        //        if (responseMessage.IsSuccessStatusCode)
        //        {
        //            return RedirectToAction("Index");
        //        }
        //    }
        //    return CreateSub(entity);
        //}


        [HttpPost]
        public JsonResult Upload()
        {
            var resultList = new List<ViewDataUploadFilesResult>();
            var currentContext = HttpContext;
            _filesHelper.UploadAndShowResults(currentContext, resultList);
            var files = new JsonFiles(resultList);

            var isEmpty = !resultList.Any();
            return isEmpty ? Json("Error ") : Json(files);
        }

        [HttpGet]
        public JsonResult DeleteFile(string file)
        {
            _filesHelper.DeleteFile(file);
            return Json("OK", JsonRequestBehavior.AllowGet);
        }

        [Authorize(Roles = "Admin")]
        // GET: Teachers/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            var responseMessage = await client.GetAsync(url + "/" + id);
            if (!responseMessage.IsSuccessStatusCode) throw new Exception("Exception");
            var responseData = responseMessage.Content.ReadAsStringAsync().Result;
            var entity = JsonConvert.DeserializeObject<RegisterTeacher>(responseData);

            return EditSub(entity);
        }



        [Authorize(Roles = "Admin")]
        // POST: Teachers/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(int id, RegisterTeacher entity)
        {
            if (ModelState.IsValid)
            {
                var responseMessage = await client.PutAsJsonAsync(url + "/" + id, entity);
                if (responseMessage.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index");
                }
            }
            return EditSub(entity);          
        }

        [Authorize(Roles = "Admin")]
        // GET: Teachers/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            var responseMessage = await client.GetAsync(url + "/" + id);
            if (!responseMessage.IsSuccessStatusCode) throw new Exception("Exception");
            var responseData = responseMessage.Content.ReadAsStringAsync().Result;
            var entity = JsonConvert.DeserializeObject<RegisterTeacher>(responseData);
            return View(entity);
        }

        [Authorize(Roles = "Admin")]
        // POST: Teachers/Delete/5
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