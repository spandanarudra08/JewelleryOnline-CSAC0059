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
                BindProducts();
            }

        }
        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAddBrand_Click(object sender, EventArgs e)
        {
            lblMsg.Visible = false;

            string query = "insert into Brand_Details values('" + txtBrandID.Text + "','" + txtBrandname.Text + "','" + txtNoOfProducts.Text + "')";
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
            BindProducts();
            lblMsg.Visible = true;
            lblMsg.Text = "Brand " + txtBrandname.Text + " added successfully";
        }

        private void BindProducts()
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

        protected void EdtButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Edit Brand.aspx");
        }
        protected void btnDeleteBrand_Click(object sender, ImageClickEventArgs e)
        {
            string query = "delete from Brand_Details where Brand_Id='" + txtBrandID.Text + "'";
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
    }
}