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
        private string message = string.Empty;

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!this.IsPostBack)
        //    {
        //    }
        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool correct = CaptchaBox.Validate(txtCaptcha.Text);
            txtCaptcha.Text = null;
            if (correct)
            {


                if (txtPassword.Text == txtPassword1.Text)
                {

                    string UserName = txtUsername.Text;
                    string Password = txtPassword.Text;

                    string ConfirmPassword = txtPassword1.Text;
                    SqlConnection con = new SqlConnection("Data Source=DESKTOP-OGOCGH7\\SQLEXPRESS;Initial Catalog=JewelleryOnlineDB;Integrated Security=True");
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_userinformation", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserName", UserName);
                    cmd.Parameters.AddWithValue("@Password", Password);
                    cmd.Parameters.AddWithValue("@ConfirmPassword", ConfirmPassword);
                    cmd.Parameters.Add("@ERROR", SqlDbType.Char, 1000);
                    cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output; 

                    cmd.ExecuteNonQuery();
                    string message = (string)cmd.Parameters["@ERROR"].Value;

                    con.Close();

                }
                else
                {
                    Page.RegisterStartupScript("UserMsg", "<Script language='javascript'>alert('" + "Password mismatch" + "');</script>");
                }
                lblmsg.Text = message;
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Information", "alert('Invalid captcha.')", true);
            }

        }
    }
}




