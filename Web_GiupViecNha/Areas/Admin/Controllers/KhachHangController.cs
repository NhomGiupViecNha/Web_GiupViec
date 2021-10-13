using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;

namespace Web_GiupViecNha.Areas.Admin.Controllers
{
    public class KhachHangController : BaseController
    {
        DBGiupViecNhaDataContext db = new DBGiupViecNhaDataContext();
        //
        // GET: /Admin/DichVu/

        public ActionResult Index()
        {
            if (Session["UserAdmin"] == null)
            {
                return RedirectToAction("DangNhap", "TaiKhoan");

            }
            else
            {
                ViewBag.NhanVien = Session["UserAdmin"];
                List<KhachHang> dskh = db.KhachHangs.ToList();
                ViewData["dskh"] = dskh;
                return View();
            }


        }

        [HttpGet]
        public ActionResult ThongTinKH(string makh)
        {
            if (Session["UserAdmin"] == null)
            {
                return RedirectToAction("DangNhap", "TaiKhoan");

            }
            else
            {
                List<KhachHang> lstkh = db.KhachHangs.ToList();
                DSCTVYeuThich dsctv = db.DSCTVYeuThiches.FirstOrDefault(a => a.MaCTV == makh);
                ViewData["ctvyeuthich"] = dsctv;
                ViewBag.NhanVien = Session["UserAdmin"];

                return View();
            }




        }

        [HttpPost]
        public ActionResult ThongTinKH(FormCollection c, string makh)
        {

            KhachHang kh = db.KhachHangs.FirstOrDefault(a => a.MaKH == makh);
            kh.TenKH = c["txtTenKH"];
            kh.Email = c["txtEmail"];
            kh.DiaChi = c["txtDC"];
            kh.SDT = c["txtSDT"];
            kh.SoDiemThuong = int.Parse(c["txtDT"].ToString());
            kh.CapBacKH.TenCapBac = c["txtCBKH"];
            UpdateModel(kh);
            db.SubmitChanges();
            return RedirectToAction("Index");

        }

        public ActionResult XoaKH(string makh)
        {
            if (Session["UserAdmin"] == null)
            {
                return RedirectToAction("DangNhap", "TaiKhoan");

            }
            else
            {
                KhachHang kh = db.KhachHangs.FirstOrDefault(a => a.MaKH == makh);
                db.KhachHangs.DeleteOnSubmit(kh);
                db.SubmitChanges();
            }
            return RedirectToAction("Index");
        }
	}
}