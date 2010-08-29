using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.GData.Photos;
using Google.GData.Client;
using System.IO;

namespace OAMS.Models
{
    public class PicasaRepository : BaseRepository<PicasaRepository>
    {
        public PicasaService InitPicasaService()
        {
            PicasaService service = new PicasaService("OAMS");
            service.setUserCredentials(OAMSSetting.GoogleUsername, OAMSSetting.GooglePassword);

            service.AsyncOperationCompleted += new AsyncOperationCompletedEventHandler(service_AsyncOperationCompleted);
            return service;
        }

        void service_AsyncOperationCompleted(object sender, AsyncOperationCompletedEventArgs e)
        {
            //e.
            //throw new NotImplementedException();
        }

        public void UploadPhoto(Site e, IEnumerable<HttpPostedFileBase> files)
        {
            if (e == null || files == null || files.Count() == 0) return;

            if (string.IsNullOrEmpty(e.AlbumUrl))
            {
                e.AlbumUrl = CreateAlbum(e.ID);
                e.BackupAlbumUrl = CreateAlbum(e.ID, true);
            }

            PicasaService service = InitPicasaService();

            Uri postUri = new Uri(PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername, e.AlbumUrl));

            foreach (var item in files)
            {
                if (item != null)
                {
                    MemoryStream mStream = new MemoryStream();
                    item.InputStream.CopyTo(mStream);

                    //PicasaEntry entry = (PicasaEntry)service.Insert(postUri, mStream, "image/jpeg", "");

                    //PicasaEntry entry = (PicasaEntry)service.InsertAsync(postUri, mStream, "image/jpeg", "");

                    //photoUriList.Add(entry.Media.Content.Url);
                }
            }

            //List<string> photoUriList = Upload(e.AlbumUrl, files);

            //foreach (var item in photoUriList)
            //{
            //    SitePhoto photo = new SitePhoto();
            //    photo.Url = item;
            //    e.SitePhotoes.Add(photo);
            //}

            ////Save();


            //if (files == null || files.Count() == 0) return null;

            //List<string> photoUriList = new List<string>();



            //return photoUriList;
        }

        public string CreateAlbum(int siteKey, bool isBackup = false)
        {
            PicasaService service = InitPicasaService();

            AlbumEntry newEntry = new AlbumEntry();

            newEntry.Title.Text = siteKey.ToString() + (isBackup ? "B" : "");
            newEntry.Summary.Text = newEntry.Title.Text;

            Uri feedUri = new Uri(PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername));

            PicasaEntry createdEntry = (PicasaEntry)service.Insert(feedUri, newEntry);

            //5507469898148065681
            return createdEntry.EditUri.Content;
            //return createdEntry.Id.AbsoluteUri;
        }

        public void GetAlbumInfo()
        {
            PicasaService service = InitPicasaService();





            //AlbumQuery query = new AlbumQuery(PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername));

            //PicasaFeed feed = service.Query(query);

            //foreach (PicasaEntry entry in feed.Entries)
            //{
            //    //Console.WriteLine(entry.Title.Text);
            //    AlbumAccessor ac = new AlbumAccessor(entry);
            //    //Console.WriteLine(ac.NumPhotos);

            //    if (ac.NumPhotos == 0)
            //    {
            //        //if (entry.Title.Text.EndsWith("B"))
            //        //{

            //        //}

            //        entry.Delete();
            //    }
            //}


            //foreach (var item in db.Sites)
            //{
            //    if (!string.IsNullOrEmpty(item.AlbumUrl)
            //        //&& string.IsNullOrEmpty(item.BackupAlbumUrl)
            //        //&& item.AlbumUrl.Length < 25
            //        )
            //    {
            //        PhotoQuery query = new PhotoQuery(PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername, item.AlbumUrl));

            //        //AlbumQuery query = new AlbumQuery(PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername, item.AlbumUrl));

            //        //string query = PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername, item.AlbumUrl);



            //        try
            //        {
            //            PicasaFeed feed = service.Query(query);

            //            //AlbumEntry entry = (AlbumEntry)service.Get(query);


            //            item.AlbumUrl = feed.Feed;


            //            ////Create backup album
            //            //AlbumEntry newEntry = new AlbumEntry();
            //            //newEntry.Title.Text = item.ID.ToString() + "B";
            //            //newEntry.Summary.Text = item.ID.ToString() + "B";

            //            //Uri feedUri = new Uri(PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername));

            //            //PicasaEntry createdEntry = (PicasaEntry)service.Insert(feedUri, newEntry);

            //            //item.BackupAlbumUrl = createdEntry.EditUri.Content;



            //            foreach (PicasaEntry entry in feed.Entries)
            //            {
            //                SitePhoto sp = new SitePhoto();
            //                sp.Url = entry.Media.Content.Url;
            //                sp.AtomUrl = entry.EditUri.Content;

            //                item.SitePhotoes.Add(sp);
            //            }
            //        }
            //        catch (Exception ex)
            //        {
            //            item.AlbumUrl = null;
            //        }

            //    }
            //}
            //db.SaveChanges();





            //foreach (var item in db.Sites)
            //{
            //    if (!string.IsNullOrEmpty(item.AlbumUrl)
            //        //&& string.IsNullOrEmpty(item.BackupAlbumUrl)
            //        //&& item.AlbumUrl.Length < 25
            //        )
            //    {
            //        //PhotoQuery query = new PhotoQuery(PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername, item.AlbumUrl));

            //        //AlbumQuery query = new AlbumQuery(PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername, item.AlbumUrl));

            //        string query = PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername, item.AlbumUrl);

            //        try
            //        {
            //            //PicasaFeed feed = service.Query(query);

            //            AlbumEntry entry = (AlbumEntry)service.Get(query);





            //            //item.AlbumUrl = entry.EditUri.Content;


            //            ////Create backup album
            //            //AlbumEntry newEntry = new AlbumEntry();
            //            //newEntry.Title.Text = item.ID.ToString() + "B";
            //            //newEntry.Summary.Text = item.ID.ToString() + "B";

            //            //Uri feedUri = new Uri(PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername));

            //            //PicasaEntry createdEntry = (PicasaEntry)service.Insert(feedUri, newEntry);

            //            //item.BackupAlbumUrl = createdEntry.EditUri.Content;



            //            //foreach (PicasaEntry entry in feed.Entries)
            //            //{
            //            //    SitePhoto sp = new SitePhoto();
            //            //    sp.Url = entry.Media.Content.Url;
            //            //    sp.AtomUrl = entry.EditUri.Content;

            //            //    item.SitePhotoes.Add(sp);
            //            //}
            //        }
            //        catch (Exception ex)
            //        {

            //            try
            //            {
            //                service.Delete(new Uri(query));

            //            }
            //            catch (Exception)
            //            {


            //            }
            //        }

            //    }
            //}
            //db.SaveChanges();

            //Site e = SiteRepository.Repo.Get(150);

            //string q = PicasaQuery.CreatePicasaUri(OAMSSetting.GoogleUsername, e.AlbumUrl);

            //PicasaEntry en = (PicasaEntry)service.Get(q);



        }
    }
}