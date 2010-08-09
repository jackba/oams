﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OAMS.Models;

namespace OAMS.Controllers
{
    public class SiteController : Controller
    {
        //
        // GET: /Site/

        SiteRepository repo = new SiteRepository();

        public ActionResult Index()
        {
            return View(repo.GetAll());
        }

        //
        // GET: /Site/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Site/Create

        public ActionResult Create(int? contractID)
        {
            Site e = new Site();
            e.CloseToAirport = false;
            e.CloseToFactory = false;
            e.CloseToGasStation = false;
            e.CloseToHopistal = false;
            e.CloseToMarket = false;
            e.CloseToOffice = false;
            e.CloseToParking = false; ;
            e.CloseToResident = false;
            e.CloseToSchool = false;
            e.CloseToShopping = false;
            e.CloseToStadium = false;
            e.CloseToStation = false;
            e.CloseToTownCenter = false;
            e.CloseToUniversity = false;

            e.VisibilityBridgeWalkway = 5;
            e.VisibilityBuilding = 5;
            e.VisibilityElectricityPolesOther = 5;
            e.VisibilityTrees = 5;

            e.DirectionalTrafficPublicTransport = 5;
            e.ShopSignsBillboards = 5;
            e.FlagsTemporaryBannersPromotionalItems = 5;
            e.CompetitiveProductSigns = 5;


            return View(e);
        }

        //
        // POST: /Site/Create

        [HttpPost]
        public ActionResult Create(int? contractID, FormCollection collection)
        {
            var v = new Site();

            UpdateModel(v);

            repo.Add(v, contractID);
            repo.Save();

            return RedirectToAction("Index");
        }

        //
        // GET: /Site/Edit/5

        public ActionResult Edit(int id)
        {
            Site e = repo.Get(id);
            e.GeoFullName = GeoRepository.Repo.GetFullname(e.Geo1, e.Geo2, e.Geo3);
            return View(e);
        }

        //
        // POST: /Site/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            // TODO: Add update logic here
            Site e = repo.Get(id);

            UpdateModel(e);

            repo.UpdateGeo(e);

            repo.Save();

            return RedirectToAction("Index");
        }

        //
        // GET: /Site/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Site/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            return RedirectToAction("Index");
        }

        [HttpPost]
        public JsonResult JsonList()
        {
            OAMSEntities db = new OAMSEntities();
            var result = db.Sites.Where(r => r.Lng > 0 && r.Lat > 0)
                .Select(r => new { r.Lat, r.Lng, r.Code, Note = r.Code })
                .ToList();

            return Json(result);
        }


        public ActionResult Find()
        {
            return View();
        }

    }
}
