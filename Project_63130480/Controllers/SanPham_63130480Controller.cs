using Project_63130480.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_63130480.Controllers
{
    public class SanPham_63130480Controller : Controller
    {
        Project_63130480Entities1 objProject_63130480Entities = new Project_63130480Entities1();
        // GET: SanPham_63130480
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Detail()
        {
            return View();
        }
        public ActionResult MayLanhDetail()
        {
            return View();
        }
        
        public ActionResult TiviDetail()
        {
            return View();
        }
        public ActionResult TuLanhDetail()
        {
            return View();
        }

    }
}