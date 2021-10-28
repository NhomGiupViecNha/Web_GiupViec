using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;
using Web_GiupViecNha.Models;

namespace Web_GiupViecNha.Controllers
{
    public class UserController : Controller
    {
        GiupViecNhaDBEntities data = new GiupViecNhaDBEntities();
        XuLy xl = new XuLy();
        //
        // GET: /User/
        [HttpGet]
        public ActionResult DangKi()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKi(FormCollection c, DangKi dk)
        {
            if (ModelState.IsValid)
            {

             bool ktEmailTrung =   xl.CheckEmail(c["email"]);
                if(ktEmailTrung)
                {
                    SetAlert("Email đã được sử dụng", "danger");
                    return RedirectToAction("DangKi");
                }
                else
                {


                    var khachhang = new KhachHang();
                    khachhang.MaKH = xl.sinhMaKHTuDong();
                    khachhang.TenKH = c["tenKH"];
                    khachhang.Email = c["email"];
                    khachhang.SDT = c["sdt"];
                    khachhang.DiaChi = c["DiaChi"];
                    khachhang.MatKhau = maHoaMK(c["matkhau"]);
                    khachhang.SoDiemThuong = 0;
                    khachhang.MaCapBacKH = "CB01";
                    data.KhachHang.Add(khachhang);
                    data.SaveChanges();
                    return RedirectToAction("DangNhap");
                }

                        
                
              
            }
            else return View(dk);
            
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection fc, KhachHang kh)
        {
            if (!ModelState.IsValid)
            {
                return View(kh);

            }
            string tendn = fc["email"];
            KhachHang ac = data.KhachHang.FirstOrDefault(a => a.Email.Trim() == tendn);
            if (ac != null)
            {
                if (ac.MatKhau.Trim() == maHoaMK(fc["matkhau"]))
                {
                    Session["TaikhoanKH"] = ac;
                    return RedirectToAction("Index", "Home");

                }



            }

            SetAlert("Tài khoản hoặc mật khẩu không hợp lệ", "danger");
            return View();

        }

        public ActionResult DangXuat()
        {
            Session["TaikhoanKH"] = null;
            return RedirectToAction("Index", "Home");
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