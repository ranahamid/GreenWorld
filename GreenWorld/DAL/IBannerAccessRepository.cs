﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GreenWorld.Models;

namespace GreenWorld.DAL
{
    public interface IBannerAccessRepository<TEntity, in TPrimaryKey> where TEntity : class
    {
        IEnumerable<TEntity> Get();
        TEntity Get(TPrimaryKey id);
        void Post(TEntity entity);
        void Put(TPrimaryKey id, TEntity entity);
        void Delete(TPrimaryKey id);
        //custom
        List<System.Web.Mvc.SelectListItem> GetAllBannersSelectList();
        BannerMobile GetHomePageBanner();
        IEnumerable<TEntity> GetAllBanner();
        
    }
}