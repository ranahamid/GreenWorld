using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Practices.Unity;
using GreenWorld.Controllers;
using GreenWorld.DAL;
using GreenWorld.Models;
using System;
using System.Data.Entity;
using System.Web.Http;
using System.Web.Mvc;
using Unity.WebApi;

namespace GreenWorld
{
    public static class UnityConfig
    {
    

        public static void RegisterComponents()
        {
			var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers

            // e.g. container.RegisterType<ITestService, TestService>();

            //Category
            container.RegisterType<ICategoryAccessRepository<Category, int>, CategoryDataAccessRepository>();
            //Log
            container.RegisterType<ILogAccessRepository<Log, int>, LogDataAccessRepository>();
            //Product
         //   container.RegisterType<IProductAccessRepository<Product, int>, ProductDataAccessRepository>();
            //Brand
         //   container.RegisterType<IBrandAccessRepository<Brand, int>, BrandDataAccessRepository>();
            //Brand
          //  container.RegisterType<IMerchantAccessRepository<Merchant, int>, MerchantDataAccessRepository>();
            //CampaignProduct
         //   container.RegisterType<ICampaignProductAccessRepository<CampaignProducts, int>, CampaignProductDataAccessRepository>();
            //Banner
            container.RegisterType<IBannerAccessRepository<Banner, int>, BannerDataAccessRepository>();
            //account
            container.RegisterType<IAccountAccessRepository<RegisterViewModel, int>, AccountDataAccessRepository>();
            //orders
         //   container.RegisterType<IOrderAccessRepository<Orders, int>, OrderDataAccessRepository>();
    
            //OrderPaymentMethod
            container.RegisterType<IOrderPaymentMethodAccessRepository<OrderPaymentMethod, int>, OrderPaymentMethodDataAccessRepository>();
            //OrderPaymentStatus
            container.RegisterType<IOrderPaymentStatusAccessRepository<OrderPaymentStatus, int>, OrderPaymentStatusDataAccessRepository>();
            //OrderShipping
          //  container.RegisterType<IOrderShippingAccessRepository<OrderShipping, int>, OrderShippingDataAccessRepository>();
            //OrderStatus
           // container.RegisterType<IOrderStatusAccessRepository<OrderStatus, int>, OrderStatusDataAccessRepository>();

            //BazarList
         //   container.RegisterType<IBazarListAccessRepository<BazarList, int>, BazarListDataAccessRepository>();
            //Teachers
            container.RegisterType<ITeacherAccessRepository<RegisterTeacher, int>, TeacherDataAccessRepository>();
            //Appointment
            //  container.RegisterType<IAppointmentAccessRepository<Appointment, int>, AppointmentDataAccessRepository>();
            //TeacherWorkingArea
            // container.RegisterType<ITeacherWorkingAreaAccessRepository<TeacherWorkingArea, int>, TeacherWorkingAreaDataAccessRepository>();

            //product
            container.RegisterType<IProductAccessRepository<Product, int>, ProductDataAccessRepository>();

            GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
        }
    }
}