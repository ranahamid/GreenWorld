using GreenWorld.Filters;
using System.Web.Mvc;

namespace GreenWorld
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());

            //ExceptionHandlerAttribute
            filters.Add(new ExceptionHandlerAttribute());
        }
    }
}
