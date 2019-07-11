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
    public partial class Edit_Brand : System.Web.UI.Page
    {
        public string ConnectionString = "Data Source=DESKTOP-OGOCGH7\\SQLEXPRESS;Initial Catalog=JewelleryOnlineDB;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "select Brand_Id,Brand_Name from Brand_Details";
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
        protected void DataList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void btnUpdateBrand_Click(object sender, EventArgs e)
        {
            
                string query = "update Brand_Details set Brand_Name='" + txtBrandname.Text + "' where Brand_ID='" + txtBrandID.Text + "'";

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


        protected void btnCancelBrand_Click(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "select Brand_Id,Brand_Name from Brand_Details";
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