using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS.Models
{
    public class ContractDetailRepository : BaseRepository<ContractDetailRepository>
    {
        public ContractDetail Get(int id)
        {
            return db.ContractDetails.SingleOrDefault(r => r.ID == id);
        }

        public IQueryable<ContractDetail> GetAll()
        {
            return db.ContractDetails;
        }

        public void Save()
        {
            db.SaveChanges();
        }
    }
}