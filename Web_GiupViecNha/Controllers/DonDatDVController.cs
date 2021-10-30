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
            return View();
        }
	}
}