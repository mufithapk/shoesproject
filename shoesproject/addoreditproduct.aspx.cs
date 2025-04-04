using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoesproject
{
    public partial class addoreditproduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("addpod.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("editproduct.aspx");
        }
    }
}