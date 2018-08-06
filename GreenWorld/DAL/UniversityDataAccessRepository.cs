using Microsoft.Practices.Unity;
using GreenWorld.Controllers;
using GreenWorld.Filters;
using GreenWorld.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace GreenWorld.DAL
{
    [ExceptionHandlerAttribute]
    public class UniversityDataAccessRepository : BaseController, IUniversityAccessRepository<University, int>
    {
        public IEnumerable<University> Get()
        {
            List<University> entities = new List<University>();

            entities = Db.UniversityTbls.Select(x => new University()
            {
                Id = x.Id,
                Name = x.Name,        
                Description = x.Description,
                DisplayOrder = x.DisplayOrder,
                ImagePath = HttpUtility.UrlPathEncode(baseUrl + x.ImagePath),
                RawDBImagePath = x.ImagePath,          
                CreatedOnUtc = x.CreatedOnUtc,
                UpdatedOnUtc = x.UpdatedOnUtc,
                Published = x.Published,

            }).OrderBy(x => x.DisplayOrder).ToList();

            return entities;
        }



        public University Get(int id)
        {
            University entity = Db.UniversityTbls.Where(x => x.Id == id).Select(x => new University()
            {
                Id = x.Id,
                Name = x.Name,
             
                Description = x.Description,
                DisplayOrder = x.DisplayOrder,
                ImagePath = HttpUtility.UrlPathEncode(baseUrl + x.ImagePath),
                RawDBImagePath = x.ImagePath,
             
                CreatedOnUtc = x.CreatedOnUtc,
                UpdatedOnUtc = x.UpdatedOnUtc,
                Published = x.Published,

            }).FirstOrDefault();

            return entity;
        }



        public void Post(University entity)
        {
            var imgAddress = string.Empty;
            if (entity.ImagePath != null)
            {
                imgAddress = entity.ImagePath.TrimStart('/');
            }

            Db.UniversityTbls.InsertOnSubmit(new UniversityTbl
            {
            
                Name = entity.Name,
                Description = entity.Description,
                DisplayOrder = entity.DisplayOrder,
                ImagePath = imgAddress,
                CreatedOnUtc = DateTime.Now,
                UpdatedOnUtc = DateTime.Now,
                Published = entity.Published,

            });
            try
            {
                Db.SubmitChanges();
            }
            catch (Exception)
            {
                throw new Exception("Exception");
            }
        }

        public void Put(int id, University entity)
        {
            var isEntity = from x in Db.UniversityTbls
                           where x.Id == entity.Id
                           select x;

            var imgAddress = string.Empty;
            if (entity.RawDBImagePath != null)
            {
                imgAddress = entity.RawDBImagePath.TrimStart('/');
            }



            UniversityTbl entitySingle = isEntity.Single();


            entitySingle.Name = entity.Name;
            entitySingle.Description = entity.Description;
            entitySingle.DisplayOrder = entity.DisplayOrder;
            entitySingle.ImagePath = imgAddress;
            entitySingle.UpdatedOnUtc = DateTime.Now;
            entitySingle.Published = entity.Published;


            try
            {
                Db.SubmitChanges();
            }
            catch (Exception)
            {
                throw new Exception("Exception");
            }
        }



        public void Delete(int id)
        {

            var query = from x in Db.UniversityTbls
                        where x.Id == id
                        select x;

            if (query.Count() == 1)
            {
                UniversityTbl entity = query.FirstOrDefault();
                Db.UniversityTbls.DeleteOnSubmit(entity ?? throw new InvalidOperationException());
            }

            try
            {
                Db.SubmitChanges();
            }
            catch (Exception)
            {
                throw new Exception("Exception");
            }
        }

        //custom

        
        public IEnumerable<University> GetAllPublishedUniversities()
        {
            List<University> entities = new List<University>();

            entities = Db.UniversityTbls.Where(x=>x.Published==true).Select(x => new University()
            {
                Id = x.Id,
                Name = x.Name,
                Description = x.Description,
                DisplayOrder = x.DisplayOrder,
                ImagePath = HttpUtility.UrlPathEncode(baseUrl + x.ImagePath),
                RawDBImagePath = x.ImagePath,
                CreatedOnUtc = x.CreatedOnUtc,
                UpdatedOnUtc = x.UpdatedOnUtc,
                Published = x.Published,

            }).OrderBy(x => x.DisplayOrder).ToList();

            return entities;
        }



    }
}