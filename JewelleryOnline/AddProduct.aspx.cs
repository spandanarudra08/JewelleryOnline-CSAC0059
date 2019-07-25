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
                bindProducts();
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
                BindBrands();
            }
            
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
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

        }
        protected void Gridview1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Gridview1.EditIndex = e.NewEditIndex;
            bindProducts();
        }
        protected void Gridview1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txtProductName = (TextBox)Gridview1.FooterRow.FindControl("txtnameProductname");
            DropDownList txtBrand = (DropDownList)Gridview1.FooterRow.FindControl("txtBrand1");
            TextBox txtPrice = (TextBox)Gridview1.FooterRow.FindControl("txtSalesPrice");
            TextBox txtPID = (TextBox)Gridview1.FooterRow.FindControl("lblid");
//update commands
        }

        protected void Gridview1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //delete command
            bindProducts();
        }


        protected void Gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {

                TextBox txtProductName = (TextBox)Gridview1.FooterRow.FindControl("txtnameProductname1");
                DropDownList txtBrand = (DropDownList)Gridview1.FooterRow.FindControl("txtBrand1");
                TextBox txtPrice = (TextBox)Gridview1.FooterRow.FindControl("txtSalesPrice1");

                //ad = new SqlDataAdapter("INSERT INTO Tbl_Info(Name,State,City) Values('" + txtName.Text + "', '" + txtState.Text + "', '" + txtCity.Text + "')", conn);
                //dt = new DataTable();
                //ad.Fill(dt);
                bindProducts();
            }
        }

        protected void Gridview1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Gridview1.PageIndex = e.NewPageIndex;
            bindProducts();
        }
        protected void Gridview1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Gridview1.EditIndex = -1;
            bindProducts();
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
        public void bindProducts()
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("sp_GetAllProducts", conn))
            {

                SqlDataAdapter adapt = new SqlDataAdapter(cmd);
                adapt.SelectCommand.CommandType = CommandType.StoredProcedure;

                // fill the data table - no need to explicitly call `conn.Open()` - 
                // the SqlDataAdapter automatically does this (and closes the connection, too)
                DataTable dt = new DataTable();
                adapt.Fill(dt);

                Gridview1.DataSource = dt;
                Gridview1.DataBind();

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
            DataList1.DataSource = dt;
            DataList1.DataBind();
            con.Close();
        }
    }
}