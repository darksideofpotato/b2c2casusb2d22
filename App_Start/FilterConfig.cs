using System.Web;
using System.Web.Mvc;

namespace b2c2casusb2d22
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
