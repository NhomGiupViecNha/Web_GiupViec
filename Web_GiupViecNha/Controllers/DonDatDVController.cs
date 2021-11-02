using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;
namespace Web_GiupViecNha.Controllers
{
    public class DonDatDVController : BaseController{
        GiupViecNhaDBEntities db = new GiupViecNhaDBEntities();
        //
        // GET: /DonDatDV/
        public ActionResult Index(string madv)
        {
     
            KhachHang kh = (KhachHang)Session["TaikhoanKH"];
            DichVu dv = db.DichVu.FirstOrDefault(m => m.MaDichVu == madv);
            ViewBag.kh = kh;
            ViewBag.dv = dv;
            ViewBag.madd = sinhDonDatTuDong();
            return View();
        }

        public JsonResult layDSCTVTheoKinhNghiem(string  madv)
        {
            db.Configuration.ProxyCreationEnabled = false;
            DichVu dv = db.DichVu.Where(m => m.MaDichVu == madv).FirstOrDefault();
            List<CongTacVien> dsctv  = db.CongTacVien.Where(m=>m.KinhNghiem.Contains(dv.KinhNghiemYeuCau)).ToList();
            return Json(
        dsctv
        ,JsonRequestBehavior.AllowGet);
        }
        
        public JsonResult ThanhToan(DonDatDV dd)
        {
            db.Configuration.ProxyCreationEnabled = false;
            bool kqThanhToan=true;
            KhachHang kh = db.KhachHang.FirstOrDefault(m => m.MaKH == dd.MaKH);
            if(kh.SoDuTaiKhoan<dd.TongTien)
            {
                kqThanhToan = false;
                return Json(kqThanhToan, JsonRequestBehavior.AllowGet);
            }
            CapBacKH cb =  db.CapBacKH.FirstOrDefault(c=>c.MaCapBac==kh.MaCapBacKH);
            kh.SoDiemThuong= Convert.ToInt32((dd.TongTien/10000) * cb.HeSoNhan);
            kh.SoDuTaiKhoan -= dd.TongTien;
            UpdateModel(kh);
            db.DonDatDV.Add(dd);
            db.SaveChanges();


            return Json(kqThanhToan, JsonRequestBehavior.AllowGet);



        }

        public JsonResult SuDungKM(string makm)
        {
            db.Configuration.ProxyCreationEnabled = false;
            KhachHang_UuDai kmkh = db.KhachHang_UuDai.FirstOrDefault(m => m.MaUuDai == makm);
            if (kmkh.SoLuong > 0)
            {
                PhieuUuDai km = db.PhieuUuDai.FirstOrDefault(m => m.MaUuDai == kmkh.MaUuDai);
                
                return Json(new { km }, JsonRequestBehavior.AllowGet);

            }


            else  return Json(null, JsonRequestBehavior.AllowGet);
        }

        public string sinhDonDatTuDong()
        {
            string madd = "";
            int flag = db.DonDatDV.Count() + 1;

            for (int i = 0; i <= db.DonDatDV.Count(); i++)
            {
                if (flag > 9)
                {
                    madd = "DD";

                }
                else madd = "DD0";
                string flag2 = madd + flag;
                if (db.DonDatDV.Where(m => m.MaDonDat.Trim() == flag2).Count() == 0)
                {

                    madd += flag;

                }
                else
                {
                    flag++;
                    madd += flag;
                }

            }
            return madd;

        }
	}
}