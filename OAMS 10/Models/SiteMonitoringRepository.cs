using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OAMS.Models
{
    public class SiteMonitoringRepository : BaseRepository
    {
        public SiteMonitoring Get(int id)
        {
            return DB.SiteMonitorings.Where(r => r.ID == id).SingleOrDefault();
        }

        public SiteMonitoring Create(Action<SiteMonitoring> updateMethod, IEnumerable<HttpPostedFileBase> files, int? contractDetailID)
        {
            SiteMonitoring e = new SiteMonitoring();
            updateMethod(e);

            e.ContractDetailID = contractDetailID;

            DB.SiteMonitorings.AddObject(e);

            Save();

            PicasaRepository picasaRepository = new PicasaRepository();
            picasaRepository.DB = DB;

            picasaRepository.UploadPhoto(e, files);

            Save();

            return e;
        }

        public SiteMonitoring InitWithDefaultValue(int? ContractDetailID)
        {
            SiteMonitoring e = new SiteMonitoring();
            e.ContractDetailID = ContractDetailID;
            e.Working = true;
            e.Clean = true;
            e.CreativeGoodConditon = true;
            e.ExternalInterference = false;
            e.Vandalism = false;
            ContractDetailRepository cdrepo = new ContractDetailRepository();
            ContractDetail cd = cdrepo.Get(ContractDetailID.ToInt());
            e.NoOfBullbs = cd.Site.FrontlitNumerOfLamps;
            e.Site = cd.Site;
            return e;
        }

        public SiteMonitoring Update(int ID, Action<SiteMonitoring> updateMethod, IEnumerable<HttpPostedFileBase> files, List<int> DeletePhotoList)
        {
            SiteMonitoring e = Get(ID);

            updateMethod(e);

            Save();

            PicasaRepository picasaRepository = new PicasaRepository();
            picasaRepository.DB = DB;

            picasaRepository.UploadPhoto(e, files);

            DeletePhoto(DeletePhotoList);

            Save();

            return e;
        }

        public void DeletePhoto(List<int> IDList)
        {
            if (IDList != null)
            {
                List<SiteMonitoringPhoto> l = DB.SiteMonitoringPhotoes.Where(r => IDList.Contains(r.ID)).ToList();
                PicasaRepository picasaRepository = new PicasaRepository();
                foreach (var item in l)
                {
                    picasaRepository.DeletePhoto(item);
                    DB.DeleteObject(item);
                }

                Save();
            }
        }

        public int GetLastID(int contractDetailID)
        {
            return DB.SiteMonitorings.Where(r => r.ContractDetailID == contractDetailID).ToList().LastOrDefault().ID;
        }

        public IEnumerable<SelectListItem> FilterOrder(SiteMonitoring e)
        {
            SiteMonitoringRepository siteMonitoringRepository = new SiteMonitoringRepository();

            var orderList = e.ContractDetail.SiteMonitorings.Select(r => r.Order).Distinct();

            var timelineList = e.ContractDetail.ContractDetailTimelines
                .ToList()
                .Where(r => !orderList.Contains(r.Order) || r.Order == e.Order)
                .Where(r => siteMonitoringRepository.ValidateOrder(e.ID, r.Order))
                .OrderBy(r => r.Order)
                .Select(r => new SelectListItem() { Value = r.Order.ToString(), Text = string.Format("{0}: {1} - {2}", r.Order, String.Format("{0:d}", r.FromDate), String.Format("{0:d}", r.ToDate)) });
            ;

            return timelineList;
        }

        public IEnumerable<SelectListItem> FilterOrderForCreate(int contractDetailID)
        {
            ContractDetailRepository contractDetailRepository = new ContractDetailRepository();
            SiteMonitoringRepository siteMonitoringRepository = new SiteMonitoringRepository();

            var contractDetail = contractDetailRepository.Get(contractDetailID);

            var orderList = contractDetail.SiteMonitorings.Select(r => r.Order).Distinct();

            var timelineList = contractDetail.ContractDetailTimelines
                .ToList()
                .Where(r => !orderList.Contains(r.Order))
                .OrderBy(r => r.Order)
                .Select(r => new SelectListItem() { Value = r.Order.ToString(), Text = string.Format("{0}: {1} - {2}", r.Order, String.Format("{0:d}", r.FromDate), String.Format("{0:d}", r.ToDate)) });
            ;

            return timelineList;
        }

        public bool ValidateOrder(int id, int? newOrder)
        {
            bool isValid = true;
            var e = Get(id);

            if (e != null)
            {
                var timeline = e.ContractDetail.ContractDetailTimelines.SingleOrDefault(r => r.Order == newOrder);

                if (timeline != null)
                {
                    isValid = e.SiteMonitoringPhotoes.Where(r => r.TakenDate.HasValue && !timeline.Contains(r.TakenDate)).Count() == 0;
                }
            }

            return isValid;
        }
    }
}