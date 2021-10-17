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
        GiupViecNhaDBEntities1 db = new GiupViecNhaDBEntities1();
        //
        // GET: /Admin/MainAdmin/
        public ActionResult Index()
        {
            if (Session["UserAdmin"] == null)
            {
                return Redirect("~/Admin/DangNhap");

            }
            else
            {

                ViewBag.NhanVien = Session["UserAdmin"];

                return View();
            }
         
            

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
	}
}