using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace JewelleryOnline
{
    public partial class Inventory : System.Web.UI.Page
    {
        public Inventory()

        {
            }
            string cnstring = "Data Source=DESKTOP-OGOCGH7\\SQLEXPRESS;Initial Catalog=JewelleryOnlineDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)

            {
                string myquery = "select [Brand_Name],[NumberOfProducts] FROM [Brand_Details]";
                SqlConnection con = new SqlConnection(cnstring);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = con;

                SqlDataAdapter da = new SqlDataAdapter();//communication b/w Dataset and SQL DB
                da.SelectCommand = cmd;

                DataSet ds = new DataSet();//it is kind of a box,use for single database tabales
            if (da.TableMappings.Count != 0)
            {
                da.Fill(ds);
                GridView3.DataSource = ds;
                GridView3.DataBind();
            }
            else
            {
                lblmsg.Text = "Inventory has no data";
            }
                con.Close();

                string abcd = "SELECT  [Product_Name], [Available_Qty],[Brand_ID] FROM [Product_Details]";
                SqlConnection con1 = new SqlConnection(cnstring);
                SqlCommand cmd1 = new SqlCommand();
                cmd.CommandText = abcd;
                cmd.Connection = con;

                SqlDataAdapter da1 = new SqlDataAdapter();//communication b/w Dataset and SQL DB
                da1.SelectCommand = cmd;

                DataSet ds1 = new DataSet();//it is kind of a box,use for single database tabales
                da.Fill(ds1);
                GridView1.DataSource = ds1;
                GridView1.DataBind();


                con.Close();
            }

          

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBrand.aspx");
        }

        protected void BtnAdd2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");

        }
    }

       
    }
