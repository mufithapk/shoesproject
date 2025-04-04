using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace shoesproject
{
    public partial class addcate : System.Web.UI.Page
    {
        connectionclass objcls = new connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string a = "~/category/" + FileUpload1.FileName;//phptopath
            FileUpload1.SaveAs(MapPath(a));//save to folder





            string strins = "Insert into category_table values('" + TextBox1.Text + "','" + a + "','" + TextBox2.Text + "','available')";
            int i = objcls.fn_nonquery(strins);
            if (i == 1)
            {
                Label4.Text = "successfully inserted";
            }
        }
    }
}