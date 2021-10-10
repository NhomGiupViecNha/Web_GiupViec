using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;
namespace Web_GiupViecNha.Areas.Admin.Controllers
{
    public class DichVuController : Controller
    {
        //
        // GET: /Admin/DichVu/
        DBGiupViecNhaDataContext db = new DBGiupViecNhaDataContext();
        //
        // GET: /Admin/DichVu/

        public ActionResult Index()
        {
            if (Session["nv"] == null)
            {
                return RedirectToAction("DangNhap", "TaiKhoan");

            }
            else
            {
                NhanVien nv = db.NhanViens.FirstOrDefault(a => a.MaNV == Session["nv"].ToString());

                List<DichVu> dsdv = db.DichVus.ToList();
                ViewData["dsdv"] = dsdv;
                return View(nv);
            }


        }

        [HttpGet]
        public ActionResult ThongTinChiTietDV(string madv)
        {
            if (Session["nv"] == null)
            {
                return RedirectToAction("DangNhap", "TaiKhoan");

            }
            else
            {
                List<LoaiDV> ldv = db.LoaiDVs.ToList();
                ViewBag.DSLoaiDV = ldv;
                DichVu dv = db.DichVus.FirstOrDefault(a => a.MaDichVu == madv);
                ViewData["dichvu"] = dv;
                NhanVien nv = db.NhanViens.FirstOrDefault(a => a.MaNV == Session["nv"].ToString());

                return View(nv);
            }




        }

        [HttpPost]
        public ActionResult ThongTinChiTietDV(FormCollection c, string madv)
        {

            DichVu dichvu = db.DichVus.FirstOrDefault(a => a.MaDichVu == madv);
            dichvu.TenDichVu = c["txtTenDV"];
            dichvu.MoTa = c["txtMoTa"];
            dichvu.KinhNghiemYeuCau = c["txtKNYC"];
            dichvu.DonViTinh = c["txtDVT"];
            dichvu.GiaThanh = int.Parse(c["txtGia"].ToString());
            dichvu.HinhAnh = c["txtHinhAnh"];
            dichvu.LoaiDV = c["cbLoaiDV"];
            UpdateModel(dichvu);
            db.SubmitChanges();
            return RedirectToAction("Index");


        }
        [HttpGet]

        public ActionResult ThemDichVu()
        {
            if (Session["nv"] == null)
            {
                return RedirectToAction("DangNhap", "TaiKhoan");

            }
            else
            {
                NhanVien nv = db.NhanViens.FirstOrDefault(a => a.MaNV == Session["nv"].ToString());
                List<LoaiDV> ldv = db.LoaiDVs.ToList();
                ViewBag.DSLoaiDV = ldv;
                List<DichVu> dsdv = db.DichVus.ToList();
                ViewData["dsdv"] = dsdv;
                return View(nv);
            }


        }
        [HttpPost]

        public ActionResult ThemDichVu(FormCollection c)
        {
            return View();

        }


	}
}