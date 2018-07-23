using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GreenWorld.Models
{
    public class Product
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public bool? IsBook { get; set; }

        public bool? IsStationary { get; set; }

        public string InstructionsImageUrl { get; set; }

        public string RawDbImagePath { get; set; }

        public bool? Published { get; set; }


        public bool? ShowOnHomePage { get; set; }
        
        public DateTime? CreatedOnUtc { get; set; }

        public DateTime? UpdatedOnUtc { get; set; }

    }

    public class ProductViewModel
    {
        public List<Product> Stationary { get; set; }

        public List<Product> Books { get; set; }

    }
   

}