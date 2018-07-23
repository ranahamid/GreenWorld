using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using GreenWorld.Models;
using GreenWorld.DAL;
using System.Web;
using Microsoft.AspNet.Identity.Owin;
using System.IO;
using Newtonsoft.Json;

namespace GreenWorld.Controllers.Api
{
    public class AccountApiController : ApiController
    {
        private readonly IAccountAccessRepository<RegisterViewModel, int> _repository;

        public AccountApiController(IAccountAccessRepository<RegisterViewModel, int> r)
        {
            _repository = r;
        }

        public ApplicationUserManager UserManager
        {
            get { return HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>(); }
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return HttpContext.Current.GetOwinContext().Get<ApplicationSignInManager>();
            }
        }

        
        [Route("api/Account/RegisterTeacher/")]
        // Post : api/Account/RegisterTeacher/
        public async Task<UserStatusInfo> RegisterTeacher( /*RegisterBindingMobile model*/)
        {
            //RegisterBindingMobile model
            string responseData = await Request.Content.ReadAsStringAsync();
            var entity = JsonConvert.DeserializeObject<RegisterTeacher>(responseData);

            return _repository.RegisterTeacher(entity, UserManager);
        }

        [Route("api/Account/Register/")]
        // Post : api/Account/Register/
        public async Task<UserStatusInfo> Register( /*RegisterBindingMobile model*/)
        {

            //RegisterBindingMobile model
            string responseData = await Request.Content.ReadAsStringAsync();
            var entity = JsonConvert.DeserializeObject<RegisterViewModel>(responseData);

            return _repository.Register(entity, UserManager);
        }
        
     
        [Route("api/Account/Login/")]
        // Post : api/Account/Login
        public async Task<UserStatusInfo> Login(/*LoginViewModel model*/)
        {            
            string responseData = await Request.Content.ReadAsStringAsync();
            var entity = JsonConvert.DeserializeObject<LoginViewModel>(responseData);

            return await _repository.Login(entity, SignInManager, UserManager);
        }
        

    }
}
