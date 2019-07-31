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
