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
    public class OrderPaymentStatusApiController : ApiController
    {
        private readonly IOrderPaymentStatusAccessRepository<OrderPaymentStatus, int> _repository;

        public OrderPaymentStatusApiController(IOrderPaymentStatusAccessRepository<OrderPaymentStatus, int> r)
        {
            _repository = r;
        }


        [Route("api/OrderPaymentStatusApi/")]
        public IEnumerable<OrderPaymentStatus> GetOrderPaymentMethods()
        {
            return _repository.Get();
        }

        [Route("api/OrderPaymentStatusApi/{id}")]
        [ResponseType(typeof(OrderPaymentStatus))]
        public IHttpActionResult GetOrderPaymentMethod(int id)
        {
            var item = _repository.Get(id);
            if (item == null)
            {
                return NotFound();
            }
            return Ok(item);
        }

        [Route("api/OrderPaymentStatusApi/{id}")]
        [ResponseType(typeof(void))]
        public IHttpActionResult PutOrderPaymentMethod(int id, OrderPaymentStatus entity)
        {
            _repository.Put(id, entity);
            return StatusCode(HttpStatusCode.NoContent);
        }

        [Route("api/OrderPaymentStatusApi/")]
        [ResponseType(typeof(OrderPaymentStatus))]
        public IHttpActionResult PostOrderPaymentMethod(OrderPaymentStatus entity)
        {
            _repository.Post(entity);
            return Ok(entity);
        }

        [Route("api/OrderPaymentStatusApi/{id}")]
        [ResponseType(typeof(OrderPaymentStatus))]
        public IHttpActionResult DeleteOrderPaymentMethod(int id)
        {
            _repository.Delete(id);
            return StatusCode(HttpStatusCode.NoContent);
        }


        ////custom api 
        [Route("api/OrderPaymentStatusApi/GetAllOrderPaymentStatusSelectList/")]
        // GetAllBrandsSelectList: api/OrderPaymentStatusApi/GetAllOrderPaymentStatusSelectList
        public List<System.Web.Mvc.SelectListItem> GetAllOrderPaymentStatusSelectList()
        {
            return _repository.GetAllOrderPaymentStatusSelectList();
        }
    }
}
