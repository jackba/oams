using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace OAMS.Models
{
    public class AccountRepository : BaseRepository<AccountRepository>
    {
        public bool Exist(string username, string openId)
        {
            bool r = false;
            MembershipUser user = Membership.GetUser(username);

            if (user != null)
            {
                string _openId = AccountProfile.GetByUsername(username).OpenId;
                r = _openId == openId;
            }

            return r;
        }

        public void Create(string username, string openId)
        {
            MembershipUser user = Membership.CreateUser(username, "Oams123!@#");
            AccountProfile.GetByUsername(username).OpenId = openId;
        }

        public List<UserModel> GetAll()
        {
            RoleRepository roleRepo = new RoleRepository();
            List<UserModel> l = new List<UserModel>();
            foreach (MembershipUser item in Membership.GetAllUsers())
            {
                UserModel user = new UserModel();
                user.Username = item.UserName;
                user.RolesList = roleRepo.GetRolesList(item.UserName);

                l.Add(user);
            }

            return l;
        }
    }
}