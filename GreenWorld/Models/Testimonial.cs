using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace GreenWorld.Models
{
    public class Testimonial
    {
        public int Id { get; set; }

        public string RawDBImagePath { get; set; }

        [Display(Name = "Person Image")]
        public string ImagePath { get; set; }


        public string Description { get; set; }

        public string PersonName { get; set; }

        public string PersonTitle { get; set; }

        public DateTime? CreatedOnUtc { get; set; }

        public DateTime? UpdatedOnUtc { get; set; }

        [Display(Name = "Published")]
        public bool? Published { get; set; }

        [Display(Name = "Display Order")]
        public int? DisplayOrder { get; set; }
    }
}