using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS_10.Models
{
    public class FindSite
    {
        public int CampaignID { get; set; }
        public string Style { get; set; }
        public string Material { get; set; }
        public List<Site> Results { get; set; }
        public double Distance { get; set; }
        public double Lat { get; set; }
        public double Long { get; set; }

    }
}