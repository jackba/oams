using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OAMS.Models
{
    public class FindSite
    {
        public int CampaignID { get; set; }
        public string Style { get; set; }
        public string Material { get; set; }
        public double Distance { get; set; }
        public double? Lat { get; set; }
        public double? Long { get; set; }
        public DateTime? From { get; set; }
        public DateTime? To { get; set; }
    }
}