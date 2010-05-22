using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OAMS_10.Models;

namespace OAMS_10.Controllers
{
    public class ListingController : Controller
    {
        [HttpPost]
        public JsonResult ListGeos(string searchText, int maxResults)
        {
            OAMSEntities db = new OAMSEntities();
            var result = db.Geos.Where(r => r.FullName.Contains(searchText))
                .Take(maxResults)
                .Select(r => new { r.ID, r.FullName })
                .ToList();
            
            return Json(result);
        }

        [HttpPost]
        public JsonResult ListCodeMaster(string searchText, int maxResults, string type)
        {
            OAMSEntities db = new OAMSEntities();
            var result = db.CodeMasters.Where(r => r.Note.Contains(searchText) && r.Type == type)
                .Take(maxResults)
                .Select(r => new { r.ID, r.Code, r.Note })
                .ToList();
            return Json(result);
        }

    }
}
