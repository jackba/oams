using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OAMS.Models;

namespace OAMS.Controllers
{
    public class ListingController : Controller
    {
        [HttpPost]
        public JsonResult ListGeos(string searchText, int maxResults, int? level = null)
        {
            OAMSEntities db = new OAMSEntities();
            var result = db.Geos.Where(r => (r.FullName.Contains(searchText) || r.FullNameNoDiacritics.Contains(searchText))
                && (level == null || r.Level == level)
                )
                .Distinct()
                .Take(maxResults)
                .Select(r => new { r.ID, r.FullName })
                .ToList();

            return Json(result);
        }

        [HttpPost]
        public JsonResult ListGeo2(string parentFullName)
        {
            GeoRepository geoRepository = new GeoRepository();

            Geo e = geoRepository.GetByFullname(parentFullName);

            return Json(e.Children.Select(r => new { r.ID, r.FullName }).OrderBy(r => r.FullName));
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
