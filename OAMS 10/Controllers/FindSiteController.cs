using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OAMS.Models;

namespace OAMS.Controllers
{
    [CustomAuthorize(AuthorizedRoles = new string[] { })]
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
            SiteRepository siteRepo = new SiteRepository();

            List<Site> l = siteRepo.GetAll().ToList()
                .Where(r =>
                    //(e.StyleList == null || e.StyleList.Count == 0 || e.StyleList.Contains(r.Type) || e.StyleList.Contains("All"))
                    //(e.StyleList != null && (e.StyleList.Count == 0 || e.StyleList.Contains(r.Type) || e.StyleList.Contains("All")))
                    e.StyleList.Contains(r.Type)
                && (e.ContractorList == null || e.ContractorList.Contains(r.ContractorID.ToInt()))
                && (e.ClientList == null || e.ClientList.Contains(r.CurrentClientID.ToInt()))
                //&& (e.ClientList == null || (r.CurrentClientName != null && e.ClientList.ToLowerArray().Contains(r.CurrentClientName.ToLower())) || (e.ClientList.Contains("") && r.CurrentClientName == null))
                && (string.IsNullOrEmpty(e.Format) || r.Format == e.Format)
                && (string.IsNullOrEmpty(e.RoadType1) || r.RoadType1 == e.RoadType1.ToInt())
                && (string.IsNullOrEmpty(e.RoadType2) || r.RoadType2 == e.RoadType2.ToInt())
                && (string.IsNullOrEmpty(e.InstallationPosition1) || r.InstallationPosition1 == e.InstallationPosition1.ToInt())
                && (string.IsNullOrEmpty(e.InstallationPosition2) || r.InstallationPosition2 == e.InstallationPosition2.ToInt())
                && (string.IsNullOrEmpty(e.ViewingDistance) || r.ViewingDistance == e.ViewingDistance.ToInt())
                        //&& (string.IsNullOrEmpty(e.VisibilityBuilding) || r.VisibilityBuilding == e.VisibilityBuilding.ToInt())

                //&& (string.IsNullOrEmpty(e.VisibilityBuilding) || r.VisibilityBuilding == e.VisibilityBuilding.ToInt())
                        //&& (string.IsNullOrEmpty(e.VisibilityTrees) || r.VisibilityTrees == e.VisibilityTrees.ToInt())
                        //&& (string.IsNullOrEmpty(e.VisibilityBridgeWalkway) || r.VisibilityBridgeWalkway == e.VisibilityBridgeWalkway.ToInt())
                        //&& (string.IsNullOrEmpty(e.VisibilityElectricityPolesOther) || r.VisibilityElectricityPolesOther == e.VisibilityElectricityPolesOther.ToInt())
                && (string.IsNullOrEmpty(e.ViewingSpeed) || r.ViewingSpeed == e.ViewingSpeed.ToInt())
                && (string.IsNullOrEmpty(e.Height) || r.Height == e.Height.ToInt())
                && (string.IsNullOrEmpty(e.DirectionalTrafficPublicTransport) || r.DirectionalTrafficPublicTransport == e.DirectionalTrafficPublicTransport.ToInt())
                && (string.IsNullOrEmpty(e.ShopSignsBillboards) || r.ShopSignsBillboards == e.ShopSignsBillboards.ToInt())
                && (string.IsNullOrEmpty(e.FlagsTemporaryBannersPromotionalItems) || r.FlagsTemporaryBannersPromotionalItems == e.FlagsTemporaryBannersPromotionalItems.ToInt())
                && (string.IsNullOrEmpty(e.CompetitiveProductSigns) || r.CompetitiveProductSigns == e.CompetitiveProductSigns.ToInt())

                && (string.IsNullOrEmpty(e.Geo1FullName) || (r.Geo1 != null && r.Geo1.FullName == e.Geo1FullName))
                && ((string.IsNullOrEmpty(e.Geo1FullName) && e.Geo2List == null)
                    || (e.Geo2List != null && (e.Geo2List.FirstOrDefault() == null || (r.Geo2 != null && e.Geo2List.Contains(r.Geo2.FullName)))))

                    ).ToList()
                .Where(r => !e.IsWithinCircle || Helper.DistanceBetweenPoints(r.Lat, r.Lng, e.Lat, e.Long) <= e.Distance)
                .ToList();

            CodeMasterType cmt = new CodeMasterType();

            CodeMasterRepository codeMasterRepo = new CodeMasterRepository();

            return Json(l.Select(r => new
            {
                r.ID,
                r.Lat,
                r.Lng,
                AddressLine1 = r.AddressLine1 ?? "",
                AddressLine2 = r.AddressLine2 ?? "",

                Code = r.Code ?? "",
                r.Format,
                Type = string.IsNullOrEmpty(r.Type) ? "" : codeMasterRepo.GetNote(cmt.Type, r.Type),
                CodeType = r.Type,
                r.GeoFullName,
                Address = r.AddressLine1 + " " + r.AddressLine2,
                Orientation = r.Width >= r.Height ? "Horizontal" : "Vertical",
                Size = string.Format("{0}m x {1}m", r.Height.ToString(), r.Width.ToString()),
                Lighting = r.FrontlitNumerOfLamps > 0 ? "Fontlit" : "Backlit",
                Contractor = r.Contractor != null ? r.Contractor.Name : "",
                CurrentProduct = r.CurrentProduct ?? "",
                CurrentClient = r.CurrentClientName ?? "",
                r.Score,
                AlbumID = string.IsNullOrEmpty(r.AlbumUrl) ? "" : r.AlbumUrl.Split('/')[9].Split('?')[0],
                AuthID = string.IsNullOrEmpty(r.AlbumUrl) ? "" : r.AlbumUrl.Split('?')[1].Split('=')[1]
            }));
        }

        public ActionResult Find4Contract(int campaignID = 0)
        {
            FindSite e = new FindSite();
            e.From = DateTime.Now.Date;
            e.CampaignID = campaignID;
            return View(e);
        }

        [HttpPost]
        public JsonResult FindJson4Contract(FindSite e, int contractID)
        {
            SiteRepository siteRepo = new SiteRepository();

            List<Site> l = siteRepo.GetAll().ToList()
                .Where(r =>
                    //(e.StyleList == null || e.StyleList.Count == 0 || e.StyleList.Contains(r.Type) || e.StyleList.Contains("All"))
                    //(e.StyleList != null && (e.StyleList.Count == 0 || e.StyleList.Contains(r.Type) || e.StyleList.Contains("All")))
                    e.StyleList.Contains(r.Type)
                && (e.ContractorList == null || e.ContractorList.Contains(r.ContractorID.ToInt()))
                && (e.ClientList == null || e.ClientList.Contains(r.CurrentClientID.ToInt()))
                && (string.IsNullOrEmpty(e.Format) || r.Format == e.Format)
                && (string.IsNullOrEmpty(e.RoadType1) || r.RoadType1 == e.RoadType1.ToInt())
                && (string.IsNullOrEmpty(e.RoadType2) || r.RoadType2 == e.RoadType2.ToInt())
                && (string.IsNullOrEmpty(e.InstallationPosition1) || r.InstallationPosition1 == e.InstallationPosition1.ToInt())
                && (string.IsNullOrEmpty(e.InstallationPosition2) || r.InstallationPosition2 == e.InstallationPosition2.ToInt())
                && (string.IsNullOrEmpty(e.ViewingDistance) || r.ViewingDistance == e.ViewingDistance.ToInt())
                        //&& (string.IsNullOrEmpty(e.VisibilityBuilding) || r.VisibilityBuilding == e.VisibilityBuilding.ToInt())

                //&& (string.IsNullOrEmpty(e.VisibilityBuilding) || r.VisibilityBuilding == e.VisibilityBuilding.ToInt())
                        //&& (string.IsNullOrEmpty(e.VisibilityTrees) || r.VisibilityTrees == e.VisibilityTrees.ToInt())
                        //&& (string.IsNullOrEmpty(e.VisibilityBridgeWalkway) || r.VisibilityBridgeWalkway == e.VisibilityBridgeWalkway.ToInt())
                        //&& (string.IsNullOrEmpty(e.VisibilityElectricityPolesOther) || r.VisibilityElectricityPolesOther == e.VisibilityElectricityPolesOther.ToInt())
                && (string.IsNullOrEmpty(e.ViewingSpeed) || r.ViewingSpeed == e.ViewingSpeed.ToInt())

                && (string.IsNullOrEmpty(e.Height) || r.Height == e.Height.ToInt())
                && (string.IsNullOrEmpty(e.DirectionalTrafficPublicTransport) || r.DirectionalTrafficPublicTransport == e.DirectionalTrafficPublicTransport.ToInt())
                && (string.IsNullOrEmpty(e.ShopSignsBillboards) || r.ShopSignsBillboards == e.ShopSignsBillboards.ToInt())
                && (string.IsNullOrEmpty(e.FlagsTemporaryBannersPromotionalItems) || r.FlagsTemporaryBannersPromotionalItems == e.FlagsTemporaryBannersPromotionalItems.ToInt())
                && (string.IsNullOrEmpty(e.CompetitiveProductSigns) || r.CompetitiveProductSigns == e.CompetitiveProductSigns.ToInt())

                && (string.IsNullOrEmpty(e.Geo1FullName) || (r.Geo1 != null && r.Geo1.FullName == e.Geo1FullName))
                && ((string.IsNullOrEmpty(e.Geo1FullName) && e.Geo2List == null)
                    || (e.Geo2List != null && (e.Geo2List.FirstOrDefault() == null || (r.Geo2 != null && e.Geo2List.Contains(r.Geo2.FullName)))))

                    ).ToList()
                .Where(r => !e.IsWithinCircle || Helper.DistanceBetweenPoints(r.Lat, r.Lng, e.Lat, e.Long) <= e.Distance)
                .ToList();

            CodeMasterType cmt = new CodeMasterType();

            CodeMasterRepository codeMasterRepo = new CodeMasterRepository();

            return Json(l.Select(r => new
            {
                r.ID,
                r.Lat,
                r.Lng,
                AddressLine1 = r.AddressLine1 ?? "",
                AddressLine2 = r.AddressLine2 ?? "",

                Code = r.Code ?? "",
                r.Format,
                Type = string.IsNullOrEmpty(r.Type) ? "" : codeMasterRepo.GetNote(cmt.Type, r.Type),
                CodeType = r.Type,
                r.GeoFullName,
                Address = r.AddressLine1 + " " + r.AddressLine2,
                Orientation = r.Width >= r.Height ? "Horizontal" : "Vertical",
                Size = string.Format("{0}m x {1}m", r.Height.ToString(), r.Width.ToString()),
                Lighting = r.FrontlitNumerOfLamps > 0 ? "Fontlit" : "Backlit",
                Contractor = r.Contractor != null ? r.Contractor.Name : "",
                CurrentProduct = r.CurrentProduct ?? "",
                CurrentClient = r.CurrentClientName ?? "",
                r.Score,
                AlbumID = string.IsNullOrEmpty(r.AlbumUrl) ? "" : r.AlbumUrl.Split('/')[9].Split('?')[0],
                AuthID = string.IsNullOrEmpty(r.AlbumUrl) ? "" : r.AlbumUrl.Split('?')[1].Split('=')[1],
                Added = r.ContractDetails.Where(r1 => r1.ContractID == contractID).Count() > 0 ? true : false
            }));
        }

    }
}


