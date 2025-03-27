using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebXemPhim.Models;
using PagedList;
using PagedList.Mvc;
using WebXemPhim.Entity;
namespace WebXemPhim.Controllers
{
    public class GioiThieuController : Controller
    {
        //
        // GET: /GioiThieu/
        DataClasses1DataContext data = new DataClasses1DataContext();
        public ActionResult GioiThieuWebXemPhimSo1VietNam()
        {
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotXem).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimBo;
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            ViewData["QuocGia"] = quocgia;
            var tt = data.gioithieus.ToList();
            return View(tt);    
        }

    }
}
