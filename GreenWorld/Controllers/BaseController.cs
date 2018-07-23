using Newtonsoft.Json;
using GreenWorld.DAL;
using GreenWorld.Filters;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Net;
using GreenWorld.Models;
using Microsoft.AspNet.Identity.Owin;
using log4net;
using System.Reflection;
using Microsoft.Owin.Security;
using System.Text.RegularExpressions;
using Microsoft.AspNet.Identity;
using System.Net.Mail;
using System.Text;
using Microsoft.AspNet.Identity.EntityFramework;

namespace GreenWorld.Controllers
{
    [ExceptionHandler]
    public class BaseController:Controller
    {
        public GreenWorldDataContext Db = new GreenWorldDataContext();
        public HttpClient client;
        public string url;
        public string baseUrl = ConfigurationManager.AppSettings["webapibaseurl"];
   

        /// <summary>
        /// caching implementation
        /// </summary>
        public ICacheStorage CacheStorage = new HttpContextCacheAdapter();
        //public ICacheStorage _cacheStorage = new NullObjectCache(); 


        public static readonly log4net.ILog Log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public BaseController()
        {
            client = new HttpClient {BaseAddress = new Uri(baseUrl)};
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            client.Timeout = TimeSpan.FromMinutes(30);
            //api url
      
        }

        #region  dcoctorappointment        
        public async Task<List<SelectListItem>> GetAllTeacherWorkingTypes()
        {
            url = baseUrl + "api/TeacherWorkingAreaApi/GetAllTeacherWorkingAreasSelectList";
            var responseMessage = await client.GetAsync(url);

            if (responseMessage.IsSuccessStatusCode)
            {
                var responseData = responseMessage.Content.ReadAsStringAsync().Result;
                var entity = JsonConvert.DeserializeObject<List<SelectListItem>>(responseData);
                return entity;
            }
            return null;
        }

        public List<SelectListItem> GetAllWeekDaysName()
        {
            List<SelectListItem> days = new List<SelectListItem>
            {
                new SelectListItem { Value = "0", Text = "রবিবার"},
                new SelectListItem { Value = "1", Text = "সোমবার"},
                new SelectListItem { Value = "2", Text = "মঙ্গলবার"},
                new SelectListItem { Value = "3", Text = "বুধবার"},
                new SelectListItem { Value = "4", Text = "বৃহস্পতিবার"},
                new SelectListItem { Value = "5", Text = "শুক্রবার"},
                new SelectListItem { Value = "6", Text = "শনিবার"},

            };
            return days;
        }

      
        public List<string> GetListFromCommaSeparatedIntList(string list)
        {
            List<string> daysName = new List<string>();
            try
            {
                if (list != string.Empty)
                {

                    var daysIds = list.Split(',').Select(int.Parse).ToList();

                    foreach (var item in daysIds)
                    {
                        daysName.Add(item.ToString());
                    }
                }
            }
            catch (Exception)
            {
                return daysName;
            }
            return daysName;
        }


        public string GetHiddenDaysFromActiveDays(string dayLists)
        {
            StringBuilder daysName = new StringBuilder();
            try
            {
                if (dayLists != string.Empty)
                {
                    var daysIds = dayLists.Split(',').Select(int.Parse).ToList();
                    var numberList = Enumerable.Range(0, 7).ToList();
                    var resultList = numberList.Except(daysIds);
                    foreach (var item in resultList)
                    {
                        if (daysName.ToString() != string.Empty)
                        {
                            daysName.Append("," + item);
                        }
                        else
                        {
                            daysName.Append(item);
                        }
                    }
                }
            }
            catch (Exception)
            {
                return daysName.ToString();
            }
            return daysName.ToString();
        }



        public string GetDaysNameFromNumbers(string dayLists)
        {
            StringBuilder daysName = new StringBuilder();
            try
            {
                if (dayLists != string.Empty)
                {

                    var daysIds = dayLists.Split(',').Select(int.Parse).ToList();

                    foreach (var item in daysIds)
                    {
                        string dayInStr = GetDayByInt(item);

                        if (daysName.ToString() != string.Empty)
                        {
                            daysName.Append("," + dayInStr);
                        }
                        else
                        {
                            daysName.Append(dayInStr);
                        }
                    }
                }
            }
            catch (Exception )
            {
                return daysName.ToString();
            }
            return daysName.ToString();
        }

        public string GetDayByInt(int dayNumber)
        {
            switch (dayNumber)
            {

                case 0:
                    return "রবিবার";

                case 1:
                    return "সোমবার";

                case 2:
                    return "মঙ্গলবার";

                case 3:
                    return "বুধবার";


                case 4:
                    return "বৃহস্পতিবার";

                case 5:
                    return "শুক্রবার";

                case 6:
                    return "শনিবার";

                default:
                    return string.Empty;

            }
        }

        /// <summary>
        /// Dates  represented as Unix timestamp 
        /// with slight modification: it defined as the number
        /// of seconds that have elapsed since 00:00:00, Thursday, 1 January 1970.
        /// To convert it to .NET DateTime use following extension
        /// </summary>
        /// <param name="time">DateTime</param>
        /// <returns>Return as DateTime of uint time
        /// </returns>
        public DateTime ToDateTime(uint time)
        {
            return new DateTime(1970, 1, 1).AddSeconds(time);
        }

        /// <summary>
        /// Dates  represented as Unix timestamp 
        /// with slight modification: it defined as the number
        /// of seconds that have elapsed since 00:00:00 Thursday, 1 January 1970.
        /// To convert .NET DateTime to Unix time use following extension
        /// </summary>
        /// <param name="time">DateTime</param>
        /// <returns>
        /// Return as uint time of DateTime
        /// </returns>

        public uint ToUnixTime(DateTime time)
        {
            return (uint)time.Subtract(new DateTime(1970, 1, 1)).TotalSeconds;
        }

        #endregion

        #region  user

        public ApplicationUser GetUserInfo(ApplicationUserManager UserManager, Guid? id)
        {
            ApplicationUser user = UserManager.FindById(id.ToString());
            if (user.IsFakeEmail)
                user.Email = null;
            return user;
        }

        #endregion


        #region Email
        public bool SendEmailBase(string receiver, string subject, string body)
        {
            var destination = receiver;
            MailMessage msg = new MailMessage();
            msg.To.Add(destination);
            msg.From = new System.Net.Mail.MailAddress(
                             ConfigurationManager.AppSettings["FromAddress"], ConfigurationManager.AppSettings["TeamName"]);
            msg.Subject = subject;

            msg.Body = body;

            SmtpClient smtpclient = new SmtpClient
            {
                UseDefaultCredentials = true,
                Host = ConfigurationManager.AppSettings["BaseMailHost"],
                Port = Int32.Parse(ConfigurationManager.AppSettings["Port"]),
                EnableSsl = false,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential
                (
                    ConfigurationManager.AppSettings["mailAccount"],
                    ConfigurationManager.AppSettings["mailPassword"]
                ),
                Timeout = 20000
            };

            try
            {
                smtpclient.Send(msg);
                return true;

            }
            catch (Exception )
            {
                return false;
            }

        }
        #endregion

        #region Basic
        private string SwitchEngBan(string number)
        {
            string en = "1234567890.,";
            string bn = "১২৩৪৫৬৭৮৯০.,";
            return number.Select(o => en.Contains(o)
                            ? bn.Substring(en.IndexOf(o), 1)
                            : en.Substring(bn.IndexOf(o), 1))
                            .Aggregate((a, b) => a + b);
        }
        #endregion

        #region usermanager, rolemanager
        public BaseController(ApplicationUserManager userManager, ApplicationRoleManager roleManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            RoleManager = roleManager;
            SignInManager = signInManager;
        }

        public ApplicationUserManager _userManager;
        public ApplicationUserManager UserManager
        {
            get => _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            private set => _userManager = value;
        }
        public ISecureDataFormat<AuthenticationTicket> AccessTokenFormat { get;  set; }
        public ApplicationRoleManager _roleManager;
        public ApplicationRoleManager RoleManager
        {
            get => _roleManager ?? HttpContext.GetOwinContext().Get<ApplicationRoleManager>();
            private set => _roleManager = value;
        }

        private ApplicationSignInManager _signInManager;

        public ApplicationSignInManager SignInManager
        {
            get => _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            private set => _signInManager = value;
        }
        #endregion

        #region Account
        public IdentityResult CreateTeacherUser(ApplicationUser user, string password, ApplicationUserManager UserManager)
        {
            IdentityResult result = UserManager.Create(user, password);
            if (!result.Succeeded)
            {
                return result;
            }

            //customer role
            var role = "Teacher";
            var isSuccess = CreateRoleIfMissingAsync(role);
            var resultRole = UserManager.AddToRole(user.Id, role);
            return result;
        }

        public async Task<bool> CreateRoleIfMissingAsync(string role)
        {
            //check if role is available
            var roles = RoleManager.Roles.Where(x => x.Name == role).FirstOrDefault();
            if (roles == null)
            {
                var roleName = new IdentityRole(role);
                var roleresult = await RoleManager.CreateAsync(roleName);
                if (!roleresult.Succeeded)
                {
                     return false;
                }                
            }
            return true;
        }

        public IdentityResult CreateCustomerUser(ApplicationUser user, string password, ApplicationUserManager UserManager)
        {
            IdentityResult result = UserManager.Create(user, password);
            if (!result.Succeeded)
            {
                return result;
            }
            //customer role
            var role = "Customer";
            var resultRole = UserManager.AddToRole(user.Id, role);
            return result;
        }

        public async Task<string> GetUserNameAsync(LoginViewModel model, ApplicationUserManager UserManager)
        {
            if (model.UserName.IndexOf('@') > -1)
            {
                //Validate email format
                string emailRegex = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
                                       @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
                                          @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";

                Regex re = new Regex(emailRegex);
                if (!re.IsMatch(model.UserName))
                {
                    ModelState.AddModelError("UserName", "Email is not valid");
                }
            }
            else
            {
                //validate mobile format
                string emailRegex = @"^[+0-9]*$";
                Regex re = new Regex(emailRegex);
                if (!re.IsMatch(model.UserName))
                {
                    ModelState.AddModelError("UserName", "Username is not valid");
                }
            }

            var userName = model.UserName;
            if (userName.IndexOf('@') > -1)
            {
                var user = await UserManager.FindByEmailAsync(model.UserName);

                if (user == null)
                {
                    ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                    return null;
                }
                else
                {
                    userName = user.UserName;
                    // userName = user.PhoneNumber;
                }
            }

            return userName;
        }


        public ApplicationUser GetApplicationUserTeacher(RegisterTeacher model)
        {
            bool isFakeMail = false;
            if (string.IsNullOrEmpty(model.Email))
            {
                model.Email = GetGeneratedEmail();
                isFakeMail = true;
            }

            var user = new ApplicationUser()
            {
                UserName        = model.Username,
                Email           = model.Email,
                PhoneNumber     = model.PhoneNumber,
                Address         = model.Address,
                Name            = model.Name,
                TeacherName      = model.FullName,
                HospitalName    = model.HospitalName,
                Description     = model.Description,
                IsFakeEmail = isFakeMail,
            };
            return user;
        }


        public ApplicationUser GetApplicationUser(RegisterViewModel model)
        {
            bool isFakeMail = false;
            if (string.IsNullOrEmpty(model.Email))
            {
                model.Email = GetGeneratedEmail();
                isFakeMail = true;
            }

            var user = new ApplicationUser()
            {
                UserName = model.Username,
                Email = model.Email,
                PhoneNumber = model.PhoneNumber,
                Address = model.Address,
                Name = model.Name,
                IsFakeEmail= isFakeMail,
            };
            return user;
        }


        public string GetGeneratedEmail()
        {
            string email = string.Empty;

            email= "temp" + GetRandomNumber() +System.DateTime.Now.Ticks+ "@gmail.com";

            return email;
        }


        // Generate random number for email address
        public static int GetRandomNumber()
        {
            return new Random().Next(100000, 100000000);
        }

        #endregion

        #region Category
        public string GetParentNameFromAllCategories(int? Id)
        {
            if (Id != null)
            {
                foreach (var item in AllCategories)
                {
                    if (item.Value.ToLower() == Id.ToString().ToLower())
                    {
                        return item.Text;
                    }
                }
            }
            return string.Empty;
        }

        // parent category
       

        // parent category
        public List<SelectListItem> Categories
        {
            get
            {
                var entities = Db.CategoryTbls.Where(x => x.Published == true).Where(x => x.Parent1Id == null || x.Parent1Id == 0).Select(x => new Category()
                {
                    Id = x.Id,
                    Name_English = x.Name_English,
                    DisplayOrder = x.DisplayOrder,
                }).OrderBy(x => x.DisplayOrder).ToList();


                List<SelectListItem> listSelect = new List<SelectListItem>();


                foreach (var item in entities)
                {
                    listSelect.Add(new SelectListItem()
                    {
                        Text = item.Name_English,
                        Value = item.Id.ToString()
                    });
                }
                //var listItems = Db.CategoryTbls.Where(x => x.Parent1Id == null || x.Parent1Id == 0 ).Where(x=>x.Published==true).Select(x => new SelectListItem
                //{
                //    Text = x.Name_English,
                //    Value = x.Id.ToString()
                //}).OrderBy(x=>x.).ToList();

                return listSelect;
            }
            set { }
        }

        public List<Category> portfolioChildCategories
        {
            get
            {
                //ShowOnHomePage -true
                List<PortfolioChildCategory> portfolioChildren = new List<PortfolioChildCategory>();
                var  listCategories = GetAllChildCategories();
                return listCategories;
            }
            set { }
        }

        public List<Category> GetAllChildCategories()
        {
            //ShowOnHomePage -true
            List<Category> categories = new List<Category>();

            var listItems = Db.CategoryTbls.Where(x => x.Parent1Id != null && x.ShowOnHomePage== true).Select(x => new Category
            {
                Id = x.Id,
                Name_English = x.Name_English,
                Name_Bangla = x.Name_Bangla,
                Description = x.Description,
                DisplayOrder = x.DisplayOrder,
                ImagePath = HttpUtility.UrlPathEncode(baseUrl + x.ImagePath),
                RawDBImagePath = x.ImagePath,
                Parent1Id = x.Parent1Id,
                ShowOnHomePage = x.ShowOnHomePage,
                IncludeInTopMenu = x.IncludeInTopMenu,
                CreatedOnUtc = x.CreatedOnUtc,
                UpdatedOnUtc = x.UpdatedOnUtc,
                Published = x.Published,
                ParentCategoryName = "Academic Tutoring",

            }).ToList();

            return listItems;

        }

        public List<SelectListItem> ChildCategories
        {
            get
            {
                var listItems = Db.CategoryTbls.Where(x => x.Parent1Id == null && x.Parent1Id != 0).Select(x => new SelectListItem
                {
                    Text = Db.CategoryTbls.FirstOrDefault(a => a.Id == x.Parent1Id).Name_English + " > " + x.Name_English,
                    Value = x.Id.ToString()
                }).ToList();
                return listItems;
            }
            set { }
        }

        public List<SelectListItem> AllCategories
        {
            get
            {
                List<SelectListItem> sli = new List<SelectListItem>();
                foreach (SelectListItem item in Categories)
                {
                    sli.Add(item);
                }
                foreach (SelectListItem item in ChildCategories)
                {
                    int i = item.Text?.IndexOf(">") ?? 0;

                    if (item.Text != null)
                    {
                        string text = item.Text.Substring(0, i - 1);
                        foreach (SelectListItem listItem in ChildCategories)
                        {
                            int k = listItem.Text.LastIndexOf(">", StringComparison.Ordinal);
                            string text2 = listItem.Text.Substring(k + 1);
                            if (text2.Contains(text))
                            {
                                item.Text = listItem.Text + " > " + item.Text.Substring(i + 2);
                            }
                        }
                    }
                    sli.Add(item);
                }
                return sli;
            }
        }

        public bool IsParentOfAnyCategory(int id)
        {

            var query = from x in Db.CategoryTbls
                        where x.Parent1Id == id
                        select x;
            if (query.Any())
            {
                return true;
            }
            return false;
        }


        #endregion

        #region  Banner
        public async Task<List<System.Web.Mvc.SelectListItem>> GetAllBannerList()
        {
            //custom property for parent     
            url = baseUrl + "api/BannersApi/GetAllBannersSelectList";           
            HttpResponseMessage responseMessageParentCat = await client.GetAsync(url);
            List<SelectListItem> entities = new List<SelectListItem>();
            if (responseMessageParentCat.IsSuccessStatusCode)
            {
                var responseDataParentCat = responseMessageParentCat.Content.ReadAsStringAsync().Result;

                entities = JsonConvert.DeserializeObject<List<SelectListItem>>(responseDataParentCat);
            }
            //end custom property for parent 
            return entities;
        }


        #endregion


        #region all
        public List<SelectListItem> SetSelectedItem(List<SelectListItem> items, int? id)
        {
            List<SelectListItem> tempItems = new List<SelectListItem>();

            foreach (var item in items)
            {
                tempItems.Add(new SelectListItem
                {
                    Text = item.Text,
                    Value = item.Value,
                    Selected = (String.Equals(item.Value, id.ToString(), StringComparison.CurrentCultureIgnoreCase)) ? true : false
                });
            }
            return tempItems;
        }
        #endregion



    }
}