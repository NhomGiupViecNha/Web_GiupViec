using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Web_GiupViecNha.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
       
        public BaseController()
        {

           
      

        }

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            if (Session["UserAdmin"] == null && Session["SESSION_GROUP"] == null)
            {
                filterContext.Result = new RedirectToRouteResult(new
                    RouteValueDictionary(new { controller = "TaiKhoan", action = "DangNhap", Area = "Admin" }));
            }
            base.OnActionExecuting(filterContext);
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
       public static string maHoaMK(string matkhau)
       {
           var bytes = Encoding.UTF8.GetBytes(matkhau);
           var hash = MD5.Create().ComputeHash(bytes);
           return Convert.ToBase64String(hash);

       }

	}
}