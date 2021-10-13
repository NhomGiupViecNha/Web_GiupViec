using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_GiupViecNha.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
       
        public BaseController()
        {

       

        }

        
        //
       public  void SetAlert(string message, string type)
        {

            TempData["AlertMessage"] = message;
            TempData["Type"] = type;
           if(type =="success")
           {
             
               TempData["AlertType"] = "alert-success";

           }

           else if (type == "warning")
           {

               TempData["AlertType"] = "alert-warning";

           }
           else if (type == "error")
           {
               TempData["AlertType"] = "alert-danger";

           }
        }
	}
}