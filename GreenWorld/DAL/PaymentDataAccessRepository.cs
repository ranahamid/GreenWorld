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
    public class PaymentDataAccessRepository : BaseController, IPaymentAccessRepository<Payment, int>
    {
        public IEnumerable<Payment> Get()
        {
            var entities = Db.PaymentTbls.Select(x => new Payment()
            {
                Id = x.Id,
                CreatedOnUtc = x.CreatedOnUtc,
                UpdatedOnUtc = x.UpdatedOnUtc,
                Active = x.Active,
                PaymentGuidId       = x.PaymentGuidId,
                OrderId             = x.OrderId,
                PaymentChannel      = x.PaymentChannel,
                PaymentMobile       = x.PaymentMobile,
                PaymentTrxId        = x.PaymentTrxId,
                PaymentAmount       = x.PaymentAmount

            }).ToList();
            return entities;
        }

        public Payment Get(int id)
        {
            var entity = Db.PaymentTbls.Where(x => x.Id == id).Select(x => new Payment()
            {
                Id = x.Id,
                CreatedOnUtc = x.CreatedOnUtc,
                UpdatedOnUtc = x.UpdatedOnUtc,
                Active = x.Active,
                PaymentGuidId       = x.PaymentGuidId,
                OrderId             = x.OrderId,
                PaymentChannel      = x.PaymentChannel,

                PaymentChannelName = Db.OrderPaymentMethodTbls.Where(y => y.Id == id).Select(y => y.Name).FirstOrDefault(),

                PaymentMobile = x.PaymentMobile,
                PaymentTrxId        = x.PaymentTrxId,
                PaymentAmount       = x.PaymentAmount

            }).SingleOrDefault();
           
            return entity;
        }



        public string GetPaymentName(int id)
        {
            var paymentName = Db.OrderPaymentMethodTbls.Where(x => x.Id == id).Select(x => x.Name).FirstOrDefault();
            return paymentName;
        }

        public void Post(Payment entity)
        {

            Db.PaymentTbls.InsertOnSubmit(new PaymentTbl
            {
          
                CreatedOnUtc = DateTime.Now,
                UpdatedOnUtc = DateTime.Now,
                Active = entity.Active,

                PaymentGuidId       = entity.PaymentGuidId,
                OrderId             = entity.OrderId,
                PaymentChannel      = entity.PaymentChannel,
                PaymentMobile       = entity.PaymentMobile,
                PaymentTrxId        = entity.PaymentTrxId,
                PaymentAmount       = entity.PaymentAmount

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

        public void Put(int id, Payment entity)
        {
            var isEntity = from x in Db.PaymentTbls
                           where x.Id == entity.Id
                           select x;
        
            var entitySingle = isEntity.Single();

           
            entitySingle.UpdatedOnUtc = DateTime.Now; ;
            entitySingle.Active = entity.Active;

            entitySingle.PaymentGuidId       = entity.PaymentGuidId;
            entitySingle.OrderId             = entity.OrderId;
            entitySingle.PaymentChannel      = entity.PaymentChannel;
            entitySingle.PaymentMobile       = entity.PaymentMobile;
            entitySingle.PaymentTrxId        = entity.PaymentTrxId;
            entitySingle.PaymentAmount       = entity.PaymentAmount;

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
            var entity = (from x in Db.PaymentTbls
                          where x.Id == id
                          select x).SingleOrDefault();

            if (entity != null)
            {

                Db.PaymentTbls.DeleteOnSubmit(entity ?? throw new InvalidOperationException());
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