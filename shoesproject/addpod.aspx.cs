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
    public partial class addpod : System.Web.UI.Page
    {
        connectionclass objcls = new connectionclass();
        SqlConnection con = new SqlConnection(@"server=MUFITHA-LAP\SQLEXPRESS05;database=shoes;Integrated Security=true");
        protected void Page_Load(object sender, EventArgs e)
        {



            if (!IsPostBack)
            {
                string s = "select category_id , category_name from category_table";
                //DataSet da = objcls.fn_dataset(s);

                //DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                da.Fill(ds);

                DropDownList2.DataSource = ds;
                DropDownList2.DataTextField = "category_name";
                DropDownList2.DataValueField = "category_id";
                DropDownList2.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {



            string a = "~/product/" + FileUpload1.FileName;//phptopath
            FileUpload1.SaveAs(MapPath(a));//save to folder




            string strins = "Insert into product_table values('" + DropDownList2.SelectedValue + "','" + TextBox1.Text + "','" + a + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','available')";
            int i = objcls.fn_nonquery(strins);
            if (i == 1)
            {
                Label7.Text = "successfully inserted";
            }
        }


    }
}