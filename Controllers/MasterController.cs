using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AspNetMVCRouting_Prakhar.DAL;

namespace AspNetMVCRouting_Prakhar.Controllers
{
    public class MasterController : Controller
    {
        // GET: Master
        DataAccess DB = new DataAccess();
      
        #region Single Value Master
        public JsonResult getToMasterSingle(int Procid)
        {
            return Json(DB.Proc_BindMaster(Procid), JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region Two Value Master
        public JsonResult getToMaster(int Procid, int id)
        {
            var data = DB.Proc_BindMasterById(Procid, id);
            return Json(data, JsonRequestBehavior.AllowGet);
            //return Json(DB.Proc_BindMasterById(Procid, id), JsonRequestBehavior.AllowGet);
        }
        #endregion
    }
}