using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OAMS.Models;
using Google.GData.Photos;

namespace OAMS.Controllers
{
    [CustomAuthorize(AuthorizedRoles = new string[] { })]
    public class SiteMonitoringController : AsyncController
    {
        //
        // GET: /Site/

        SiteMonitoringRepository repo = new SiteMonitoringRepository();



        //
        // GET: /Site/Details/5

        //public ActionResult Details(int id)
        //{
        //    return View();
        //}

        //
        // GET: /Site/Create

        public ActionResult Create(int? contractDetailID)
        {
            return View();
        }

        //
        // POST: /Site/Create



        [HttpPost]
        public ActionResult Create(int? contractDetailID, IEnumerable<HttpPostedFileBase> files)
        {
            repo.Create(UpdateModel, files, contractDetailID);

            ContractDetailRepository contractDetailRepository = new ContractDetailRepository();

            ContractDetail e = contractDetailRepository.Get(contractDetailID.Value);

            return RedirectToAction("Edit", "Contract", new { id = e.ContractID });
        }

        //
        // GET: /Site/Edit/5

        public ActionResult Edit(int id)
        {
            SiteMonitoring e = repo.Get(id);
            return View(e);
        }

        //
        // POST: /Site/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection, IEnumerable<HttpPostedFileBase> files, List<int> DeletePhotoList)
        {
            // TODO: Add update logic here
            SiteMonitoring e = repo.Update(id, UpdateModel, files, DeletePhotoList);

            return RedirectToAction("Edit", "Contract", new { id = e.ContractDetail.ContractID });
        }

        public ActionResult EditLast(int contractDetailID)
        {
            return RedirectToAction("Edit", new { id = repo.GetLastID(contractDetailID) });
        }


        //public ActionResult Delete(int id)
        //{
        //    //repo.DeletePhoto(id);
        //    repo.Delete(id);
        //    return RedirectToAction("Index");

        //    //return View();
        //}

        //
        // POST: /Site/Delete/5

        //[HttpPost]
        //public ActionResult Delete(int id, FormCollection collection)
        //{
        //    //repo.DeletePhoto(id);
        //    repo.Delete(id);
        //    return RedirectToAction("Index");
        //}





    }
}
