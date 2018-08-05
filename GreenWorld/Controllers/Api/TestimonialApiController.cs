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
    public class TestimonialApiController : ApiController
    {
        private readonly ITestimonialAccessRepository<Testimonial, int> _repository;

        public TestimonialApiController(ITestimonialAccessRepository<Testimonial, int> r)
        {
            _repository = r;
        }

        [Route("api/TestimonialApi/")]
        public IEnumerable<Testimonial> GetTestimonials()
        {
            return _repository.Get();
        }

        [Route("api/TestimonialApi/{id}")]
        [ResponseType(typeof(Testimonial))]
        public IHttpActionResult GetTestimonial(int id)
        {
            var item = _repository.Get(id);
            if (item == null)
            {
                return NotFound();
            }
            return Ok(item);
        }

        [Route("api/TestimonialApi/{id}")]
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTestimonial(int id, Testimonial entity)
        {
            _repository.Put(id, entity);
            return StatusCode(HttpStatusCode.NoContent);
        }

        [Route("api/TestimonialApi/")]
        [ResponseType(typeof(Testimonial))]
        public IHttpActionResult PostTestimonial(Testimonial entity)
        {
            _repository.Post(entity);
            return Ok(entity);
        }

        [Route("api/TestimonialApi/{id}")]
        [ResponseType(typeof(Testimonial))]
        public IHttpActionResult DeleteTestimonial(int id)
        {
            _repository.Delete(id);
            return StatusCode(HttpStatusCode.NoContent);
        }
        
    }
}
