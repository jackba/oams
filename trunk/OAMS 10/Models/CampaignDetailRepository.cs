using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS_10.Models
{
    public class CampaignDetailRepository : BaseRepository<CampaignDetailRepository>
    {
        public CampaignDetail Create(int campaignID,int contractDetailID)
        {
            CampaignDetail old = db.CampaignDetails.Where(r => r.CampaignID == campaignID && r.ContractDetailID == contractDetailID).SingleOrDefault();

            if (old != null) return null;

            CampaignDetail e = new CampaignDetail();
            e.CampaignID = campaignID;
            e.ContractDetailID = contractDetailID;

            db.CampaignDetails.AddObject(e);

            return e;
        }

        public void Save()
        {
            db.SaveChanges();
        }
    }
}