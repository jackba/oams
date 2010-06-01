using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS_10.Models
{
    public class CampaignRepository : BaseRepository<CampaignRepository>
    {
        public IQueryable<Campaign> GetAll()
        {
            return db.Campaigns;
        }

        public Campaign Get(int id)
        {
            return db.Campaigns.Where(r => r.ID == id).SingleOrDefault();
        }

        public Campaign Add(Campaign e)
        {
            db.Campaigns.AddObject(e);
            return e;
        }

        

        public void Save()
        {
            db.SaveChanges();
        }
    }
}