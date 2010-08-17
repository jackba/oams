using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OAMS.Models;

namespace OAMS.Controllers
{
    public class FindSiteController : Controller
    {
        //
        // GET: /FindSite/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Find(int campaignID = 0)
        {
            FindSite e = new FindSite();
            e.From = DateTime.Now.Date;
            e.CampaignID = campaignID;
            return View(e);
        }

        //[HttpPost]
        //public ActionResult Find(FindSite e)
        //{
        //    e.Results = SiteRepository.Repo.GetAll().ToList();

        //    return View(e);
        //}

        [HttpPost]
        public JsonResult FindJson(FindSite e)
        {
            List<Site> l = SiteRepository.Repo.GetAll().ToList()
                .Where(r =>
                    (e.StyleList == null || e.StyleList.Count == 0 || e.StyleList.Contains(r.Type))
                && (string.IsNullOrEmpty(e.Format) || r.Format == e.Format)
                && (string.IsNullOrEmpty(e.RoadType1) || r.RoadType1 == e.RoadType1.ToInt())
                && (string.IsNullOrEmpty(e.RoadType2) || r.RoadType2 == e.RoadType2.ToInt())
                && (string.IsNullOrEmpty(e.InstallationPosition1) || r.InstallationPosition1 == e.InstallationPosition1.ToInt())
                && (string.IsNullOrEmpty(e.InstallationPosition2) || r.InstallationPosition2 == e.InstallationPosition2.ToInt())
                && (string.IsNullOrEmpty(e.ViewingDistance) || r.ViewingDistance == e.ViewingDistance.ToInt())
                && (string.IsNullOrEmpty(e.VisibilityBuilding) || r.VisibilityBuilding == e.VisibilityBuilding.ToInt())

                && (string.IsNullOrEmpty(e.VisibilityBuilding) || r.VisibilityBuilding == e.VisibilityBuilding.ToInt())
                && (string.IsNullOrEmpty(e.VisibilityTrees) || r.VisibilityTrees == e.VisibilityTrees.ToInt())
                && (string.IsNullOrEmpty(e.VisibilityBridgeWalkway) || r.VisibilityBridgeWalkway == e.VisibilityBridgeWalkway.ToInt())
                && (string.IsNullOrEmpty(e.VisibilityElectricityPolesOther) || r.VisibilityElectricityPolesOther == e.VisibilityElectricityPolesOther.ToInt())
                && (string.IsNullOrEmpty(e.ViewingSpeed) || r.ViewingSpeed == e.ViewingSpeed.ToInt())

                && (string.IsNullOrEmpty(e.Height) || r.Height == e.Height.ToInt())
                && (string.IsNullOrEmpty(e.DirectionalTrafficPublicTransport) || r.DirectionalTrafficPublicTransport == e.DirectionalTrafficPublicTransport.ToInt())
                && (string.IsNullOrEmpty(e.ShopSignsBillboards) || r.ShopSignsBillboards == e.ShopSignsBillboards.ToInt())
                && (string.IsNullOrEmpty(e.FlagsTemporaryBannersPromotionalItems) || r.FlagsTemporaryBannersPromotionalItems == e.FlagsTemporaryBannersPromotionalItems.ToInt())
                && (string.IsNullOrEmpty(e.CompetitiveProductSigns) || r.CompetitiveProductSigns == e.CompetitiveProductSigns.ToInt())

                && (string.IsNullOrEmpty(e.Geo1FullName) || (r.Geo1 != null && r.Geo1.FullName == e.Geo1FullName))
                && (e.Geo2List == null || e.Geo2List.FirstOrDefault() == null || (r.Geo2 != null && e.Geo2List.Contains(r.Geo2.FullName)))

                ).ToList()
                .Where(r => Helper.DistanceBetweenPoints(r.Lat, r.Lng, e.Lat, e.Long) <= e.Distance)
                .ToList();


            return Json(l.Select(r => new { r.ID, r.Lat, r.Lng, r.Code, r.Format, r.Type }));
        }
    }
}


