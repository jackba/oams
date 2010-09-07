using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS.Models
{
    public class ContractorRepository : BaseRepository<ContractorRepository>
    {
        public IQueryable<Contractor> GetAll()
        {
            return DB.Contractors;
        }

        public Contractor Get(int ID)
        {
            return DB.Contractors.Where(r => r.ID == ID).SingleOrDefault();
        }

        public Contractor Add(Contractor e)
        {
            DB.Contractors.AddObject(e);
            Save();
            return e;
        }

        public Contractor Update(Contractor e)
        {
            Save();
            return e;
        }

        public void Delete(Contractor e)
        {
            DB.Contractors.DeleteObject(e);
            Save();
        }

        
      
    }
}