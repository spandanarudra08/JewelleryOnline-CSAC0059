using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BotDetect;
using BotDetect.Web.UI;
using BotDetect.Web;
using System.Data.SqlClient;
using System.Data;

namespace JewelleryOnline
{
    public partial class SignUpPage : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection conn = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.ConnectionString = "Data Source=DESKTOP-OGOCGH7\\SQLEXPRESS;Initial Catalog=JewelleryOnlineDB;Integrated Security=True";
            
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand comm = conn.CreateCommand();
            comm.CommandType = CommandType.Text;
            cmd.CommandText = "insert into SignUp values  ('" + txtUsername.Text + "'  '" + txtPassword.Text + "''"+txtPassword1+"')";
            


            if ( (ds.Tables[1].Rows.Count>= 0) && (txtPassword==txtPassword1))
            {
                comm.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblmsg.Text = "Password doesn't match, re-enter";
            }
        }

    }
    }
