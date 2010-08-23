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
            return db.Sites;
        }

        public Site Get(int id)
        {
            return db.Sites.Where(r => r.ID == id).SingleOrDefault();

        }

        public Site Add(Site e, int? contractID)
        {
            db.Sites.AddObject(e);

            if (contractID != null && contractID == 0)
            {
                new ContractDetail() { Site = e, ContractID = contractID };
            }

            GeoRepository.Repo.Set3LevelByFullname(e.GeoFullName, e.UpdateGeo);

            Save();

            return e;
        }

        public void UpdateGeo(Site e)
        {
            GeoRepository.Repo.Set3LevelByFullname(e.GeoFullName, e.UpdateGeo);
        }

        public void Save()
        {
            db.SaveChanges();
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

            Site lastSite = db.Sites.OrderByDescending(r => r.ID).FirstOrDefault();
            if (lastSite != null)
            {
                e.Lat = lastSite.Lat.TrimDouble();
                e.Lng = lastSite.Lng.TrimDouble();


            }

            return e;
        }

        public void AddPhoto(Site e, IEnumerable<HttpPostedFileBase> files)
        {
            if (files == null || files.Count() == 0) return;

            if (string.IsNullOrEmpty(e.AlbumUrl))
            {
                e.AlbumUrl = PicasaRepository.Repo.CreateAlbum(e.ID);
            }

            List<string> photoUriList = PicasaRepository.Repo.Upload(e.AlbumUrl, files);

            foreach (var item in photoUriList)
            {
                SitePhoto photo = new SitePhoto();
                photo.Url = item;
                e.SitePhotoes.Add(photo);
            }

            Save();
        }

        public void DeletePhoto(List<int> IDList)
        {
            if (IDList != null)
            {
                List<SitePhoto> l = db.SitePhotoes.Where(r => IDList.Contains(r.ID)).ToList();
                foreach (var item in l)
                {
                    db.DeleteObject(item);
                }

                Save();
            }
        }

    }
}