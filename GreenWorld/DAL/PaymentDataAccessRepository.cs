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
                //NewspaperName = x.NewspaperName,
                //AdLocation = x.AdLocation,
                //Price = x.Price,
                //AdvertiserName = x.AdvertiserName,
                //AdvertiserAddress = x.AdvertiserAddress,
                //AdvertiserMobile = x.AdvertiserMobile,
                //AdvertiserEmail = x.AdvertiserEmail,
                //DateofPublication = x.DateofPublication,
                //ColumnSize = x.ColumnSize,
                //Inch = x.Inch,
                //TotalColumnInch = x.TotalColumnInch,
                //TotalPrice = x.TotalPrice,
                //Description = x.Description,
                
                //MainImagePath = HttpUtility.UrlPathEncode(baseUrl + x.MainImagePath),
                //RawDbImagePath = x.MainImagePath,
                CreatedOnUtc = x.CreatedOnUtc,
                UpdatedOnUtc = x.UpdatedOnUtc,
                Active = x.Active,

                //AdCategoryId        = x.AdCategoryId,
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

                //AdCategoryId        = x.AdCategoryId,
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
            //var imgAddress = string.Empty;
            //if (entity.MainImagePath != null)
            //{
            //    imgAddress = entity.MainImagePath.TrimStart('/');
            //}

            Db.PaymentTbls.InsertOnSubmit(new PaymentTbl
            {
                //NewspaperName = entity.NewspaperName,
                //AdLocation = entity.AdLocation,
                //Price = entity.Price,
                //AdvertiserName = entity.AdvertiserName,
                //AdvertiserAddress = entity.AdvertiserAddress,
                //AdvertiserMobile = entity.AdvertiserMobile,
                //AdvertiserEmail = entity.AdvertiserEmail,
                //DateofPublication = entity.DateofPublication,
                //ColumnSize = entity.ColumnSize,
                //Inch = entity.Inch,
                //TotalColumnInch = entity.TotalColumnInch,
                //TotalPrice = entity.TotalPrice,
                //Description = entity.Description,

                //MainImagePath = imgAddress,
          
                CreatedOnUtc = DateTime.Now,
                UpdatedOnUtc = DateTime.Now,
                Active = entity.Active,

                //AdCategoryId        = entity.AdCategoryId,

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


            //entitySingle.AdCategoryId        = entity.AdCategoryId;
            entitySingle.PaymentGuidId       = entity.PaymentGuidId;
            entitySingle.OrderId             = entity.OrderId;
            entitySingle.PaymentChannel      = entity.PaymentChannel;
            entitySingle.PaymentMobile       = entity.PaymentMobile;
            entitySingle.PaymentTrxId        = entity.PaymentTrxId;
            entitySingle.PaymentAmount       = entity.PaymentAmount;

            //newspapere table
            //var isEntity2 = from x in Db.NewspaperTbls
            //               where x.Id == entity.OrderId
            //               select x;
            //var imgAddress = string.Empty;
            //if (entity.RawDbImagePath != null)
            //{
            //    imgAddress = entity.RawDbImagePath.TrimStart('/');
            //}
            //var entitySingle2 = isEntity2.Single();

            //entitySingle2.NewspaperName           = entity.NewspaperName          ;
            //entitySingle2.AdLocation              = entity.AdLocation             ;
            //entitySingle2.PriceDescription        = entity.PriceDescription       ;
            //entitySingle2.AdvertiserName          = entity.AdvertiserName         ;
            //entitySingle2.AdvertiserAddress       = entity.AdvertiserAddress      ;
            //entitySingle2.AdvertiserMobile        = entity.AdvertiserMobile       ;
            //entitySingle2.AdvertiserEmail         = entity.AdvertiserEmail        ;
            //entitySingle2.DateofPublication       = entity.DateofPublication      ;
            //entitySingle2.ColumnSize              = entity.ColumnSize             ;
            //entitySingle2.Inch                    = entity.Inch                   ;
            //entitySingle2.TotalColumnInch         = entity.TotalColumnInch        ;
            //entitySingle2.TotalPrice              = entity.TotalPrice             ;
            //entitySingle2.Description             = entity.Description            ;
            //entitySingle2.AdCategoryId            = entity.AdCategoryId           ;
            //entitySingle2.MainImagePath           = imgAddress                    ;
            //entitySingle2.UpdatedOnUtc            = DateTime.Now;                 ;
            //entitySingle2.Active                  = entity.Active                 ;

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