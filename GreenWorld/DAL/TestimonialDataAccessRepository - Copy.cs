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
    public class TestimonialDataAccessRepository : BaseController, ITestimonialAccessRepository<Testimonial, int>
    {
        public IEnumerable<Testimonial> Get()
        {
            List<Testimonial> entities = new List<Testimonial>();

            entities = Db.TestimonialTbls.Select(x => new Testimonial()
            {
                Id = x.Id,
                DisplayOrder=x.DisplayOrder,
                Description = x.Description,
                CreatedOnUtc = x.CreatedOnUtc,
                UpdatedOnUtc=x.UpdatedOnUtc,
                ImagePath=x.ImagePath,
                PersonName=x.PersonName,
                PersonTitle=x.PersonTitle,
                Published=x.Published

            }).ToList();

            return entities;
        }

        public Testimonial Get(int id)
        {
            Testimonial entity = Db.TestimonialTbls.Where(x => x.Id == id).Select(x => new Testimonial()
            {
                Id = x.Id,
                DisplayOrder = x.DisplayOrder,
                Description = x.Description,
                CreatedOnUtc = x.CreatedOnUtc,
                UpdatedOnUtc = x.UpdatedOnUtc,
                ImagePath = x.ImagePath,
                PersonName = x.PersonName,
                PersonTitle = x.PersonTitle,
                Published = x.Published

            }).SingleOrDefault();

            if (entity == null)
            {
                return null;
            }

            return entity;
        }

        public void Post(Testimonial entity)
        {
            Db.TestimonialTbls.InsertOnSubmit(new TestimonialTbl
            {
                DisplayOrder = entity.DisplayOrder,
                Description = entity.Description,
                CreatedOnUtc = entity.CreatedOnUtc,
                UpdatedOnUtc = entity.UpdatedOnUtc,
                ImagePath = entity.ImagePath,
                PersonName = entity.PersonName,
                PersonTitle = entity.PersonTitle,
                Published = entity.Published
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

        public void Put(int id, Testimonial entity)
        {
            var isEntity = from x in Db.TestimonialTbls
                           where x.Id == entity.Id
                           select x;

            if (isEntity == null)
            {
                return;
            }

            if (isEntity != null)
            {
                TestimonialTbl entitySingle = isEntity.Single();

                entitySingle.DisplayOrder = entity.DisplayOrder;
                entitySingle.Description = entity.Description;
                entitySingle.CreatedOnUtc = entity.CreatedOnUtc;
                entitySingle.UpdatedOnUtc = entity.UpdatedOnUtc;
                entitySingle.ImagePath = entity.ImagePath;
                entitySingle.PersonName = entity.PersonName;
                entitySingle.PersonTitle = entity.PersonTitle;
                entitySingle.Published = entity.Published;
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

        public void Delete(int id)
        {
            var query = from x in Db.TestimonialTbls
                        where x.Id == id
                        select x;

            if (query != null && query.Count() == 1)
            {
                TestimonialTbl entity = query.SingleOrDefault();
                Db.TestimonialTbls.DeleteOnSubmit(entity);
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


      

    }
}