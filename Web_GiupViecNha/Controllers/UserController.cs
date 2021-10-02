using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_GiupViecNha.Controllers
{
    public class UserController : Controller
    {
        //
        // GET: /User/
        public ActionResult DangKy()
        {
            return View();
        }

        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection fc)
        {
            var tendn = fc["taikhoandangnhap"];
            var matkhau = fc["matkhaudangnhap"];
            if (string.IsNullOrEmpty(tendn))
            {
                ViewData["Loi"] = "Phải nhập tên đăng nhập";
            }
            else if (string.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi"] = "Phải nhập mật khẩu";
            }

            else
            {
                return RedirectToAction("Index", "Home");

            }
            return View("DangNhap");
        }

        public ActionResult DangXuat()
        {
            Session["Taikhoan"] = null;
            return RedirectToAction("Index", "Home");
        }
	}
}