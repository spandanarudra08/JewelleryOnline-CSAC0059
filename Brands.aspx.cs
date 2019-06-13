using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JewelleryOnline
{
    public partial class Brands : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddBrand_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add Brand.aspx");
        }
    }
}