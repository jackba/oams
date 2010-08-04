using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Linq.Expressions;

namespace OAMS.Models
{
    public class CodeMasterRepository
    {
        private OAMSEntities db = new OAMSEntities();

        public static IQueryable<CodeMaster> Get(Expression expression)
        {
            OAMSEntities db = new OAMSEntities();

            string type = PropertyName.GetMemberName(expression);
            return db.CodeMasters.Where(r => r.Type == type).OrderBy(r => r.Order);
        }

        public static IQueryable<CodeMaster> Get(string type)
        {
            OAMSEntities db = new OAMSEntities();

            return db.CodeMasters.Where(r => r.Type == type);
        }
    }

    public class CodeMasterType
    {
        public string Style = "Style";
        public string Material { get; set; }
        public string CBDViewed { get; set; }
        public string Grade { get; set; }
        public string RoadType { get; set; }
        public string TrafficSpeed { get; set; }
        public string Illumination { get; set; }
        public string DistanceFromRoadside { get; set; }
        public string AboveStreet { get; set; }
        public string DurationOfView { get; set; }
        public string AngleOfVision { get; set; }
        public string VisualClutter { get; set; }
    }
}