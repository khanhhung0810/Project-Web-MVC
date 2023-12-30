using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using PagedList;
using Project_63130480.Models;

namespace Project_63130480.Controllers
{
    public class User_63130480Controller : Controller
    {
        // GET: User_63130480

        Project_63130480Entities1 objProject_63130480Entities = new Project_63130480Entities1();
        string VaiTro()
        {
            var maMax = objProject_63130480Entities.KhachHangs.ToList().Select(n => n.VaiTro).Max();         
            return maMax;
        }
        string LayMaKH()
        {
            var maMax = objProject_63130480Entities.KhachHangs.ToList().Select(n => n.MaKH).Max();
            int maKH = int.Parse(maMax.Substring(2)) + 1;
            string KH = String.Concat("00", maKH.ToString());
            return "KH" + KH.Substring(maKH.ToString().Length - 1);
        }
        
    public ActionResult Index()
        {
            

            var sanPham= objProject_63130480Entities.SanPhams;
            
            return View(sanPham);
        }

        public ActionResult MayLanh()
        {
            var a = objProject_63130480Entities.SanPhams.Where(b => b.MaLoaiSP == "ML").ToList();
            return View(a);
        }
        public ActionResult Tivi()
        {
            var a = objProject_63130480Entities.SanPhams.Where(b => b.MaLoaiSP == "TV").ToList();

            return View(a);
        }
        public ActionResult TuLanh()
        {
            var a = objProject_63130480Entities.SanPhams.Where(b => b.MaLoaiSP == "TL").ToList();

            return View(a);
          
        }
        
            
        [HttpGet]
        public ActionResult DangKy()
        {
            ViewBag.MaKH = LayMaKH();
            ViewBag.VaiTro = VaiTro();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DangKy(KhachHang _user)
        {
            if (ModelState.IsValid)
            {
                _user.MaKH = LayMaKH();
                _user.VaiTro = VaiTro();

                var check = objProject_63130480Entities.KhachHangs.FirstOrDefault(s => s.Email == _user.Email);
                if (check == null)
                {
                    _user.MatKhau = GetMD5(_user.MatKhau);
                    objProject_63130480Entities.Configuration.ValidateOnSaveEnabled = false;
                    objProject_63130480Entities.KhachHangs.Add(_user);
                    objProject_63130480Entities.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Email already exists";
                    return View();
                }

            }
            return View();
        }
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string matkhau )
        {
            
            var data1 = objProject_63130480Entities.QuanLies.Where(s => s.Email.Equals(email) && s.MatKhau.Equals(matkhau)).ToList();

            var data = objProject_63130480Entities.KhachHangs.Where(s => s.Email.Equals(email) && s.MatKhau.Equals(matkhau)).ToList();
            var quanLy = data1.FirstOrDefault();
            var user = data.FirstOrDefault();
            
            //Trace.WriteLine(user.VaiTro);
            if (user != null)
            {                             
                         
                if (user.VaiTro == "User")
                {                
                    Session["HoTen"] = user.HoTen;
                    Session["Email"] = user.Email;
                    Session["MaKH"] = user.MaKH;
                    return RedirectToAction("Index");
                }
            }

            Trace.WriteLine(quanLy.VaiTro);
            if (quanLy != null)
            {
                if (quanLy.VaiTro == "Admin")
                {
                    
                    Session["HoTen"] = quanLy.HoTen;
                    Session["Email"] = quanLy.Email;
                    Session["TaiKhoan"] = quanLy.TaiKhoan;
                    return RedirectToAction("Index", "Product_63130480", new { area = "Admin" });
                }
            }
            ViewBag.error = "Đăng nhập không thành công";
            
            return View();
        }
    }
}