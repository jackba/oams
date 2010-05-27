using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OAMS_10.Models;

namespace OAMS_10.Controllers
{
    [HandleError]
    public class ContractDetailController : Controller
    {
        ContractDetailRepository repo = new ContractDetailRepository();

        public ActionResult Edit(int id)
        {
            return View(repo.Get(id));
        }

        //[HttpPost]
        //public ActionResult Edit(int id, FormCollection collection)
        //{
        //    var v = repo.Get(id);

        //    UpdateModel(v);

        //    repo.Save();

        //    return RedirectToAction("Index");
        //}

        [HttpPost]
        public ActionResult Edit(ContractDetail e)
        {
            return RedirectToAction("Index");
        }
    }
}
