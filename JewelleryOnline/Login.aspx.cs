using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace JewelleryOnline
{
    public partial class Login : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            SqlConnection conn = new SqlConnection();
            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();

            conn.ConnectionString = "Data Source=DESKTOP-OGOCGH7\\SQLEXPRESS;Initial Catalog=JewelleryOnlineDB;Integrated Security=True";
            conn.Open();
            cmd.CommandText = "select * from Admin where UserName = '" + txtUsername.Text + "' and Password= '" + txtPassword.Text + "'";
            cmd.Connection = conn;
            sda.SelectCommand = cmd;
            sda.Fill(ds, "Admin");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Redirect("Inventory.aspx");
            }
            else
            {
                lblmsg.Text = "Invalid Username and Password";
            }
            conn.Close();
        }
  
       
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUpPage.aspx");
        }
    }
}