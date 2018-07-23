using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using GreenWorld.Models;
using GreenWorld.DAL;

namespace GreenWorld.Controllers.Api
{
    public class ProductApiController : ApiController
    {
        private readonly IProductAccessRepository<Product, int> _repository;

        public ProductApiController(IProductAccessRepository<Product, int> r)
        {
            _repository = r;
        }
        
        [Route("api/ProductApi/")]
        public IEnumerable<Product> GetProducts()
        {
            return _repository.Get();
        }

        [Route("api/ProductApi/{id}")]
        [ResponseType(typeof(Product))]
        public IHttpActionResult GetProduct(int id)
        {
            var item = _repository.Get(id);
            if (item == null)
            {
                return NotFound();
            }
            return Ok(item);
        }

        [Route("api/ProductApi/{id}")]
        [ResponseType(typeof(void))]
        public IHttpActionResult PutProduct(int id, Product entity)
        {
            _repository.Put(id, entity);
            return StatusCode(HttpStatusCode.NoContent);
        }

        [Route("api/ProductApi/")]
        [ResponseType(typeof(Product))]
        public IHttpActionResult PostProduct(Product entity)
        {
            _repository.Post(entity);
            return Ok(entity);
        }

        [Route("api/ProductApi/{id}")]
        [ResponseType(typeof(Product))]
        public IHttpActionResult DeleteProduct(int id)
        {
            _repository.Delete(id);
            return StatusCode(HttpStatusCode.NoContent);
        }

        ////custom api 
        [Route("api/ProductApi/GetAllBooks/")]
        // GetAllBooks: api/ProductApi/GetAllBooks
        public IEnumerable<Product> GetAllProductSelectList()
        {
            return _repository.GetBooks();
        }

        [Route("api/ProductApi/GetStationaries/")]
        // GetAllBooks: api/ProductApi/GetAllBooks
        public IEnumerable<Product> GetStationaries()
        {
            return _repository.GetStationaries();
        }
        //Homepage
        [Route("api/ProductApi/GetHomePageBooks/")]
        // GetAllBooks: api/ProductApi/GetAllBooks
        public IEnumerable<Product> GetHomePageBooks()
        {
            return _repository.GetHomePageBooks();
        }

        [Route("api/ProductApi/GetHomePageStationaries/")]
        // GetAllBooks: api/ProductApi/GetAllBooks
        public IEnumerable<Product> GetHomePageStationaries()
        {
            return _repository.GetHomePageStationaries();
        }


    }
}
