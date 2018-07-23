using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenWorld.DAL
{
    public interface IProductAccessRepository<TEntity, in TPrimaryKey> where TEntity : class
    {
        IEnumerable<TEntity> Get();
        TEntity Get(TPrimaryKey id);
        void Post(TEntity entity);
        void Put(TPrimaryKey id, TEntity entity);
        void Delete(TPrimaryKey id);

        //custome
        IEnumerable<TEntity> GetBooks();
        IEnumerable<TEntity> GetStationaries();
        //Homepage
        IEnumerable<TEntity> GetHomePageBooks();
        IEnumerable<TEntity> GetHomePageStationaries();
    }
}