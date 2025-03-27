using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebXemPhim.Models
{
    public class XemSau
    {
        DataClasses1DataContext data = new DataClasses1DataContext();
        public int iID { set; get; }
        public string iTenPhim { set; get; }
        public string hinh { set; get; }
        public XemSau(int id)
        {
            iID = id;
            DSPhimBo phim = data.DSPhimBos.Single(n => n.ID == iID);
            iTenPhim = phim.TenPhim;
            hinh = phim.Img;
        }
    }
}