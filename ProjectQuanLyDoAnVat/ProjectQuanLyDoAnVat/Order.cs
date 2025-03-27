using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProjectQuanLyDoAnVat
{
    public partial class Order : Form
    {
        public Order()
        {
            InitializeComponent();
            formload();
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }
        private void formload()
        {
            dgv_DSDA.Columns.Add("id", "ID món");
            dgv_DSDA.Columns.Add("tenmon", "Tên món");
            dgv_DSDA.Columns.Add("gia", "ID món");//giá là kiẻu float
            hienthi_datagridview();

        }
        private void hienthi_datagridview()
        {
            Data_QLDAEntities DbContext = new Data_QLDAEntities();
            List<mon> dsmon = DbContext.mon.ToList();
            dgv_DSDA.Rows.Clear();
            foreach (mon m in dsmon)
            {
                int index = dgv_DSDA.Rows.Add();
                dgv_DSDA.Rows[index].Cells["id"].Value = m.id;
                dgv_DSDA.Rows[index].Cells["tenmon"].Value = m.tenmon;
                dgv_DSDA.Rows[index].Cells["gia"].Value = m.gia;
            }
            DbContext.Dispose();
        }

        private void adminToolStripMenuItem_Click(object sender, EventArgs e)
        {
            admin admin=new admin();
            admin.ShowDialog();
            this.Show();

        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
