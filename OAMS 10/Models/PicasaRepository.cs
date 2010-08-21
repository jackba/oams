using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.GData.Photos;

namespace OAMS.Models
{
    public class PicasaRepository : BaseRepository<PicasaRepository>
    {
        public PicasaService InitPicasaService()
        {
            PicasaService service = new PicasaService("OAMS");
            service.setUserCredentials(OAMSSetting.GoogleUsername, OAMSSetting.GooglePassword);
            return service;
        }

        public List<string> Upload(string albumID, IEnumerable<HttpPostedFileBase> files)
        {
            if (files == null || files.Count() == 0) return null;

            List<string> photoUriList = new List<string>();

            PicasaService service = InitPicasaService();

            Uri postUri = new Uri(PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername, albumID));

            foreach (var item in files)
            {
                if (item != null)
                {
                    PicasaEntry entry = (PicasaEntry)service.Insert(postUri, item.InputStream, "image/jpeg", "");
                    photoUriList.Add(entry.Media.Content.Url);
                }
            }

            return photoUriList;
        }

        public string CreateAlbum(int siteKey)
        {
            PicasaService service = InitPicasaService();

            AlbumEntry newEntry = new AlbumEntry();
            newEntry.Title.Text = siteKey.ToString();
            newEntry.Summary.Text = siteKey.ToString();

            //AlbumAccessor ac = new AlbumAccessor(newEntry);
            ////set to "private" for a private album
            ////ac.Access = "public";
            //ac.Access = "private";

            Uri feedUri = new Uri(PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername));

            PicasaEntry createdEntry = (PicasaEntry)service.Insert(feedUri, newEntry);

            //return createdEntry.

            //5507469898148065681
            return createdEntry.Id.AbsoluteUri.Split('/').Last();
            
        }
    }
}