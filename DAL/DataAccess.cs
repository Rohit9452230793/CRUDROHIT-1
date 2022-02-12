using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using AspNetMVCRouting_Prakhar.Models;
using System.Data.SqlClient;

namespace AspNetMVCRouting_Prakhar.DAL
{
    public class DataAccess : DbContext
    {
        public IEnumerable<Students> AddStudents (int procid,Students Model)
        {
            var param = new SqlParameter[]
            {
                new SqlParameter{ParameterName = "@StudentId",Value=Model.StudentId==null?0:Model.StudentId},
                new SqlParameter{ParameterName = "@Name",Value=Model.Name??string.Empty},
                new SqlParameter{ParameterName = "@Class",Value=Model.Class??string.Empty},
                new SqlParameter{ParameterName = "@MobileNo",Value=Model.MobileNo??string.Empty},
                 new SqlParameter{ParameterName = "@ProcId",Value=procid},
            };
            var sqlquery = @"Sp_AddStudents @StudentId,@Name,@Class,@MobileNo,@ProcId";
            return this.Database.SqlQuery<Students>(sqlquery, param);
        }

        public IEnumerable<Students> AddStudentswithCity(int procid, Students Model)
        {
            var param = new SqlParameter[]
            {
                new SqlParameter{ParameterName = "@StudentId",Value=Model.StudentId==null?0:Model.StudentId},
                new SqlParameter{ParameterName = "@Name",Value=Model.Name??string.Empty},
                new SqlParameter{ParameterName = "@Class",Value=Model.Class??string.Empty},
                new SqlParameter{ParameterName = "@MobileNo",Value=Model.MobileNo??string.Empty},
                new SqlParameter{ParameterName = "@CityId",Value=Model.CityId==null?0:Model.CityId},
                new SqlParameter{ParameterName = "@StateId",Value=Model.StateId==null?0:Model.StateId},
                 new SqlParameter{ParameterName = "@ProcId",Value=procid},
            };
            var sqlquery = @"Sp_AddStudentsWithCity @StudentId,@Name,@Class,@MobileNo,@CityId,@StateId,@ProcId";
            return this.Database.SqlQuery<Students>(sqlquery, param);
        }
        public IEnumerable<Master> Proc_BindMaster(int procid)
            {
            var param = new SqlParameter[]
            {               
                 new SqlParameter{ParameterName = "@ProcId",Value=procid}
            };
            var sqlquery = @"Sp_Master @ProcId";
            return this.Database.SqlQuery<Master>(sqlquery, param);
        }
        public IEnumerable<Master> Proc_BindMasterById(int procid,int value)
        {
            var param = new SqlParameter[]
            {               
                 new SqlParameter{ParameterName = "@Id",Value=value},
                 new SqlParameter{ParameterName = "@ProcId",Value=procid}
            };
            var sqlquery = @"Sp_MasterById @ProcId,@Id";
            return this.Database.SqlQuery<Master>(sqlquery, param);
        }
    }
}