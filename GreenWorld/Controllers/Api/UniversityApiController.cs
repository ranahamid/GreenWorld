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
    public class UniversityApiController : ApiController
    {
        private readonly IUniversityAccessRepository<University, int> _repository;

        public UniversityApiController(IUniversityAccessRepository<University, int> r)
        {
            _repository = r;
        }


        [Route("api/UniversityApi/")]
        // GET: api/UniversityApi
        public IEnumerable<University> GetUniversitys()
        {
            return _repository.Get();
        }


        [Route("api/UniversityApi/{id}")]
        // GET: api/UniversityApi/5
        [ResponseType(typeof(University))]
        public IHttpActionResult GetUniversity(int id)
        {
            var item = _repository.Get(id);
            if (item == null)
            {
                return NotFound();
            }
            return Ok(item);
        }

        [Route("api/UniversityApi/{id}")]
        // PUT: api/UniversityApi/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutUniversity(int id, University entity)
        {
            _repository.Put(id, entity);
            return StatusCode(HttpStatusCode.NoContent);
        }

        [Route("api/UniversityApi/")]
        // POST: api/UniversityApi
        [ResponseType(typeof(University))]
        public IHttpActionResult PostUniversity(University entity)
        {
            _repository.Post(entity);
            return Ok(entity);
        }

        [Route("api/UniversityApi/{id}")]
        // DELETE: api/UniversityApi/5
        [ResponseType(typeof(University))]
        public IHttpActionResult DeleteUniversity(int id)
        {
            _repository.Delete(id);
            return StatusCode(HttpStatusCode.NoContent);
        }
    }
}
