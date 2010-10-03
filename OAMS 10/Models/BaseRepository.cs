using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS.Models
{
    public class BaseRepository<T> where T : new()
    {
        //public static T Repo
        //{
        //    get
        //    {
        //        T t = new T();
        //        return t;
        //    }
        //}

        private OAMSEntities _db = new OAMSEntities();
        public OAMSEntities DB
        {
            get { return _db; }
            set { _db = value; }
        }

        public int Save()
        {
            return DB.SaveChanges();
        }

        public string Username
        {
            get { return HttpContext.Current.User.Identity.Name; }
        }
    }
}