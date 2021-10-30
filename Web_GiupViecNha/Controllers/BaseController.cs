using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Web_GiupViecNha.Controllers
{
    public class BaseController : Controller
    {

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            if (Session["TaiKhoanKH"] == null)
            {
                Session["ReturnURL"] = Request.UrlReferrer;
                filterContext.Result = new RedirectToRouteResult(new
                    RouteValueDictionary(new { controller = "User", action = "DangNhap"}));
            }
            base.OnActionExecuting(filterContext);
        }
        //
        // GET: /Base/
     
	}
}