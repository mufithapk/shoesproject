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
    public partial class WebForm1 : System.Web.UI.Page
    {
        connectionclass objcls = new connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("regform.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string stri = "select reg_id from login where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";

            string reg = objcls.fn_scalar(stri);
            Session["reg_id"] = reg;

            string str = "select count(reg_id) from login where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";

            string cid = objcls.fn_scalar(str);
            int cid1 = Convert.ToInt32(cid);
          
            
            if (cid1 == 1)
            {
                string sel = "select count(reg_id)  from  login   where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
                string regid = objcls.fn_scalar(sel);
                Session["user_id"] = regid;

               

                string sel2 = "select log_type from  login   where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
                string logtype = objcls.fn_scalar(sel2);
                if (logtype == "admin")
                {

                    
                    Response.Redirect("adminh.aspx");



                }
                else if (logtype == "user")
                {
                    
                    Response.Redirect("userhome.aspx");


                }
            }
            else
            {
                Label3.Text = "invalid usernme and password";
            }
           

        }
    }
}