using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AspNetMVCRouting_Prakhar.DAL;

namespace AspNetMVCRouting_Prakhar.Models
{
   
    public class Master
    {
        public int MasterId { get; set; }
        public string MasterName { get; set; }
        
    }
    public class MasterData
    {
        DataAccess db = new DataAccess();
        public SelectList LoadMaster(int procid)
        {
            return new SelectList(db.Proc_BindMaster(procid).ToList(), "MasterId", "MasterName");
        }
        public SelectList LoadMasterById(int procid, int id)
        {
            return new SelectList(db.Proc_BindMasterById(procid, id).ToList(), "MasterId", "MasterName");
        }
    }
}