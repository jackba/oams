using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS.Models
{
    public class FindSite
    {
        public int CampaignID { get; set; }

        public string Geo1FullName { get; set; }
        public List<string> Geo2List { get; set; }
        
        public List<string> StyleList { get; set; }
        public string Material { get; set; }

        public string RoadType1 { get; set; }
        public string RoadType2 { get; set; }
        public string InstallationPosition1 { get; set; }
        public string InstallationPosition2 { get; set; }
        public string ViewingDistance { get; set; }
        public string VisibilityBuilding { get; set; }
        public string VisibilityTrees { get; set; }
        public string VisibilityBridgeWalkway { get; set; }
        public string VisibilityElectricityPolesOther { get; set; }
        public string ViewingSpeed { get; set; }
        public string AboveStreet { get; set; }
        public string DirectionalTrafficPublicTransport { get; set; }
        public string ShopSignsBillboards { get; set; }
        public string FlagsTemporaryBannersPromotionalItems { get; set; }
        public string CompetitiveProductSigns { get; set; }


        public double Distance { get; set; }
        public double? Lat { get; set; }
        public double? Long { get; set; }
        public DateTime? From { get; set; }
        public DateTime? To { get; set; }
    }
}

