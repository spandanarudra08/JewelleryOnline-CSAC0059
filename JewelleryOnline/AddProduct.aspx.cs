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
    public partial class AddProduct : System.Web.UI.Page
    {
        public string ConnectionString = "Data Source=DESKTOP-OGOCGH7\\SQLEXPRESS;Initial Catalog=JewelleryOnlineDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
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
            
        }

      

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string query = "insert into Product_Details values('" + txtProductID.Text + "','" + dropBrandList.SelectedItem.Text  + "','" + txtProductName.Text  + "','" + txtSales.Text  + "','" + txtQuantity.Text + "')";
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

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void EdtButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("EditProduct.aspx");
        }
    }
}