﻿using System.Web.Optimization;

namespace GreenWorld
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            //bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            //            "~/Content/jquery/dist/jquery.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
             "~/Content/jquery/jquery-ui-{version}.js"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Content/jquery/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      //"~/Content/bootstrap/js/bootstrap.js",
                      "~/Content/jquery/respond.js"));

            bundles.Add(new StyleBundle("~/Content/datetimepicker").Include(
                     "~/Content/bootstrap/css/bootstrap-datetimepicker.css",                 
                      "~/Content/jvectormap/jquery-jvectormap-1.2.2.css",
                      "~/Content/Ionicons/css/ionicons.css",
                      "~/Content/jvectormap/jquery-jvectormap.css"                  
                      ));

          
            //custom

            bundles.Add(new StyleBundle("~/Content/jQuery-File-Upload").Include(
                               "~/Content/jQuery.FileUpload/css/jquery.fileupload.css",
                              "~/Content/jQuery.FileUpload/css/jquery.fileupload-ui.css",
                              "~/Content/blueimp-gallery2/css/blueimp-gallery.css",
                                "~/Content/blueimp-gallery2/css/blueimp-gallery-video.css",
                                  "~/Content/blueimp-gallery2/css/blueimp-gallery-indicator.css"
                              ));

            bundles.Add(new ScriptBundle("~/bundles/jQuery-File-Upload").Include(
                     "~/Scripts/jQuery.FileUpload/angular.min.js",
                     //<!-- The Templates plugin is included to render the upload/download listings -->
                     "~/Scripts/jQuery.FileUpload/vendor/jquery.ui.widget.js",
                    //<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
                    "~/Scripts/jQuery.FileUpload/load-image.all.min.js",
                    //<!-- The Canvas to Blob plugin is included for image resizing functionality -->
                    "~/Scripts/jQuery.FileUpload/canvas-to-blob.min.js",
                    //"~/Scripts/file-upload/jquery.blueimp-gallery.min.js",
                    //<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
                    "~/Scripts/jQuery.FileUpload/jquery.iframe-transport.js",
                    //<!-- The basic File Upload plugin -->
                    "~/Scripts/jQuery.FileUpload/jquery.fileupload.js",
                    //<!-- The File Upload processing plugin -->
                    "~/Scripts/jQuery.FileUpload/jquery.fileupload-process.js",
                    //<!-- The File Upload image preview & resize plugin -->
                    "~/Scripts/jQuery.FileUpload/jquery.fileupload-image.js",
                    //<!-- The File Upload audio preview plugin -->
                    "~/Scripts/jQuery.FileUpload/jquery.fileupload-audio.js",
                    //<!-- The File Upload video preview plugin -->
                    "~/Scripts/jQuery.FileUpload/jquery.fileupload-video.js",
                    //<!-- The File Upload validation plugin -->
                    "~/Scripts/jQuery.FileUpload/jquery.fileupload-validate.js",
                    //!-- The File Upload user interface plugin -->
                    "~/Scripts/jQuery.FileUpload/jquery.fileupload-ui.js",
                    "~/Scripts/jQuery.FileUpload/jquery.fileupload-angular.js",
                    "~/Scripts/jQuery.FileUpload/app.js",
                    //Blueimp Gallery 2 
                    "~/Scripts/blueimp-gallery2/js/blueimp-gallery.js",
                    "~/Scripts/blueimp-gallery2/js/blueimp-gallery-video.js",
                    "~/Scripts/blueimp-gallery2/js/blueimp-gallery-indicator.js",
                    "~/Scripts/blueimp-gallery2/js/jquery.blueimp-gallery.js"
                    ));


            bundles.Add(new ScriptBundle("~/bundles/Blueimp-Gallerry2").Include(//Blueimp Gallery 2 
                    "~/Scripts/blueimp-gallery2/js/blueimp-gallery.js",
                    "~/Scripts/blueimp-gallery2/js/blueimp-gallery-video.js",
                    "~/Scripts/blueimp-gallery2/js/blueimp-gallery-indicator.js",
                    "~/Scripts/blueimp-gallery2/js/jquery.blueimp-gallery.js"));
                            }
    }
}
