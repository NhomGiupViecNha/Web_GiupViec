using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;
namespace Web_GiupViecNha.Controllers
{
    public class CongTacVienController : Controller
    {
        GiupViecNhaDBEntities db = new GiupViecNhaDBEntities();
        //
        // GET: /CongTacVien/
        [HttpGet]
        public ActionResult DangKyCTV()
        {

            return View();
        }
        [HttpGet]
        public ActionResult DangNhapCTV()
        {

            return View();
        }
        [HttpPost]
        public ActionResult DangNhapCTV(FormCollection c, CongTacVien tk)
        {
            if (!ModelState.IsValid)
            {
                return View(tk);

            }
            string mactv = c["MaCTV"];
            CongTacVien ct = db.CongTacVien.FirstOrDefault(a => a.MaCTV == mactv);
            if (ct != null)
            {
                if (ct.MatKhau.Trim() == c["matkhau"])
                {
                    Session["UserCongTacVien"] = ct;
                    return RedirectToAction("Index", "CongTacVien");
                }
            }

            SetAlert("Tài khoản hoặc mật khẩu không hợp lệ", "danger");
            return View();
        }
        public ActionResult DangXuat()
        {
            Session["UserCongTacVien"] = null;

            return RedirectToAction("DangNhapCTV", "TaiKhoanCTV");
        }

        public void SetAlert(string message, string type)
        {

            TempData["AlertMessage"] = message;
            if (type == "success")
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