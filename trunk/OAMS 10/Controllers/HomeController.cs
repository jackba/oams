using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OAMS.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to Outdoor Advertising Managerment System.";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
