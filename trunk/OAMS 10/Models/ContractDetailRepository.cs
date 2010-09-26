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
            return DB.ContractDetails.SingleOrDefault(r => r.ID == id);
        }

        public IQueryable<ContractDetail> GetAll()
        {
            return DB.ContractDetails;
        }

        public int? Delete(int id)
        {
            ContractDetail e = Get(id);

            int? contractID = e.ContractID;

            DB.DeleteObject(e);
            Save();

            return contractID;
        }

       
    }
}