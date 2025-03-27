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
    public class TinTucPhimController : Controller
    {
        //
        // GET: /TinTucPhim/
        DataClasses1DataContext data = new DataClasses1DataContext();

        //đoạn kết nối entity
        dbDoAnWebEntities db = new dbDoAnWebEntities();
        public ActionResult TinTuc()
        {
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotXem).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimBo;
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            ViewData["QuocGia"] = quocgia;
            var tt = data.tintucphims.ToList();
            return View(tt);          
        }
        public ActionResult ChiTietTinTuc(int id)
        {
            var DSPhimBo = data.DSPhimBos.OrderByDescending(x => x.LuotXem).Take(3).ToList();
            ViewData["TopPhim"] = DSPhimBo;
            var tl = data.TheLoais.ToList();
            var nam = data.Nams.ToList();
            var quocgia = data.QuocGias.ToList();
            ViewData["TheLoai"] = tl;
            ViewData["Nam"] = nam;
            ViewData["QuocGia"] = quocgia;
            var tt = data.tintucphims.SingleOrDefault(n=>n.idtintuc==id);
            return View(tt);
        }

    }
}
