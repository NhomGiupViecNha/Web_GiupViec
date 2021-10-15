using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;
namespace Web_GiupViecNha.Areas.Admin.Controllers
{
    public class DichVuController : BaseController
    {
     
        DBGiupViecNhaDataContext db = new DBGiupViecNhaDataContext();
        //
        // GET: /Admin/DichVu/

        public ActionResult Index()
        {
            if (Session["UserAdmin"] == null)
            {
                return Redirect("~/Admin/DangNhap");

            }
            else
            {

                ViewBag.NhanVien = Session["UserAdmin"];
                 List<DichVu> dsdv = db.DichVus.ToList();
                 ViewData["dsdv"] = dsdv;
                 return View();
            
            }
           
              

             


        }

        [HttpGet]
        public ActionResult ThongTinChiTietDV(string dichvu)
        {
            if (Session["UserAdmin"] == null)
            {
                return Redirect("~/Admin/DangNhap");

            }
            else
            {

                ViewBag.NhanVien = Session["UserAdmin"];
                List<DichVu> dsdv = db.DichVus.ToList();
                List<LoaiDV> ldv = db.LoaiDVs.ToList();
                ViewBag.DSLoaiDV = ldv;
                ViewData["dsdv"] = dsdv;
                DichVu dv = db.DichVus.FirstOrDefault(a => a.MaDichVu == dichvu);
                
             
                ViewData["dichvu"] = dv;
                return View();

            }
        
           
           
       
            




        }

        [HttpPost]
        public ActionResult ThongTinChiTietDV(FormCollection c, DichVuModels dvu)
        {
            
            //if (c["txtTenDv"]==""||c["txtGia"]==""||c["txtDVT"]=="")
         
            if(!ModelState.IsValid)
            {
               
                SetAlert("Sửa dịch vụ không thành công. Vui lòng nhập đầy đủ thông tin yêu cầu", "error");

                return ThongTinChiTietDV(c["txtMadv"]);
            }
            DichVu dichvu = db.DichVus.FirstOrDefault(a => a.MaDichVu == c["txtMadv"]);
            dichvu.TenDichVu = c["Tendv"];
            dichvu.MoTa = c["Mota"];
            dichvu.KinhNghiemYeuCau = c["txtKNYC"];
            dichvu.DonViTinh = c["Donvitinh"];
            dichvu.GiaThanh = int.Parse(c["Giathanh"].ToString());
            dichvu.HinhAnh = c["txtHinhAnh"];
            dichvu.LoaiDV = c["cbLoaiDV"];
           
            UpdateModel(dichvu);
            db.SubmitChanges();
            SetAlert("Sửa dịch vụ thành công", "success");

            return RedirectToAction("Index");


        }
        [HttpGet]

        public ActionResult ThemDichVu()
        {
           

            if (Session["UserAdmin"] == null)
            {
                return Redirect("~/Admin/DangNhap");

            }
            else
            {
                ViewBag.NhanVien = Session["UserAdmin"];
              
                List<DichVu> dsdv = db.DichVus.ToList();
                List<LoaiDV> ldv = db.LoaiDVs.ToList();
                ViewBag.DSLoaiDV = ldv;
                ViewData["dsdv"] = dsdv;
                string madv;
                int flag = dsdv.Count + 1;
                if (flag < 10)
                {
                    madv = "DV0" + flag;


                }
                else { madv = "DV" + flag; }
                ViewBag.Madv = madv;
                return View();

            }
         
             
            
            


        }
        [HttpPost]

        public ActionResult ThemDichVu(FormCollection c, DichVuModels dv)
        {
            List<DichVu> dsdv = db.DichVus.ToList();
            DichVu dichvu = new DichVu();
            List<LoaiDV> ldv = db.LoaiDVs.ToList();
            ViewBag.DSLoaiDV = ldv;
            ViewBag.NhanVien = Session["UserAdmin"];
           
            if (!ModelState.IsValid)
            {

                SetAlert("Thêm dịch vụ không thành công. Vui lòng kiểm tra lại thông tin", "error");
                dv.Madv = c["txtMadv"];
                return View(dv);
            }
            dichvu.MaDichVu = c["txtMadv"];
            dichvu.TenDichVu = c["Tendv"];
            dichvu.MoTa = c["Mota"];
            dichvu.KinhNghiemYeuCau = c["txtKNYC"];
            dichvu.DonViTinh = c["Donvitinh"];
            dichvu.GiaThanh = int.Parse(c["Giathanh"].ToString());
            dichvu.HinhAnh = c["txtHinhAnh"];
            dichvu.LoaiDV = c["cbLoaiDV"];
            db.DichVus.InsertOnSubmit(dichvu);
            db.SubmitChanges();
            SetAlert("Thêm dịch vụ thành công", "success");

            return RedirectToAction("Index");
         

        }

        public ActionResult XoaDV(string madv)
        {
             db.DichVus.DeleteOnSubmit( db.DichVus.SingleOrDefault(a => a.MaDichVu == madv));
             db.SubmitChanges();
             SetAlert("Xóa dịch vụ thành công", "success");
             return RedirectToAction("Index");
        }

     
	}

  
}