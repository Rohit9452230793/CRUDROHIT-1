using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AspNetMVCRouting_Prakhar.Models;
using AspNetMVCRouting_Prakhar.DAL;


namespace AspNetMVCRouting_Prakhar.Controllers
{
    public class HomeController : Controller
    {
        DataAccess DB = new DataAccess();
        private int procid;
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About(string id)
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
       // [Route("DoubleRoute")]
        public ActionResult Contact(string id , string pid)
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult AddStudent()
        {
            Students Model = new Students();
            if (Request.QueryString["sid"] != null)
            {
                Model.StudentId = Convert.ToInt32(Request.QueryString["sid"].ToString());
                Model = DB.AddStudentswithCity(3, Model).ToList().FirstOrDefault();
                ViewBag.buttonName = "Update";
            }
            else
            {
                ViewBag.buttonName = "Submit";
            }

            var list1 = DB.AddStudentswithCity(4, Model).ToList();
            if (list1.Count > 0)
                ViewBag.list = list1;
            else
                ViewBag.list = null;

            return View(Model);
        }
        [HttpPost]
        public ActionResult AddStudent(Students Model, string command)
        {
            if (command == "Submit")
                procid = 1;
            else if (command == "Update")
                procid = 2;
            var list = DB.AddStudentswithCity(procid, Model).ToList();
            if (list.Count > 0)
            {
                if(list[0].msg == "success")
                {
                    TempData["msg"] = "1";
                }
                else if(list[0].msg == "exists")
                {
                    TempData["msg"] = "2";
                }
                else if (list[0].msg == "update")
                {
                    TempData["msg"] = "3";
                }
                else
                {
                    TempData["msg"] = "4";
                }
                ViewBag.list = list;
            }
            else
            {
                ViewBag.list = null;
            }
            return RedirectToAction("AddStudent", "Home");
        }
        public ActionResult EditStudent(int id)
        {
            Students Model = new Students();
            return RedirectToAction("AddStudent", new { sid = id });
        }

        public JsonResult StudentDelete(int sid)
        {
            Students Model = new Students();
            Model.StudentId = sid;
            var data = DB.AddStudentswithCity(5, Model).ToList().FirstOrDefault();
            return Json(true, JsonRequestBehavior.AllowGet);
        }
    }
}