using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExamScheduling
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }
        DataTable DB;
        public Form2(DataTable db) : this()
        {
            DB = db;
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            dataGridView2.DataSource = DB;
        }
    }
}
