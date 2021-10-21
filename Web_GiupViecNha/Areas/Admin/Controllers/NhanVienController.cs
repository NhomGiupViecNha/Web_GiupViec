using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;
namespace Web_GiupViecNha.Areas.Admin.Controllers
{
    public class NhanVienController : BaseController
    {
        GiupViecNhaDBEntities db = new GiupViecNhaDBEntities();
        //
        // GET: /Admin/NhanVien/
        public ActionResult Index()
        {
            return View();
        }
       
        public ActionResult ThemNguoiDungNhomNguoiDung()
        {

            ViewBag.NhanVien = Session["UserAdmin"];
            List<NhanVien> dsnv = db.NhanVien.ToList();
            List<ChucVu> dsvt = db.ChucVu.ToList();
            ViewBag.DSVaiTro = dsvt;
            ViewBag.DSNhanVien = dsnv;
       

            return View();

           
            
           

           
        }
        [HttpPost]
        public ActionResult ThemNguoiDungNhomNguoiDung(string manv, string manhom)
        {






            NhanVien nv = db.NhanVien.FirstOrDefault(m => m.MaNV ==manv);
            ChucVu cv = nv.ChucVu.FirstOrDefault();
          
            if(nv!=null)
            {
                nv.ChucVu.Remove(cv);
              cv = db.ChucVu.FirstOrDefault(m => m.MaVaiTro == manhom);
         
            
               cv.NhanVien.Add(nv);
             
                db.SaveChanges();
                return Json("success");

            }


            return Json("error");


              
        }
        [HttpGet]
        public ActionResult CapNhatChucNangVaiTro(string machucvu)
        {
            db.Configuration.ProxyCreationEnabled = false;
            ViewBag.NhanVien = Session["UserAdmin"];
            List<ChucVu> dscv = db.ChucVu.ToList();
            ViewBag.DSChucVu = dscv;
            if(!String.IsNullOrEmpty(machucvu))
            {
      
             return Json(db.PhanQuyenND.Where(m => m.MaVaiTro == machucvu).ToList(), JsonRequestBehavior.AllowGet);
            }
            return View();
        }


        [HttpPost]
        public ActionResult CapNhatChucNangVaiTro(string macv,string macn,bool coquyen)
        {
            db.Configuration.ProxyCreationEnabled = false;
            ViewBag.NhanVien = Session["UserAdmin"];
            List<ChucVu> dscv = db.ChucVu.ToList();
            ViewBag.DSChucVu = dscv;
            if (!String.IsNullOrEmpty(macv) && !String.IsNullOrEmpty(macn))
            {
                PhanQuyenND pq = db.PhanQuyenND.Where(m => m.MaVaiTro == macv).FirstOrDefault(m => m.MaChucNang == macn);
                pq.CoQuyen = coquyen;
                UpdateModel(pq);
                db.SaveChanges();
                bool kq = true;

                return Json(kq, JsonRequestBehavior.AllowGet);
            }
            return View();
        }

        [HttpGet]
        public JsonResult loadDSManHinhTheoChucVu(string machucvu)
        {

            db.Configuration.ProxyCreationEnabled = false;
            if (!String.IsNullOrEmpty(machucvu))
            {
             
             List<PhanQuyenND> pq = db.PhanQuyenND.Where(m => m.MaVaiTro == machucvu).ToList();
                return Json(new {

                   data=pq

                }, JsonRequestBehavior.AllowGet);
            }
            return Json(null, JsonRequestBehavior.AllowGet);

        }


        
      

	}
}