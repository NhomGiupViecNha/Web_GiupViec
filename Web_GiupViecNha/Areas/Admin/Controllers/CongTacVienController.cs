using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;
namespace Web_GiupViecNha.Areas.Admin.Controllers
{
    public class CongTacVienController : Controller
    {

        DBGiupViecNhaDataContext db = new DBGiupViecNhaDataContext();
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
                List<CongTacVien> dsctv = db.CongTacViens.ToList();


                ViewData["dsctv"] = dsctv;



                return View();

            }
        }

        //
        // GET: /Admin/CongTacVien/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

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

              List<DonDangKyCTV> dsdk = db.DonDangKyCTVs.ToList();
            ViewBag.DSDonDK = dsdk;
            return View();

            }
          
        }

        //
        // POST: /Admin/CongTacVien/Create
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
        // GET: /Admin/CongTacVien/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Admin/CongTacVien/Edit/5
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
        // GET: /Admin/CongTacVien/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Admin/CongTacVien/Delete/5
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
    }
}
