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
    public class PaymentApiController : ApiController
    {
        private readonly IPaymentAccessRepository<Payment, int> _repository;

        public PaymentApiController(IPaymentAccessRepository<Payment, int> r)
        {
            _repository = r;
        }


        [Route("api/PaymentApi/")]
        // GET: api/PaymentApi
        public IEnumerable<Payment> GetPayments()
        {
            return _repository.Get();
        }


        [Route("api/PaymentApi/{id}")]
        // GET: api/PaymentApi/5
        [ResponseType(typeof(Payment))]
        public IHttpActionResult GetPayment(int id)
        {
            var item = _repository.Get(id);
            if (item == null)
            {
                return NotFound();
            }
            return Ok(item);
        }

        [Route("api/PaymentApi/{id}")]
        // PUT: api/PaymentApi/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutPayment(int id, Payment entity)
        {
            _repository.Put(id, entity);
            return StatusCode(HttpStatusCode.NoContent);
        }

        [Route("api/PaymentApi/")]
        // POST: api/PaymentApi
        [ResponseType(typeof(Payment))]
        public IHttpActionResult PostPayment(Payment entity)
        {
            _repository.Post(entity);
            return Ok(entity);
        }

        [Route("api/PaymentApi/{id}")]
        // DELETE: api/PaymentApi/5
        [ResponseType(typeof(Payment))]
        public IHttpActionResult DeletePayment(int id)
        {
            _repository.Delete(id);
            return StatusCode(HttpStatusCode.NoContent);
        }
    }
}
