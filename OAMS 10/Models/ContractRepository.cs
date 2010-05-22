using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS_10.Models
{
    public class ContractRepository
    {
        private OAMSEntities db = new OAMSEntities();

        public IQueryable<Contract> GetAll()
        {
            return db.Contracts;
        }

        public Contract Get(int ID)
        {
            return db.Contracts.Where(r => r.ID == ID).SingleOrDefault();
        }

        public Contract Add(Contract e)
        {
            db.Contracts.AddObject(e);

            return e;
        }

        public void Delete(Contract e)
        {
            db.Contracts.DeleteObject(e);
        }



        // Persistence 
        public void Save()
        {
            db.SaveChanges();
        }
    }
}