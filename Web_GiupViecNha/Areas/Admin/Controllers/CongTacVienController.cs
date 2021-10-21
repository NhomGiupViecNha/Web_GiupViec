using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;
namespace Web_GiupViecNha.Areas.Admin.Controllers
{
    public class CongTacVienController : BaseController
    {

        GiupViecNhaDBEntities db = new GiupViecNhaDBEntities();
        //
        // GET: /Admin/CongTacVien/
        public ActionResult Index()
        {
            if (Session["UserAdmin"] == null)
            {
                return Redirect("~/Admin/DangNhap");

            }
            else
            {

                ViewBag.NhanVien = Session["UserAdmin"];
                List<CongTacVien> dsctv = db.CongTacVien.ToList();


                ViewData["dsctv"] = dsctv;



                return View();

            }
        }

        //
        // GET: /Admin/CongTacVien/Details/5
    
        //
        // GET: /Admin/CongTacVien/Create
        public ActionResult DonDKCTV()
        {
            if (Session["UserAdmin"] == null)
            {
                return Redirect("~/Admin/DangNhap");

            }
            else
            {
                ViewBag.NhanVien = Session["UserAdmin"];
              List<DonDangKyCTV> dsdk = db.DonDangKyCTV.ToList();
            ViewBag.DSDonDK = dsdk;
            return View();

            }
          
        }

        //
        // POST: /Admin/CongTacVien/Create
    
        //
        // GET: /Admin/CongTacVien/Edit/5
        public ActionResult ThongTinChiTietDDK(string  maddk)
        {
            if (Session["UserAdmin"] == null)
            {
                return Redirect("~/Admin/DangNhap");

            }
            else
            {
                ViewBag.NhanVien = Session["UserAdmin"];
                DonDangKyCTV dk = db.DonDangKyCTV.FirstOrDefault(a => a.MaDon == maddk);
             
                return View(dk);

            }
        }

        //
        // POST: /Admin/CongTacVien/Edit/5
        [HttpPost]
        public ActionResult ThongTinChiTietDDK(FormCollection collection, DonDangKyCTV dondk)
        {
            if(!ModelState.IsValid)
            {
                SetAlert("Duyệt  đơn không thành công. Vui lòng nhập đầy đủ thông tin yêu cầu", "error");


                return ThongTinChiTietDDK(collection["txtMadon"]);
            }

            ViewBag.NhanVien = Session["UserAdmin"];
            List<DonDangKyCTV> dsdk = db.DonDangKyCTV.ToList();
            string madon = collection["txtMadon"];
            DonDangKyCTV ddk = db.DonDangKyCTV.FirstOrDefault(m => m.MaDon ==madon );
            ddk.DiemKiemTra = double.Parse(collection["DiemKiemTra"]);

        

            if (Request.Form["Accept"] != null)
            {
               


                CongTacVien ctv = new CongTacVien();
                ctv.MaCTV = sinhMaCTVTuDong();
                ctv.TenCTV = ddk.HoTen;
                ctv.NgaySinh = (DateTime)ddk.NgaySInh;
                ctv.SDT = ddk.SDT;
                ctv.TrinhDo = ddk.TrinhDoHocVan;
                ctv.KinhNghiem = ddk.KinhNghiem;
                ctv.Email = ddk.Email;
                ctv.DiaChi = ddk.DiaChi;
                ctv.MatKhau = maHoaMK("1");
                ctv.MaDonDKCTV = ddk.MaDon;
                ddk.TrangThaiDuyet = "Đã đậu";
                db.CongTacVien.Add(ctv);
                SetAlert("Duyệt cộng tác viên thành công", "success");
            }
            else if (Request.Form["Deny"] != null)
            {
                ddk.TrangThaiDuyet = "Đã rớt";
                SetAlert("Duyệt cộng tác viên thành công", "success");
            }


            UpdateModel(ddk);
         
            db.SaveChanges();
            ViewBag.DSDonDK = dsdk;
            return View("DonDKCTV");
              

         
        }

        public ActionResult Delete(string id)
        {
            if (Session["UserAdmin"] == null)
            {
                return Redirect("~/Admin/DangNhap");

            }
            else
            {
           
                try
                {
                    db.CongTacVien.Remove(db.CongTacVien.SingleOrDefault(m => m.MaCTV == id));
                    db.SaveChanges();
                    SetAlert("Xóa cộng tác viên thành công", "success");

                }

                catch
                {
                    SetAlert("Xóa cộng tác không viên thành công. Cộng tác viên có liên quan đến các bảng khác", "error");


                }
                return RedirectToAction("Index");
             

            }
         
          
        }

        //
        // POST: /Admin/CongTacVien/Delete/5


        public string sinhMaCTVTuDong()
        {
             string mactv="";
                int flag=db.CongTacVien.Count() +1;
           
            
                for (int i = 1; i <= db.CongTacVien.Count();i++ )
                {
                    if (flag > 9)
                    {
                        mactv = "CTV";

                    }
                    else mactv = "CTV0";
                    string flag2 = mactv + flag;
                    if (db.CongTacVien.Where(m => m.MaCTV.Trim() == flag2).Count() == 0)
                    {

                        mactv += flag;

                    }
                    else
                    {
                        flag++;
                        mactv += flag;
                    }

                }
                
                return mactv;

        }

        
    
    
    }
}
