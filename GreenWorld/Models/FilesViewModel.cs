using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using GreenWorld.Helpers;


namespace GreenWorld.Models
{
    public class FilesViewModel
    {
        public ViewDataUploadFilesResult[] Files { get; set; }
    }
}