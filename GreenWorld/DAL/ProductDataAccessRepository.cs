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
    public class ProductDataAccessRepository : BaseController, IProductAccessRepository<Product, int>
    {

        public IEnumerable<Product> Get()
        {
            var entities = Db.ProductTbls.Select(x => new Product()
            {
                Id = x.Id,
                Name = x.Name,
                InstructionsImageUrl = HttpUtility.UrlPathEncode(baseUrl + x.InstructionsImageUrl),
                IsBook = x.IsBook,
                ShowOnHomePage=x.ShowOnHomePage,
                IsStationary=x.IsStationary,
                Published=x.Published,
            }).ToList();

            return entities;
        }

        public Product Get(int id)
        {
            var entity = Db.ProductTbls.Where(x => x.Id == id).Select(x => new Product()
            {
                Id = x.Id,
                Name = x.Name,

                IsBook = x.IsBook,
                IsStationary = x.IsStationary,
                ShowOnHomePage = x.ShowOnHomePage,
                InstructionsImageUrl = HttpUtility.UrlPathEncode(baseUrl + x.InstructionsImageUrl),
                RawDbImagePath = x.InstructionsImageUrl,
                Published = x.Published,
            }).SingleOrDefault();

            return entity;
        }

        public void Post(Product entity)
        {
            var imgAddress = string.Empty;
            if (entity.InstructionsImageUrl != null)
            {
                imgAddress = entity.InstructionsImageUrl.TrimStart('/');
            }

            Db.ProductTbls.InsertOnSubmit(new ProductTbl
            {
                Name = entity.Name,

                IsBook = entity.IsBook,
                IsStationary = entity.IsStationary,
                ShowOnHomePage = entity.ShowOnHomePage,
                InstructionsImageUrl = imgAddress,
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

        public void Put(int id, Product entity)
        {
            var imgAddress = string.Empty;
            if (entity.RawDbImagePath != null)
            {
                imgAddress = entity.RawDbImagePath.TrimStart('/');
            }

            var isEntity = from x in Db.ProductTbls
                           where x.Id == entity.Id
                           select x;

            var entitySingle = isEntity.Single();

            entitySingle.Name = entity.Name;
       
            entitySingle.InstructionsImageUrl = imgAddress;
            entitySingle.Published = entity.Published;
            entitySingle.ShowOnHomePage = entity.ShowOnHomePage;
            entitySingle.IsBook = entity.IsBook;
            entitySingle.IsStationary = entity.IsStationary;
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
            var query = from x in Db.ProductTbls
                        where x.Id == id
                        select x;

            if (query.Count() == 1)
            {
                var entity = query.SingleOrDefault();
                Db.ProductTbls.DeleteOnSubmit(entity ?? throw new InvalidOperationException());
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
        public IEnumerable<Product> GetBooks()
        {
            var entities = Db.ProductTbls.Where(x=>x.IsBook==true).Select(x => new Product()
            {
                Id = x.Id,
                Name = x.Name,
                InstructionsImageUrl = HttpUtility.UrlPathEncode(baseUrl + x.InstructionsImageUrl),
                IsBook = x.IsBook,
                IsStationary = x.IsStationary,
                ShowOnHomePage = x.ShowOnHomePage,
                Published=x.Published
            }).ToList();

            return entities;
        }

        public IEnumerable<Product> GetStationaries()
        {
            var entities = Db.ProductTbls.Where(x => x.IsStationary == true).Select(x => new Product()
            {
                Id = x.Id,
                Name = x.Name,
                InstructionsImageUrl = HttpUtility.UrlPathEncode(baseUrl + x.InstructionsImageUrl),
                IsBook = x.IsBook,
                IsStationary = x.IsStationary,
                ShowOnHomePage = x.ShowOnHomePage,
                Published = x.Published
            }).ToList();

            return entities;
        }
        //homepage
        public IEnumerable<Product> GetHomePageBooks()
        {
            var entities = Db.ProductTbls.Where(x => x.IsBook == true && x.Published==true && x.ShowOnHomePage==true).Select(x => new Product()
            {
                Id = x.Id,
                Name = x.Name,
                InstructionsImageUrl = HttpUtility.UrlPathEncode(baseUrl + x.InstructionsImageUrl),
                IsBook = x.IsBook,
                IsStationary = x.IsStationary,
                ShowOnHomePage = x.ShowOnHomePage,
                Published = x.Published
            }).ToList();

            return entities;
        }

        public IEnumerable<Product> GetHomePageStationaries()
        {
            var entities = Db.ProductTbls.Where(x => x.IsStationary == true && x.Published == true && x.ShowOnHomePage == true).Select(x => new Product()
            {
                Id = x.Id,
                Name = x.Name,
                InstructionsImageUrl = HttpUtility.UrlPathEncode(baseUrl + x.InstructionsImageUrl),
                IsBook = x.IsBook,
                IsStationary = x.IsStationary,
                ShowOnHomePage = x.ShowOnHomePage,
                Published = x.Published
            }).ToList();

            return entities;
        }



    }
}