using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_GiupViecNha.Areas.Admin.Models;
namespace Web_GiupViecNha.Controllers
{
    public class HomeController : Controller
    {
        GiupViecNhaDBEntities db = new GiupViecNhaDBEntities();
        public ActionResult Index()
        {

            List<DichVu> dsdv = db.DichVu.ToList();
            return View(dsdv);
        }

        public ActionResult XemChiTiet(string madv)
        {
            if(String.IsNullOrEmpty(madv))
            {
                return RedirectToAction("Index");

            }
            List<DichVu> dsdv = db.DichVu.ToList();
            ViewBag.dsdv = dsdv;
          
            DichVu dv = db.DichVu.FirstOrDefault(m => m.MaDichVu == madv);

            return View(dv);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}