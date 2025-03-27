namespace ProjectQuanLyDoAnVat
{
    partial class Login
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.panel1 = new System.Windows.Forms.Panel();
            this.btn_Thoat = new System.Windows.Forms.Button();
            this.btn_DangNhap = new System.Windows.Forms.Button();
            this.panel3 = new System.Windows.Forms.Panel();
            this.txt_MatKhau = new System.Windows.Forms.TextBox();
            this.mk = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.txt_DangNhap = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btn_Thoat);
            this.panel1.Controls.Add(this.btn_DangNhap);
            this.panel1.Controls.Add(this.panel3);
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Location = new System.Drawing.Point(18, 19);
            this.panel1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(696, 225);
            this.panel1.TabIndex = 2;
            // 
            // btn_Thoat
            // 
            this.btn_Thoat.AccessibleName = "btnExit";
            this.btn_Thoat.AccessibleRole = System.Windows.Forms.AccessibleRole.None;
            this.btn_Thoat.DialogResult = System.Windows.Forms.DialogResult.Ignore;
            this.btn_Thoat.Location = new System.Drawing.Point(548, 165);
            this.btn_Thoat.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btn_Thoat.Name = "btn_Thoat";
            this.btn_Thoat.Size = new System.Drawing.Size(144, 49);
            this.btn_Thoat.TabIndex = 4;
            this.btn_Thoat.Text = "Thoát";
            this.btn_Thoat.UseVisualStyleBackColor = true;
            // 
            // btn_DangNhap
            // 
            this.btn_DangNhap.AccessibleName = "btnlogin";
            this.btn_DangNhap.DialogResult = System.Windows.Forms.DialogResult.Ignore;
            this.btn_DangNhap.Location = new System.Drawing.Point(399, 165);
            this.btn_DangNhap.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btn_DangNhap.Name = "btn_DangNhap";
            this.btn_DangNhap.Size = new System.Drawing.Size(144, 49);
            this.btn_DangNhap.TabIndex = 3;
            this.btn_DangNhap.Text = "Đăng nhập";
            this.btn_DangNhap.UseVisualStyleBackColor = true;
            this.btn_DangNhap.Click += new System.EventHandler(this.btn_DangNhap_Click);
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.txt_MatKhau);
            this.panel3.Controls.Add(this.mk);
            this.panel3.Location = new System.Drawing.Point(4, 85);
            this.panel3.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(687, 71);
            this.panel3.TabIndex = 1;
            // 
            // txt_MatKhau
            // 
            this.txt_MatKhau.AccessibleRole = System.Windows.Forms.AccessibleRole.Cursor;
            this.txt_MatKhau.Location = new System.Drawing.Point(212, 18);
            this.txt_MatKhau.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txt_MatKhau.Name = "txt_MatKhau";
            this.txt_MatKhau.Size = new System.Drawing.Size(450, 26);
            this.txt_MatKhau.TabIndex = 2;
            this.txt_MatKhau.UseSystemPasswordChar = true;
            // 
            // mk
            // 
            this.mk.AutoSize = true;
            this.mk.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.mk.Location = new System.Drawing.Point(4, 20);
            this.mk.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.mk.Name = "mk";
            this.mk.Size = new System.Drawing.Size(125, 29);
            this.mk.TabIndex = 0;
            this.mk.Text = "Mật khẩu:";
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.txt_DangNhap);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Location = new System.Drawing.Point(4, 5);
            this.panel2.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(687, 71);
            this.panel2.TabIndex = 0;
            // 
            // txt_DangNhap
            // 
            this.txt_DangNhap.AccessibleRole = System.Windows.Forms.AccessibleRole.Cursor;
            this.txt_DangNhap.Location = new System.Drawing.Point(212, 18);
            this.txt_DangNhap.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txt_DangNhap.Name = "txt_DangNhap";
            this.txt_DangNhap.Size = new System.Drawing.Size(450, 26);
            this.txt_DangNhap.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.Location = new System.Drawing.Point(4, 20);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(193, 29);
            this.label1.TabIndex = 0;
            this.label1.Text = "Tên đăng nhập:";
            // 
            // Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(732, 265);
            this.Controls.Add(this.panel1);
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "Login";
            this.Text = "Order";
            this.panel1.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btn_Thoat;
        private System.Windows.Forms.Button btn_DangNhap;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.TextBox txt_MatKhau;
        private System.Windows.Forms.Label mk;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.TextBox txt_DangNhap;
        private System.Windows.Forms.Label label1;
    }
}

