using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS.Models
{
    public class SiteRepository : BaseRepository<SiteRepository>
    {
        public IQueryable<Site> GetAll()
        {
            return DB.Sites;
        }

        public Site Get(int id)
        {
            return DB.Sites.Where(r => r.ID == id).SingleOrDefault();

        }

        public Site Add(Site e, IEnumerable<HttpPostedFileBase> files)
        {
            if (e.FrontlitNumerOfLamps == 0)
            {
                e.FontLightArmsStraight = null;
                e.FontlitArmsPlacement = null;
                e.FontlitIlluminationDistribution = null;
                e.FrontlitSideLighting = null;
                e.FrontlitTopBottom = null;
            }
            else if (e.FrontlitNumerOfLamps > 0)
            {
                e.BacklitFormat = null;
                e.BacklitIlluninationSpread = null;
                e.BacklitLightBoxLeakage = null;
                e.BacklitLightingBlocks = null;
                e.BacklitVisualLegibility = null;
            }

            UpdateGeo(e);

            DB.Sites.AddObject(e);

            Save();

            PicasaRepository picasaRepository = new PicasaRepository();
            picasaRepository.DB = DB;

            picasaRepository.UploadPhoto(e, files);

            return e;
        }

        public void UpdateGeo(Site e)
        {
            GeoRepository geoRepository = new GeoRepository();
            geoRepository.Set3LevelByFullname(e.NewGeoFullName, e.UpdateGeo);
        }

        public Site InitWithDefaultValue()
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
            e.VisibilityHight = 5;
            e.VisibilityElectricityPolesOther = 5;
            e.VisibilityTrees = 5;

            e.DirectionalTrafficPublicTransport = 5;
            e.ShopSignsBillboards = 5;
            e.FlagsTemporaryBannersPromotionalItems = 5;
            e.CompetitiveProductSigns = 5;

            Site lastSite = DB.Sites.OrderByDescending(r => r.ID).FirstOrDefault();
            if (lastSite != null)
            {
                e.Lat = lastSite.Lat.TrimDouble();
                e.Lng = lastSite.Lng.TrimDouble();
            }

            return e;
        }

       

        public void Delete(int ID)
        {
            Site s = Get(ID);
            DB.Sites.DeleteObject(s);
            Save();
        }

        public void DeletePhoto(List<int> IDList)
        {
            if (IDList != null)
            {
                List<SitePhoto> l = DB.SitePhotoes.Where(r => IDList.Contains(r.ID)).ToList();
                foreach (var item in l)
                {
                    DB.DeleteObject(item);
                }

                Save();
            }
        }

        public void DeletePhoto(int SiteID)
        {
            List<SitePhoto> l = DB.SitePhotoes.Where(r => r.SiteID == SiteID).ToList();
            foreach (var item in l)
            {
                DB.DeleteObject(item);
            }

            Save();
        }
    }
}