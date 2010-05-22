using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS_10.Models
{
    public class ContractDetailRepository : BaseRepository<ContractDetailRepository>
    {
        public ContractDetail Get(int id)
        {
            return db.ContractDetails.SingleOrDefault(r => r.ID == id);
        }

        public void Save()
        {
            db.SaveChanges();
        }
    }
}