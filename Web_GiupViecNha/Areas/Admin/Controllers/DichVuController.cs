using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;
namespace Web_GiupViecNha.Areas.Admin.Controllers
{
    public class DichVuController : BaseController
    {

        GiupViecNhaDBEntities db = new GiupViecNhaDBEntities();
        //
        // GET: /Admin/DichVu/

        public ActionResult Index()
        {
     

                ViewBag.NhanVien = Session["UserAdmin"];
                 List<DichVu> dsdv = db.DichVu.ToList();
                 ViewData["dsdv"] = dsdv;

              
                 List<LoaiDV> ldv = db.LoaiDV.ToList();
                 ViewBag.DSLoaiDV = ldv;
              

                 ViewBag.Madv = sinhMaDVTuDong();
                 return View();
            
            
           
              

             


        }

        [HttpPost]

        public ActionResult Index(FormCollection c, DichVu dv, HttpPostedFileBase fileUpload)
        {
            List<DichVu> dsdv = db.DichVu.ToList();
            DichVu dichvu = new DichVu();
          
            ViewData["dsdv"] = dsdv;
            List<LoaiDV> ldv = db.LoaiDV.ToList();
            ViewBag.DSLoaiDV = ldv;
            ViewBag.NhanVien = Session["UserAdmin"];
            var fileName = "";
            if (!ModelState.IsValid)
            {

                SetAlert("Thêm dịch vụ không thành công. Vui lòng kiểm tra lại thông tin", "error");
                dv.MaDichVu = c["txtMadv"];
                return View(dv);
            }
            if (fileUpload != null)
            {
                fileName = Path.GetFileName(fileUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/HinhAnh"), fileName);
                if (!System.IO.File.Exists(path))
                    fileUpload.SaveAs(path);
            }



            dichvu.MaDichVu = c["txtMadv"];
            dichvu.TenDichVu = c["TenDichVu"];
            dichvu.MoTa = c["Mota"];
            dichvu.KinhNghiemYeuCau = c["txtKNYC"];
            dichvu.DonViTinh = c["DonViTinh"];
            dichvu.GiaThanh = int.Parse(c["GiaThanh"].ToString());
            dichvu.HinhAnh = fileName;
            dichvu.LoaiDV = c["cbLoaiDV"];
            db.DichVu.Add(dichvu);
            db.SaveChanges();
            SetAlert("Thêm dịch vụ thành công", "success");
            return RedirectToAction("Index");

        }

        [HttpGet]
        public ActionResult ThongTinChiTietDV(string dichvu)
        {
         
                ViewBag.NhanVien = Session["UserAdmin"];
                List<DichVu> dsdv = db.DichVu.ToList();
                List<LoaiDV> ldv = db.LoaiDV.ToList();
                ViewBag.DSLoaiDV = ldv;
                ViewData["dsdv"] = dsdv;
                DichVu dv = db.DichVu.FirstOrDefault(a => a.MaDichVu == dichvu);
                
             
                ViewData["dichvu"] = dv;
                return View();

            
        
           
           
       
            




        }

        [HttpPost]
        public ActionResult ThongTinChiTietDV(FormCollection c, DichVu dv, HttpPostedFileBase fileUpload)
        {
            
            //if (c["txtTenDv"]==""||c["txtGia"]==""||c["txtDVT"]=="")
         
            if(!ModelState.IsValid)
            {
               
                SetAlert("Sửa dịch vụ không thành công. Vui lòng nhập đầy đủ thông tin yêu cầu", "error");

                return ThongTinChiTietDV(c["txtMadv"]);
            }
            var fileName = "";
            if (fileUpload != null)
            {
                fileName = Path.GetFileName(fileUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/HinhAnh"), fileName);

                if(!System.IO.File.Exists(path))
                fileUpload.SaveAs(path);
            }
           
            string madv=  c["txtMadv"];
            DichVu dichvu = db.DichVu.FirstOrDefault(a => a.MaDichVu ==madv);
            dichvu.TenDichVu = c["Tendv"];
            dichvu.MoTa = c["Mota"];
            dichvu.KinhNghiemYeuCau = c["txtKNYC"];
            dichvu.DonViTinh = c["Donvitinh"];
            dichvu.GiaThanh = int.Parse(c["Giathanh"].ToString());
          
            dichvu.LoaiDV = c["cbLoaiDV"];
            dichvu.HinhAnh = fileName;
            UpdateModel(dichvu);
            db.SaveChanges();
            SetAlert("Sửa dịch vụ thành công", "success");

            return RedirectToAction("Index");


        }
    

      
        public ActionResult XoaDV(string madv)
        {
            try {
                db.DichVu.Remove(db.DichVu.SingleOrDefault(a => a.MaDichVu == madv));
                db.SaveChanges();
                SetAlert("Xóa dịch vụ thành công", "success");
                return RedirectToAction("Index");
            }
            catch
            {
                SetAlert("Xóa dịch vụ không thành công thành công. Dịch vụ đang được dùng", "error");
                return RedirectToAction("Index");
            }
 
        }
          public string sinhMaDVTuDong()
        {
             string madv="";
                int flag=db.DichVu.Count() +1;

                for (int i = 1; i <= db.DichVu.Count(); i++)
                {
                    if (flag > 9)
                    {
                        madv = "DV";

                    }
                    else madv = "DV0";
                    string flag2 = madv + flag;
                    if (db.DichVu.Where(m => m.MaDichVu.Trim() == flag2).Count() == 0)
                    {

                        madv += flag;

                    }
                    else
                    {
                        flag++;
                        madv += flag;
                    }

                }
                return madv;

        }
     
	}
    
      
  
}