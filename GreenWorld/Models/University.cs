using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GreenWorld.Models
{
    public class University
    {
        public int Id { get; set; }
        
        [Required]
        public string Name { get; set; }

        [AllowHtml]
        [Display(Name = "Description")]
        public string Description { get; set; }

        [Display(Name = "Display Order")]
        public int? DisplayOrder { get; set; }

        public string RawDBImagePath { get; set; }

        [Display(Name = "Category Image")]
        public string ImagePath { get; set; }

        public DateTime? CreatedOnUtc { get; set; }

        public DateTime? UpdatedOnUtc { get; set; }

        public bool? Published { get; set; }
        
    }
}