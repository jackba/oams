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

        public void AddSite(int contractID, int siteID)
        {
            ContractDetail e = new ContractDetail();
            e.ContractID = contractID;
            e.SiteID = siteID;

            DB.ContractDetails.AddObject(e);

            Save();

            ContractDetailRepository contractDetailRepository = new ContractDetailRepository();
            contractDetailRepository.CopyTimeline(e.ID);
        }

        
    
    }
}