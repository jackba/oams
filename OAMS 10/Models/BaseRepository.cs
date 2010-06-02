using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS.Models
{
    public class BaseRepository<T> where T : new()
    {
        public static T Repo
        {
            get
            {
                T t = new T();
                return t;
            }
        }

        protected OAMSEntities db = new OAMSEntities();
    }
}