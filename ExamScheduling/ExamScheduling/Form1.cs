using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Text;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExamScheduling
{
    public partial class Form1 : Form
    {
        ToMau tb = new ToMau();
        DataTable table = new DataTable();
        public Form1()
        {
            InitializeComponent();
        }
        private void DBAccess()
        {
            string con = @"Data Source=ADMIN\SQLEXPRESS;Initial Catalog=LICHTHI;Integrated Security=True";
            SqlConnection Con = new SqlConnection(con);
            SqlDataAdapter adapter = new SqlDataAdapter("exec P1", con);
            adapter.Fill(table);
            dataGridView1.DataSource = table;


        }
        private void ToMau()
        {
            int n = table.Rows.Count;
            List<HocPhan> HP = new List<HocPhan>();
            HocPhan hp0 = new HocPhan();
            HP.Add(hp0);
            for (int i = 0; i < n; i++)
            {
                HocPhan hp = new HocPhan(Convert.ToInt32(table.Rows[i]["MaMon"]));
                string s = table.Rows[i]["MaSV"].ToString().TrimEnd(',');
                string[] arrS = s.Split(',');
                int j = 0;
                foreach (string arr in arrS)
                {
                    hp.addSV(Convert.ToInt32(arr));
                    j++;
                }
                HP.Add(hp);
            }
            //show danh sach sv cua lop hp
            //for (int i = 0; i < n; i++)
            //{
            //    for(int j=0;j<HP[i+1].Sv.Count;j++)
            //    {
            //        label1.Text = label1.Text + HP[i+1].Sv[j]+"  ";
            //    }
            //    label1.Text += "\n";
            //}


            int[,] H = new int[n + 1, n + 1];
            for (int i = 1; i <= n; i++)
            {
                for (int j = 1; j <= n; j++)
                {
                    H[i, j] = 0;
                }
            }

            tb.convertDS1(n, HP, H);
            int[] Bac = new int[10];
            tb.BacDinh(H, n, Bac);
            int[] Dinh = new int[10];
            tb.MangDinh(n, Dinh);
            tb.SortDinh(Dinh, Bac, n);
            tb.Tomau1(H, Dinh, n, HP);

            for (int i = 1; i <= n; i++)
            {
                label1.Text = label1.Text + HP[i].show();
            }
        }
        private void Form1_Load(object sender, EventArgs e)
        {

            DBAccess();

            ToMau();
            
        }
    }
}
