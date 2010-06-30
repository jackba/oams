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
        public int UpdateGeo(Guid? geoID1, Guid? geoID2, Guid? geoID3)
        {
            Geo1ID = geoID1;
            Geo2ID = geoID2;
            Geo3ID = geoID3;

            return 0;
        }
    }
}