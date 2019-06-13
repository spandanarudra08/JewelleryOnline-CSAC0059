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
        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-3S2V24R;Initial Catalog=Shoes;Integrated Security=True");
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public DataTable Getuserdata()
        {
            cmd = new SqlCommand("getbrand", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;

        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand comm = conn.CreateCommand();
            comm.CommandType = CommandType.Text;
            comm.CommandText = "insert into Product values('" + txtProductName.Text + "','" + txtSales.Text + "','" + txtQuantity.Text + "','" +  "')";
            comm.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Product.aspx");

        }
    }
}