using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS.Models
{
    public class ClientRepository : BaseRepository<ClientRepository>
    {
        public IQueryable<Client> GetAll()
        {
            return DB.Clients;
        }

        public Client Get(int ID)
        {
            return DB.Clients.Where(r => r.ID == ID).SingleOrDefault();
        }

        public Client Add(Client e)
        {
            DB.Clients.AddObject(e);
            Save();
            return e;
        }

        public Client Update(Client e)
        {
            Save();
            return e;
        }

        public void Delete(Client e)
        {
            DB.Clients.DeleteObject(e);
            Save();
        }
    }
}