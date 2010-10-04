using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS.Models
{
    public class SiteMonitoringRepository : BaseRepository<SiteMonitoringRepository>
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

    }
}