using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Project_63130480.Models;

namespace Project_63130480.Controllers
{
    public class User_63130480Controller : Controller
    {
        // GET: User_63130480

        Project_63130480Entities1 objProject_63130480Entities = new Project_63130480Entities1();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult MayLanh()
        {
            var a = objProject_63130480Entities.SanPhams.Where(b => b.MaLoaiSP == "ML").ToList();
            return View(a);
        }
        public ActionResult TuLanh()
        {
            var a = objProject_63130480Entities.SanPhams.Where(b => b.MaLoaiSP == "TL").ToList();

            return View(a);
          
        }
        public ActionResult Tivi()
        {
            var a = objProject_63130480Entities.SanPhams.Where(b => b.MaLoaiSP == "TV").ToList();

            return View(a);
        }
    }
}