using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAMS.Models;
using System.ComponentModel.DataAnnotations;

namespace OAMS.Models
{

    public partial class Site
    {
        public string GeoFullName
        {
            get
            {
                return GeoRepository.Repo.GetFullname(Geo1, Geo2, Geo3);
            }
        }

        public string NewGeoFullName
        {
            get;
            set;
        }
    }
}