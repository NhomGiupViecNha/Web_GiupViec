using System.Web.Mvc;

namespace Web_GiupViecNha.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
              "Admin_Login",
              "Admin/DangNhap",
              new { Controller="TaiKhoan", action = "DangNhap", id = UrlParameter.Optional }
          );

            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new {Controller="MainAdmin", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}