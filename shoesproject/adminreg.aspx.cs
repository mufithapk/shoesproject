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
    public partial class adminreg : System.Web.UI.Page
    {
        connectionclass objcls = new connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string sel = "select max(reg_id)from login";
            string maxregid = objcls.fn_scalar(sel);
            int reg_id = 0;
            if (maxregid == "")
            {
                reg_id = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(maxregid);
                reg_id = newregid + 1;
            }
            string ins = "Insert into adminreg values(" + reg_id + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','active')";
            int i = objcls.fn_nonquery(ins);
            if (i == 1)
            {

                string log = "Insert into login values(" + reg_id + ",'" + TextBox6.Text + "','" + TextBox7.Text + "','admin')";
                int j = objcls.fn_nonquery(log);
            }
            if (reg_id >= 1)
            {
                Label9.Visible = true;
                Label9.Text = "successfully inserted";
            }
        }
    }
}