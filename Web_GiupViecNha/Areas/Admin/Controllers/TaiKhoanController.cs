using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;
namespace Web_GiupViecNha.Areas.Admin.Controllers
{
    public class TaiKhoanController : Controller
    {
        DBGiupViecNhaDataContext db = new DBGiupViecNhaDataContext();
        //
        // GET: /Admin/TaiKhoan/
    
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection c)
        {

            NhanVien nv = db.NhanViens.FirstOrDefault(a => a.Email.Trim() == c["email"]);
            {
                if (nv.MatKhau.Trim() == c["password"])
                {
                    Session["nv"] = nv.MaNV;
                    Response.Write(@"<script language='javascript'>alert('Message: \n" + "Đăng nhập thành công !!" + " .');</script>");
                    return RedirectToAction("Index", "MainAdmin");
                }

            }
            return View();
        }

        public ActionResult DangXuat()
        {
            Session["nv"] = null;

            return RedirectToAction("DangNhap", "TaiKhoan");
        }
	}
}