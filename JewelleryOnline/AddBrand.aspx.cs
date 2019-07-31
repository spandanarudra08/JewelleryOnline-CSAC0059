using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace JewelleryOnline
{
    public partial class Add_Brand : System.Web.UI.Page
    {
        public string ConnectionString = "Data Source=DESKTOP-OGOCGH7\\SQLEXPRESS;Initial Catalog=JewelleryOnlineDB;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindBrands();
            }

        }
        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAddBrand_Click(object sender, EventArgs e)
        {
            lblMsg.Visible = false;

            string query = "insert into Brand_Details values('" + txtBrandname.Text + "','" + txtNoOfProducts.Text + "')";
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
            bindBrands();
            lblMsg.Visible = true;
            lblMsg.Text = "Brand " + txtBrandname.Text + " added successfully";
        }

        private void bindBrands()
        {
            string query = "select Brand_Id,Brand_Name,NumberOfProducts from Brand_Details";
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();

            con.Close();
        }

        protected void EdtButton1_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Session["EditBrandId"] = btn.CommandArgument.ToString();
            
            Response.Redirect("Edit Brand.aspx");
        }
        protected void btnDeleteBrand_Click(object sender, ImageClickEventArgs e)
        {
            Button btn = sender as Button;
            string BrandId = btn.CommandArgument.ToString();
            string query = "delete from Brand_Details where Brand_Id='" + BrandId + "'";
            SqlConnection con = new SqlConnection(ConnectionString);
            
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
            bindBrands();
            Page.RegisterStartupScript("UserMsg", "<Script language='javascript'>alert('" + "Brand details deleted successfully." + "');</script>");

        }
    }
}