using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS.Models
{
    public class ContractRepository : BaseRepository
    {
        public IQueryable<Contract> GetAll()
        {
            return DB.Contracts;
        }

        public Contract Get(int ID)
        {
            return DB.Contracts.Where(r => r.ID == ID).SingleOrDefault();
        }

        public Contract Add(Contract e)
        {
            DB.Contracts.AddObject(e);

            return e;
        }

        public void Delete(Contract e)
        {
            DB.Contracts.DeleteObject(e);
        }

        public void AddSite(int contractID, int siteDetailID)
        {
            var siteDetailRepo = new SiteDetailRepository() { DB = DB };
            var siteDetail = siteDetailRepo.Get(siteDetailID);

            ContractDetail e = new ContractDetail();
            e.ContractID = contractID;
            e.SiteID = siteDetail.SiteID;
            
            e.Format = siteDetail.Format;
            e.SiteDetailName = siteDetail.Name;

            DB.ContractDetails.AddObject(e);

            Save();

            ContractDetailRepository contractDetailRepository = new ContractDetailRepository();
            contractDetailRepository.CopyTimeline(e.ID);
        }

        public void OverwriteTimelineForDetail(int ID)
        {
            var r = Get(ID);
            if (r != null
                && r.ContractTimelines.Count > 0)
            {
                foreach (var item in r.ContractDetails)
                {
                    var detailList = item.ContractDetailTimelines.ToList();

                    foreach (var tl in detailList)
                    {
                        DB.DeleteObject(tl);                        
                    }

                    foreach (var tl in r.ContractTimelines)
                    {
                        ContractDetailTimeline contractDetailTimeline = new ContractDetailTimeline();
                        contractDetailTimeline.FromDate = tl.FromDate;
                        contractDetailTimeline.ToDate = tl.ToDate;
                        contractDetailTimeline.Order = tl.Order;

                        item.ContractDetailTimelines.Add(contractDetailTimeline);
                    }
                }
                DB.SaveChanges();
            }
        }
    }
}