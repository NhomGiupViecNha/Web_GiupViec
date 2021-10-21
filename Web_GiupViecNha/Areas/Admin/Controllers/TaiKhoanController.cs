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
        GiupViecNhaDBEntities db = new GiupViecNhaDBEntities();
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
           string tendn =c["TenDN"];
           NhanVien nv = db.NhanVien.FirstOrDefault(a => a.TenDN.Trim() == tendn);
            if(nv!=null)
            {
                if (nv.MatKhau.Trim() == maHoaMK(c["matkhau"]))
                {
                    Session["UserAdmin"] = nv;
                    ViewBag.PhanQuyen = loadPhanQuyen(nv.MaNV);
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


        public List<PhanQuyenND> loadPhanQuyen(string manv)
        {
            NhanVien nv = db.NhanVien.FirstOrDefault(m=>m.MaNV==manv);
            ChucVu cv= nv.ChucVu.FirstOrDefault();
            List<PhanQuyenND> pq = db.PhanQuyenND.Where(m => m.MaVaiTro == cv.MaVaiTro).ToList();

            return pq;

        }
       

	}
}