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

        public bool Replace(int id, int replaceID)
        {
            Client e = Get(id);
            Client replaceClient = Get(replaceID);

            if (e == null || replaceClient == null)
            {
                return false;
            }
            else
            {
                IQueryable<Site> sL = DB.Sites.Where(r => r.CurrentClientID == replaceID);
                IQueryable<Contract> cL = DB.Contracts.Where(r => r.ClientID == replaceID);
                IQueryable<Campaign> caL = DB.Campaigns.Where(r => r.ClientID == replaceID);
                foreach (var item in sL)
                {
                    item.CurrentClientID = id;
                }
                foreach (var item in cL)
                {
                    item.ClientID = id;
                }
                foreach (var item in caL)
                {
                    item.ClientID = id;
                }

                Save();
                DB.Clients.DeleteObject(replaceClient);
                Save();

                return true;
            }
        }
    }
}