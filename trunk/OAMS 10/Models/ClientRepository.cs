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
            return db.Clients;
        }
    }
}