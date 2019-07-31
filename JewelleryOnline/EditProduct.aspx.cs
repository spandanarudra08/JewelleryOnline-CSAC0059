using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using BussinessObjects;
using System.Threading;

namespace JewelleryOnline
{
    public partial class EditProduct : System.Web.UI.Page
    {
        public string ConnectionString = "Data Source=DESKTOP-OGOCGH7\\SQLEXPRESS;Initial Catalog=JewelleryOnlineDB;Integrated Security=True";
        JewelleryOnlineDBEntities dBEntities = new JewelleryOnlineDBEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindBrands();
                BindProductDetails();
            }
        }

        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            int prodID = Convert.ToInt32(txtProductID.Text);
            var productDetails = dBEntities.Product_Details.Where(p => p.Product_Id == prodID).FirstOrDefault();
            if (productDetails != null)
            {
                productDetails.Product_Name = txtProductName.Text;
                productDetails.Available_Qty = txtQuantity.Text;
                productDetails.Sales_Price = txtSales.Text;
                productDetails.Brand_Id = Convert.ToInt32( dropBrandList.SelectedValue);
                dBEntities.SaveChanges();
                Response.Redirect("AddProduct.aspx", false);

                //store string in session which will be accessed on next page  

                Session["ProductEditMessage"] = "Product Details Updated successfully.";

            }
            else
            {
                Response.Redirect("GetData.aspx", false);
                Session["ProductEditMessage"] = "Product Details not found";
            }
        }

        protected void btnCancelProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
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
            
            con.Close();
        }

        private void BindProductDetails()
        {
            if (Session["EditProductId"] != null && !string.IsNullOrEmpty(Session["EditProductId"].ToString()))
            {
                int prodID = Convert.ToInt32(Session["EditProductId"]);
                var productDetails = dBEntities.Product_Details.Where(p => p.Product_Id == prodID).FirstOrDefault();
                if (productDetails != null)
                {
                    txtProductID.Text = productDetails.Product_Id.ToString();
                    txtProductName.Text = productDetails.Product_Name;
                    txtQuantity.Text = productDetails.Available_Qty;
                    txtSales.Text = productDetails.Sales_Price;
                    dropBrandList.SelectedValue = productDetails.Brand_Id.ToString();
                }
            }

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
    }
}