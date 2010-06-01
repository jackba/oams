using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS_10.Models
{
    public class ClientRepository : BaseRepository<ClientRepository>
    {
        public IQueryable<Client> GetAll()
        {
            return db.Clients;
        }
    }
}