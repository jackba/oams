using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS.Models
{
    public class ContractorRepository
    {
        private OAMSEntities db = new OAMSEntities();

        public static IQueryable<Contractor> GetAll()
        {
            OAMSEntities db = new OAMSEntities();

            return db.Contractors;
        }

        public Contractor Get(int ID)
        {
            return db.Contractors.Where(r => r.ID == ID).SingleOrDefault();
        }

        public Contractor Add(Contractor e)
        {
            db.Contractors.AddObject(e);

            return e;
        }

        public void Delete(Contractor e)
        {
            db.Contractors.DeleteObject(e);
        }

        

        // Persistence 
        public void Save()
        {
            db.SaveChanges();
        }
    }
}