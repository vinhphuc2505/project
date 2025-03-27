using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity.Core.Metadata.Edm;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProjectQuanLyDoAnVat
{
    public partial class admin : Form
    {
        public admin()
        {
            InitializeComponent();
            formload();
            formloadNV();
        }
        private void formload()
        {
            dgv_DSDA.Columns.Add("id", "ID món");
            dgv_DSDA.Columns.Add("tenmon", "Tên món");
            dgv_DSDA.Columns.Add("gia", "ID món");//giá là kiẻu float
            hienthi_datagridview();

        }
        private void hienthi_datagridview() {
            Data_QLDAEntities DbContext = new Data_QLDAEntities();
            List<mon> dsmon = DbContext.mon.ToList();
            dgv_DSDA.Rows.Clear();
            foreach (mon m in dsmon) {
                int index=dgv_DSDA.Rows.Add();
                dgv_DSDA.Rows[index].Cells["id"].Value = m.id;
                dgv_DSDA.Rows[index].Cells["tenmon"].Value = m.tenmon;
                dgv_DSDA.Rows[index].Cells["gia"].Value = m.gia;
            }
            DbContext.Dispose();
        }

        private int tim_monan(string tenmon)
        {   
            Data_QLDAEntities DbContext = new Data_QLDAEntities();
            int id= DbContext.mon.Where(n=>n.tenmon==tenmon).Select(n=>n.id).FirstOrDefault();
            DbContext.Dispose();
            return id;
        }

        private void btn_Them_Click(object sender, EventArgs e)
        {
            if (txt_ID.Text.Trim() == "")
            {
                MessageBox.Show("ID món không được để trống", "Lỗi");
            }
            if (txt_ID.Text.Trim() == "")
            {
                MessageBox.Show("Tên món không được để trống", "Lỗi");
            }
            float gia = 0;
            if (txt_ID.Text.Trim() == "")
            {
                MessageBox.Show("Giá món không được để trống", "Lỗi");
            }
            if(float.TryParse(txt_Gia.Text, out gia)==false) {
                MessageBox.Show("Giá món không hợp lệ", "Lỗi");
            }
            if (gia < 0)
            {
                MessageBox.Show("Giá món khồn được bé hơn 0","Lỗi");
            }
            //đưa vào CSDL
            Data_QLDAEntities DbContext=new Data_QLDAEntities();
            mon mon = new mon()
            {
                id=int.Parse(txt_ID.Text),
                tenmon=txt_TenMon.Text,
                gia=gia
            };
            DbContext.mon.Add(mon);
            try
            {
                DbContext.SaveChanges();
            }
            catch {
                MessageBox.Show("Lưu dữ liệu không thành công", "Lỗi");
            }
            DbContext.Dispose();

            hienthi_datagridview();
        }


        private void btn_Xoa_Click(object sender, EventArgs e)
        {
            if (txt_ID.Text.Trim() == "")
            {
                MessageBox.Show("ID món không được để trống", "Lỗi");
            }
            int id = int.Parse(txt_ID.Text);
            Data_QLDAEntities DbContext= new Data_QLDAEntities();
            mon m=DbContext.mon.FirstOrDefault(mon => mon.id == id);
            if(m != null)
            {
                DbContext.mon.Remove(m);
                DbContext.SaveChanges();
                DbContext.Dispose();
                MessageBox.Show("Xóa sinh viên thành công");
                hienthi_datagridview();
                Order a=new Order();
                
            }
            else
            {
                MessageBox.Show("Không thể xóa sinh viên");
            }
         }

        private void btn_Sua_Click(object sender, EventArgs e)
        {

            if (txt_ID.Text.Trim() == "")
            {
                MessageBox.Show("ID món không được để trống", "Lỗi");
            }
            if (txt_ID.Text.Trim() == "")
            {
                MessageBox.Show("Tên món không được để trống", "Lỗi");
            }
            float gia = 0;
            if (txt_ID.Text.Trim() == "")
            {
                MessageBox.Show("Giá món không được để trống", "Lỗi");
            }
            if (float.TryParse(txt_Gia.Text, out gia) == false)
            {
                MessageBox.Show("Giá món không hợp lệ", "Lỗi");
            }
            if (gia < 0)
            {
                MessageBox.Show("Giá món khồn được bé hơn 0", "Lỗi");
            }
            int idmon=int.Parse(txt_ID.Text);
            string tenmon=txt_TenMon.Text;
            Data_QLDAEntities DbContext= new Data_QLDAEntities();
            mon mon=new mon();
            mon=DbContext.mon.FirstOrDefault(n=>n.id == idmon);
            if(mon == null)
            {
                MessageBox.Show("Không tìm thấy tên món");
            }
            else
            {
                //mon.id = idmon;
                mon.tenmon= tenmon;
                mon.gia = gia;
                DbContext.Entry(mon).State=System.Data.Entity.EntityState.Modified;
                try
                {
                    DbContext.SaveChanges();
                }
                catch (Exception)
                {
                    MessageBox.Show("Lưu dữ liệu không thành công", "Lỗi");
                }
                DbContext.Dispose();
                hienthi_datagridview();
            }
        }

        private void btn_Tim_Click(object sender, EventArgs e)
        {

        }

        

        private int tim_MaNhanVien(string maNV)
        {
            for(int i=0; i<dgv_QLNV.Rows.Count; i++)
            {
                if (dgv_QLNV.Rows[i].Cells[1].Value != null &&
                    dgv_QLNV.Rows[i].Cells[1].Value.ToString().Equals(maNV, StringComparison.OrdinalIgnoreCase))
                {
                    return i;
                }
            }
            return -1;
        }

        private void formloadNV()
        {
            dgv_QLNV.Columns.Add("tennguoidung", "Mã nhân viên");
            dgv_QLNV.Columns.Add("tengiaodien", "Tên nhân viên");
            dgv_QLNV.Columns.Add("type", "Tài khoản");
            dgv_QLNV.Columns.Add("matkhau", "Mật Khẩu");
            hienthi_datagridview();

        }

        private void btn_ThemNV_Click(object sender, EventArgs e)
        {
            if(txt_MaNhanVien.Text.Trim() == "")
            {
                MessageBox.Show("Mã nhân viên không được để trống!");
                return;
            }
            if (txt_MaNhanVien.Text == "")
            {
                MessageBox.Show("Tên nhân viên không được để trống!");
                return;
            }
            if (txt_TenNhanVien.Text == "")
            {
                MessageBox.Show("Tên giao diện không được để trống!");
                return;
            }
            if (txt_TaiKhoan.Text == "")
            {
                MessageBox.Show("Loại tài khoản không được để trống!");
                return;
            }
            Data_QLDAEntities DbContext = new Data_QLDAEntities();
            taikhoan t = new taikhoan()
            {
                
                tennguoidung = txt_MaNhanVien.Text,
                tengiaodien = txt_TenNhanVien.Text,
                type = int.Parse(txt_TaiKhoan.Text),
                matkhau = txt_MatKhau.Text
            };
            DbContext.taikhoan.Add(t);
            try
            {
                DbContext.SaveChanges();
            }
            catch (Exception)
            {
                MessageBox.Show("Lưu dữ liệu thành công");
            }
            DbContext.Dispose();
            hienthi_datagridview();
        }

        private void btn_XoaNV_Click(object sender, EventArgs e)
        {
            if(txt_MaNhanVien.Text.Trim() == "")
            {
                MessageBox.Show("Mã nhân viên không được bỏ trống!", "Lỗi");
            }
            string maNV = txt_MaNhanVien.Text;
            Data_QLDAEntities DbContext = new Data_QLDAEntities();
            taikhoan t = DbContext.taikhoan.FirstOrDefault(s => s.tennguoidung == maNV);
            if(t != null)
            {
                DbContext.taikhoan.Remove(t);
                DbContext.SaveChanges(); //Lưu dữ liệu
                DbContext.Dispose(); // Đóng CSDL
            }
        }

        private void btn_SuaNV_Click(object sender, EventArgs e)
        {
            if(txt_MaNhanVien.Text == "")
            {
                MessageBox.Show("Mã nhân viên không được bỏ trống!");
                return;
            }
            if(txt_TenNhanVien.Text == "")
            {
                MessageBox.Show("Tên nhân viên không được bỏ trống!");
                return;
            }
            if(txt_TaiKhoan.Text == "")
            {
                MessageBox.Show("Tài khoản không được bỏ trồng!");
                return;
            }
            if(txt_MatKhau.Text == "")
            {
                MessageBox.Show("Mật khẩu không được bỏ trồng!");
                return;
            }
            string maNV = txt_MaNhanVien.Text;
            string tenNV = txt_TenNhanVien.Text;
            int taiKhoan = int.Parse(txt_MatKhau.Text);
            string matKhau = txt_MatKhau.Text;
            Data_QLDAEntities DbContext = new Data_QLDAEntities();
            taikhoan t = DbContext.taikhoan.FirstOrDefault(s => s.tennguoidung == maNV);
            if(t != null )
            {
                MessageBox.Show("Không tìm thấy dữ liệu!");
            }
            else
            {
                t.tennguoidung = maNV;
                t.tengiaodien = tenNV;
                t.type = taiKhoan;
                t.matkhau = matKhau;
                DbContext.Entry(t).State = System.Data.Entity.EntityState.Modified;
            }
            try
            {
                DbContext.SaveChanges();
            }
            catch (Exception)
            {
                MessageBox.Show("Lưu dữ liệu thành công");
            }
            DbContext.Dispose();
            hienthi_datagridview();
        }
    }
}
