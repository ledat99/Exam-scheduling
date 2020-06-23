using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExamScheduling
{
    public partial class FormChooseDB : Form
    {
        public FormChooseDB()
        {
            InitializeComponent();
        }
        public static string str = null;
        public static SqlConnection m_Conn = null;
        public static SqlConnection connection = null;
        public static SqlCommand command = new SqlCommand();
        public static SqlDataAdapter adapter = new SqlDataAdapter();

        public void BtnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        public void BtnOK_Click(object sender, EventArgs e)
        {
            if (cmbAuthentication.SelectedItem.Equals("Windows Authentication"))
            {

                try
                {

                    if (String.Compare(txtServer.Text, "") > 0 && String.Compare(cmbDatabase.SelectedItem.ToString(), "") > 0)
                    {
                        MessageBox.Show("Kết nối thành công!", "SUCCESSED", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        str = "Data Source=" + txtServer.Text + ";Initial Catalog=" + cmbDatabase.SelectedItem.ToString() + ";Integrated Security=True;";
                        connection = new SqlConnection(str);
                    }
                    else
                        MessageBox.Show("Lỗi kết nối", "FAILED", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                catch (SqlException sqlEx)
                {
                    MessageBox.Show(sqlEx.Message, "FAILED", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                finally
                {
                    if (m_Conn.State == ConnectionState.Open)
                        m_Conn.Close();

                    m_Conn.Dispose();

                }
            }

            //Quyền SQL Server
            if (cmbAuthentication.SelectedItem.Equals("SQL Server Authentication"))
            {
                try
                {

                    if (String.Compare(cmbDatabase.SelectedItem.ToString(), "") > 0)
                    {
                        MessageBox.Show("Kết nối thành công!", "SUCCESSED", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        str = "Data Source=" + txtServer.Text + ";Initial Catalog=" + cmbDatabase.SelectedItem.ToString() + ";User Id=" + txtUsername.Text + ";Password=" + txtPassword.Text + ";";
                        connection = new SqlConnection(str);
                    }

                    else
                        MessageBox.Show("Lỗi kết nối", "FAILED", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                catch (SqlException sqlEx)
                {
                    MessageBox.Show(sqlEx.Message, "SUCCESSED", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                finally
                {
                    if (m_Conn.State == ConnectionState.Open)
                        m_Conn.Close();

                    m_Conn.Dispose();

                }
            }

            this.DialogResult = DialogResult.OK;

            Form1 f1 = new Form1();
            this.Hide();
            f1.ShowDialog();
            this.Show();

        }

        public void BtnTestConnection_Click(object sender, EventArgs e)
        {

            if (cmbAuthentication.SelectedItem.Equals("Windows Authentication"))
            {
                cmbDatabase.Items.Clear();
                m_Conn = new SqlConnection("Data Source=" + txtServer.Text + ";Initial Catalog=master;Integrated Security=True;");
                SqlCommand m_Cmd = new SqlCommand("SP_DATABASES", m_Conn);
                SqlDataReader m_DReader;

                try
                {
                    m_Conn.Open();
                    m_DReader = m_Cmd.ExecuteReader();
                    while (m_DReader.Read())
                    {
                        cmbDatabase.Items.Add(m_DReader[0].ToString());
                    }
                    MessageBox.Show("Kết nối đến server thành công", "Thông báo", MessageBoxButtons.OK);
                }
                catch (SqlException sqlEx)
                {
                    MessageBox.Show(sqlEx.Message, "FAILED", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                finally
                {
                    if (m_Conn.State == ConnectionState.Open)
                        m_Conn.Close();

                    m_Conn.Dispose();
                    m_Cmd.Dispose();
                }
            }

            //Quyền SQL Server
            if (cmbAuthentication.SelectedItem.Equals("SQL Server Authentication"))
            {
                cmbDatabase.Items.Clear();
                m_Conn = new SqlConnection("Data Source=" + txtServer.Text + ";Initial Catalog=master;User Id=" + txtUsername.Text + ";Password=" + txtPassword.Text + ";");
                SqlCommand m_Cmd = new SqlCommand("SP_DATABASES", m_Conn);
                SqlDataReader m_DReader;

                try
                {
                    m_Conn.Open();
                    m_DReader = m_Cmd.ExecuteReader();
                    while (m_DReader.Read())
                    {
                        cmbDatabase.Items.Add(m_DReader[0].ToString());
                    }
                    MessageBox.Show("Kết nối đến server thành công", "Thông báo", MessageBoxButtons.OK);

                }
                catch (SqlException sqlEx)
                {
                    MessageBox.Show(sqlEx.Message, "SUCCESSED", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                finally
                {
                    if (m_Conn.State == ConnectionState.Open)
                        m_Conn.Close();

                    m_Conn.Dispose();
                    m_Cmd.Dispose();
                }
            }
        }
        public void CmbAuthentication_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbAuthentication.SelectedItem.Equals("Windows Authentication"))
            {
                txtUsername.Enabled = false;
                txtPassword.Enabled = false;
            }
            else
            {
                txtUsername.Enabled = true;
                txtPassword.Enabled = true;
            }
        }

        private void FormChooseDB_Load(object sender, EventArgs e)
        {
            cmbAuthentication.SelectedItem = "Windows Authentication";

        }


        public void createConn()
        {
            try
            {
                if (connection.State != ConnectionState.Open)
                {
                    connection.ConnectionString = str;
                    connection.Open();
                }
            }
            catch (Exception err)
            {
                throw err;
            }
        }

        public void readDatathroughAdapter(string query, DataTable tblName)
        {
            try
            {
                if (connection.State == ConnectionState.Closed)
                    createConn();
                command.Connection = connection;
                command.CommandText = query;
                command.CommandType = CommandType.Text;
                adapter = new SqlDataAdapter(command);
                adapter.Fill(tblName);
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message.ToString(), "ERROR", MessageBoxButtons.OK);
            }
        }
    }
}
