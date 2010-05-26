﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAMS_10.Models;
using System.ComponentModel.DataAnnotations;

namespace OAMS_10.Models
{
    [MetadataType(typeof(ContractNotaion))]
    public partial class Contract
    {
        public List<ContractDetail> Details
        {
            get { return ContractDetails.ToList(); }
        }

    }
    public class ContractNotaion
    {
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public DateTime? EffectiveDate { get; set; }

        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public DateTime? TermDate { get; set; }
    }
}