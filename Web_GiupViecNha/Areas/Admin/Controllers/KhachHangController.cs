using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;

namespace Web_GiupViecNha.Areas.Admin.Controllers
{
    public class KhachHangController : Controller
    {
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

                List<KhachHang> dskh = db.KhachHangs.ToList();
                ViewData["dskh"] = dskh;
                return View(nv);
            }


        }

        [HttpGet]
        public ActionResult ThongTinKH(string makh)
        {
            if (Session["nv"] == null)
            {
                return RedirectToAction("DangNhap", "TaiKhoan");

            }
            else
            {
                List<KhachHang> lstkh = db.KhachHangs.ToList();
                DSCTVYeuThich dsctv = db.DSCTVYeuThiches.FirstOrDefault(a => a.MaCTV == makh);
                ViewData["ctvyeuthich"] = dsctv;
                NhanVien nv = db.NhanViens.FirstOrDefault(a => a.MaNV == Session["nv"].ToString());

                return View(nv);
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
            if (Session["nv"] == null)
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