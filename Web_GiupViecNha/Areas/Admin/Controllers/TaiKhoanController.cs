using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;
namespace Web_GiupViecNha.Areas.Admin.Controllers
{
    public class TaiKhoanController : Controller
    {
        GiupViecNhaDBEntities1 db = new GiupViecNhaDBEntities1();
        //
        // GET: /Admin/TaiKhoan/
    
        [HttpGet]
        public ActionResult DangNhap()
        {
         
         
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection c, NhanVien tk)
        {
            if(!ModelState.IsValid)
            {
                return View(tk);

            }
           string email =c["email"];
            NhanVien nv = db.NhanVien.FirstOrDefault(a => a.Email.Trim() == email);
            if(nv!=null)
            {
                if (nv.MatKhau.Trim() == maHoaMK(c["matkhau"]))
                {
                    Session["UserAdmin"] = nv;
                    return RedirectToAction("Index","MainAdmin");
                  
                }
              


            }
            
                SetAlert("Tài khoản hoặc mật khẩu không hợp lệ", "danger");
                return View();

            
          
        }



        public ActionResult DangXuat()
        {
            Session["nv"] = null;

            return RedirectToAction("DangNhap", "TaiKhoan");
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