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
                GeoRepository geoRepository = new GeoRepository();
                return geoRepository.GetFullname(Geo1, Geo2, Geo3);
            }
        }

        public string CategoryFullName
        {
            get
            {
                CategoryRepository catRepository = new CategoryRepository();
                return catRepository.GetFullname(Category1, Category2, Category3);
            }
        }

        public string NewGeoFullName
        {
            get;
            set;
        }

        public string NewCategoryFullName
        {
            get;
            set;
        }

        public string ContractorName
        {
            get
            {
                return Contractor != null ? Contractor.Name : "";
            }
        }

        public string CurrentClientName
        {
            get
            {
                return Client != null ? Client.Name : "";
            }
        }

        public int UpdateGeo(Guid? geoID1, Guid? geoID2, Guid? geoID3)
        {
            Geo1ID = geoID1;
            Geo2ID = geoID2;
            Geo3ID = geoID3;
            
            return 0;
        }

        public int UpdateCategory(Guid? catID1, Guid? catID2, Guid? catID3)
        {
            CategoryID1 = catID1;
            CategoryID2 = catID2;
            CategoryID3 = catID3;

            return 0;
        }
    }
}