using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace JewelleryOnline
{
    public partial class AddProduct : System.Web.UI.Page
    {
        public string ConnectionString = "Data Source=DESKTOP-OGOCGH7\\SQLEXPRESS;Initial Catalog=JewelleryOnlineDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string query = "select *,Brand_Name from Product_Details pd LEFT OUTER JOIN Brand_Details bd ON pd.Brand_Id = bd.Brand_Id";
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
                BindBrands();
                //if (Session["ProductEditMessage"] != null)
                //{
                //    lblProductEditMsg.Text = Session["ProductEditMessage"].ToString();
                //}
                
            }
            
        }
       /* protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                DropDownList DropDownList1 = (e.Row.FindControl("ddlBrandId") as DropDownList);
                var arr = ((System.Data.DataRowView)e.Row.DataItem).Row.ItemArray;
                DropDownList1.DataSource = GetBrands();
                DropDownList1.DataTextField = "BrandName";
                DropDownList1.DataValueField = "BrandId";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("--Select --", "0"));
                DropDownList1.SelectedValue = Convert.ToString(arr[1]);

            }

        }*/


        private void bindProducts()
        {
            string query = "select *,Brand_Name from Product_Details pd LEFT OUTER JOIN Brand_Details bd ON pd.Brand_Id = bd.Brand_Id";
            //string query = "select Product_Id,Brand_Id,Product_Name,Sales_Price,Available_Qty from Product_Details";

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



        public DataTable GetBrands()
        {
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("sp_GetAllBrands", conn))
            {

                SqlDataAdapter adapt = new SqlDataAdapter(cmd);
                adapt.SelectCommand.CommandType = CommandType.StoredProcedure;

                // fill the data table - no need to explicitly call `conn.Open()` - 
                // the SqlDataAdapter automatically does this (and closes the connection, too)
                adapt.Fill(dt);


            }
            return dt;

        }
        public void BindBrands()
        {
           
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("sp_GetAllBrands", conn))
            {

                SqlDataAdapter adapt = new SqlDataAdapter(cmd);
                adapt.SelectCommand.CommandType = CommandType.StoredProcedure;

                // fill the data table - no need to explicitly call `conn.Open()` - 
                // the SqlDataAdapter automatically does this (and closes the connection, too)
                DataTable dt = new DataTable();
                adapt.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    dropBrandList.DataSource = dt;
                    dropBrandList.DataTextField = "BrandName";
                    dropBrandList.DataValueField = "BrandId";
                    dropBrandList.DataBind();
                    dropBrandList.Items.Insert(0, "Select");
                }
                
            }
        }
        
        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string query = "insert into Product_Details values('" + dropBrandList.SelectedItem.Value  + "','" + txtProductName.Text  + "','" + txtSales.Text  + "','" + txtQuantity.Text + "')";
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
            bindProducts();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
       
       
        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Session["EditProductId"] = btn.CommandArgument.ToString();
            Response.Redirect("EditProduct.aspx");
        }
        protected void btnDeleteProduct_Click(object sender, ImageClickEventArgs e)
        {
            string query = "delete from Product_Details where Product_ID='" + txtProductID.Text + "'";
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
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