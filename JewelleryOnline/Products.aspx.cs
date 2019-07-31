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
    public partial class Products : System.Web.UI.Page
    {
        public string ConnectionString = "Data Source=DESKTOP-OGOCGH7\\SQLEXPRESS;Initial Catalog=JewelleryOnlineDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "select *,Brand_Name FROM Product_Details pd LEFT OUTER JOIN Brand_Details bd ON pd.Brand_Id = bd.Brand_Id";
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
        private void bindProducts()
        {
            string query = "select Product_Id,Brand_Id,Product_Name,Sales_Price,Available_Qty from Product_Details";
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
        protected void DataList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");

        }
        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProduct.aspx");

        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string PID = btn.CommandArgument.ToString();
            string query = "delete from Product_Details where Product_ID='" + PID + "'";
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
            bindProducts();
            Page.RegisterStartupScript("UserMsg", "<Script language='javascript'>alert('" + "product details deleted successfully." + "');</script>");

        }
    }
}