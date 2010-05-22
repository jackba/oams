using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OAMS_10.Models;

namespace OAMS_10.Controllers
{
    public class ContractorController : Controller
    {
        //
        // GET: /Contractor/

        ContractorRepository repo = new ContractorRepository();

        public ActionResult Index()
        {
            var v = ContractorRepository.GetAll();
            return View(v);
        }

        //
        // GET: /Contractor/Details/5

        public ActionResult Details(int id)
        {
            return View(repo.Get(id));
        }

        //
        // GET: /Contractor/Create

        public ActionResult Create()
        {

            return View(new Contractor());
        }

        //
        // POST: /Contractor/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            // TODO: Add insert logic here

            var v = new Contractor();

            UpdateModel(v);

            repo.Add(v);

            repo.Save();

            return RedirectToAction("Index");
        }

        //
        // GET: /Contractor/Edit/5

        public ActionResult Edit(int id)
        {
            return View(repo.Get(id));
        }

        //
        // POST: /Contractor/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            // TODO: Add update logic here
            var v = repo.Get(id);

            UpdateModel(v);

            repo.Save();

            return RedirectToAction("Index");
        }

        //
        // GET: /Contractor/Delete/5

        public ActionResult Delete(int id)
        {
            var v = repo.Get(id);
            repo.Delete(v);
            repo.Save();
            return View();
        }

        //
        // POST: /Contractor/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            // TODO: Add delete logic here

            return RedirectToAction("Index");
        }
    }
}
