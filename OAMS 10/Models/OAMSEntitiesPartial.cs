using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Objects;

namespace OAMS.Models
{
    public partial class OAMSEntities
    {
        public override int SaveChanges(System.Data.Objects.SaveOptions options)
        {
            foreach (ObjectStateEntry entry in ObjectStateManager.GetObjectStateEntries(EntityState.Added | EntityState.Modified))
            {
                dynamic e = entry.Entity;

                try
                {
                    //e.CreatedDate = DateTime.Now;
                }
                catch (Exception)
                {
                }
                
                
                // Validate the objects in the Added and Modified state
                // if the validation fails throw an exeption.
            }
            return base.SaveChanges(options);
        }
    }
}