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

            e.CreatedDate = DateTime.Now;
            e.LastUpdatedDate = e.CreatedDate;

            e.ContractDetailID = contractDetailID;

            DB.SiteMonitorings.AddObject(e);

            Save();

            PicasaRepository picasaRepository = new PicasaRepository();
            picasaRepository.DB = DB;

            picasaRepository.UploadPhoto(e, files);

            Save();

            return e;
        }

        public SiteMonitoring Update(int ID, Action<SiteMonitoring> updateMethod, IEnumerable<HttpPostedFileBase> files, List<int> DeletePhotoList)
        {
            SiteMonitoring e = Get(ID);

            updateMethod(e);
            e.LastUpdatedDate = DateTime.Now;


            Save();


            PicasaRepository picasaRepository = new PicasaRepository();
            picasaRepository.DB = DB;

            picasaRepository.UploadPhoto(e, files);

            DeletePhoto(DeletePhotoList);

            Save();

            return e;
        }

        //public void UpdateGeo(Site e)
        //{
        //    GeoRepository geoRepository = new GeoRepository();
        //    geoRepository.Set3LevelByFullname(e.NewGeoFullName, e.UpdateGeo);
        //}

        //public void UpdateFrontBackLit(Site e)
        //{
        //    if (!e.FrontlitNumerOfLamps.HasValue
        //                   || e.FrontlitNumerOfLamps <= 0)
        //    {
        //        e.FontLightArmsStraight = null;
        //        e.FontlitArmsPlacement = null;
        //        e.FontlitIlluminationDistribution = null;
        //        e.FrontlitSideLighting = null;
        //        e.FrontlitTopBottom = null;
        //    }
        //    else
        //    {
        //        e.BacklitFormat = null;
        //        e.BacklitIlluninationSpread = null;
        //        e.BacklitLightBoxLeakage = null;
        //        e.BacklitLightingBlocks = null;
        //        e.BacklitVisualLegibility = null;
        //    }
        //}

        //public Site InitWithDefaultValue()
        //{
        //    Site e = new Site();
        //    e.CloseToAirport = false;
        //    e.CloseToFactory = false;
        //    e.CloseToGasStation = false;
        //    e.CloseToHopistal = false;
        //    e.CloseToMarket = false;
        //    e.CloseToOffice = false;
        //    e.CloseToParking = false; ;
        //    e.CloseToResident = false;
        //    e.CloseToSchool = false;
        //    e.CloseToShopping = false;
        //    e.CloseToStadium = false;
        //    e.CloseToStation = false;
        //    e.CloseToTownCenter = false;
        //    e.CloseToUniversity = false;

        //    e.VisibilityBridgeWalkway = 5;
        //    e.VisibilityBuilding = 5;
        //    e.VisibilityHight = 5;
        //    e.VisibilityElectricityPolesOther = 5;
        //    e.VisibilityTrees = 5;

        //    e.DirectionalTrafficPublicTransport = 5;
        //    e.ShopSignsBillboards = 5;
        //    e.FlagsTemporaryBannersPromotionalItems = 5;
        //    e.CompetitiveProductSigns = 5;

        //    Site lastSite = DB.Sites.OrderByDescending(r => r.ID).FirstOrDefault();
        //    if (lastSite != null)
        //    {
        //        e.Lat = lastSite.Lat.TrimDouble();
        //        e.Lng = lastSite.Lng.TrimDouble();
        //    }

        //    return e;
        //}



        //public void Delete(int ID)
        //{
        //    Site s = Get(ID);

        //    List<SitePhoto> l = s.SitePhotoes.ToList();

        //    foreach (var item in l)
        //    {
        //        DB.SitePhotoes.DeleteObject(item);
        //    }

        //    DB.Sites.DeleteObject(s);
        //    Save();
        //}

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