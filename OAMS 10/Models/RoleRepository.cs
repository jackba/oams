﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace OAMS.Models
{
    public static class ProjectRoles
    {
        //now constants for the attribute values
        public const string Admin = "Admin";
        public const string SiteSupervisor = "SiteSupervisor";
        public const string SiteMonitoring = "SiteMonitoring";
        public const string Sale = "Sale";
        public const string Makerting = "Makerting";
        //and roles continue

        public static string[] All
        {
            get { return new string[] { Admin, SiteSupervisor, SiteMonitoring, Sale, Makerting }; }
        }
    }

    public class RoleRepository : BaseRepository<RoleRepository>
    {
        //public IEnumerable<aspnet_Roles> GetAll()
        //{
        //    return Roles.GetAllRoles().Select(r => new aspnet_Roles() { RoleName = r });
        //}

        public void InitRole()
        {
            foreach (var item in ProjectRoles.All)
            {
                if (!Roles.RoleExists(item))
                {
                    Roles.CreateRole(item);
                }
            }
        }

        public string GetRolesList(string username)
        {
            return string.Join(", ", Roles.GetRolesForUser(username));
        }

        public void SetRoles(string username, string[] roleList)
        {
            if (roleList == null)
            {
                roleList = new string[] { };
            }

            string[] existRoles = Roles.GetRolesForUser(username);

            string[] removeList = existRoles.Except(roleList).ToArray();
            if (removeList.Count() > 0)
                Roles.RemoveUserFromRoles(username, removeList);

            string[] addList = roleList.Except(existRoles).ToArray();
            if (addList.Count() > 0)
                Roles.AddUserToRoles(username, addList);
        }
    }
}