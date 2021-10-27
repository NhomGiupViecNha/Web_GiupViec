using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;
namespace Web_GiupViecNha.Areas.Admin.Controllers
{
    public class MainAdminController : BaseController
    {
        GiupViecNhaDBEntities db = new GiupViecNhaDBEntities();
        //
        // GET: /Admin/MainAdmin/
        public ActionResult Index()
        {
          

                ViewBag.NhanVien = Session["UserAdmin"];

                return View();
            
         
            

        }

        //
        // GET: /Admin/MainAdmin/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Admin/MainAdmin/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Admin/MainAdmin/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Admin/MainAdmin/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Admin/MainAdmin/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Admin/MainAdmin/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Admin/MainAdmin/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [HttpGet]
        public ActionResult loadPhanQuyen(string manv,string machucnang)
        {
            db.Configuration.ProxyCreationEnabled = false;

         IQueryable<ChucVu> nv = db.ChucVu.Where(a => a.NhanVien.All(b => b.MaNV.Contains(manv)));
        
          //  var cv = nv.ChucVu.FirstOrDefault();
     PhanQuyenND pq = db.PhanQuyenND.Where(m => m.MaVaiTro == nv.FirstOrDefault().MaVaiTro).FirstOrDefault(m=>m.MaChucNang==machucnang);
          
            return Json(new { data = pq.CoQuyen }, JsonRequestBehavior.AllowGet);

        }
	}
}