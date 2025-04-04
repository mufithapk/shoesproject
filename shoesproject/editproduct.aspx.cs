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
    public partial class editproduct : System.Web.UI.Page
    {
        connectionclass objcls = new connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind_Grid();

            }
        }
        public void Bind_Grid()
        {
            string s = "select * from product_table ";
            DataTable da = objcls.fn_datatable(s);
           GridView1.DataSource = da;
            GridView1.DataBind();
      }
        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Bind_Grid();
       }
        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
          int product_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string a = "~/product/" + FileUpload1.FileName;//phptopath
            FileUpload1.SaveAs(MapPath(a));//save to folder
            string strupd = "UPDATE product_table SET product_image='" + a + "', product_price=" + TextBox1.Text + ", product_description='" + TextBox2.Text + "', stock='" + TextBox3.Text + "', product_status='" + TextBox4.Text + "' WHERE product_id=" +product_id+ " ";
           int result = objcls.fn_nonquery(strupd);
            if (result == 1)
            {
                Label4.Text = "Updated successfully";
            }
            else
            {
                Label4.Text = "Update failed";
            }
       }
        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Bind_Grid();
        }
       protected void GridView1_SelectedIndexChanging1(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow rw = GridView1.Rows[e.NewSelectedIndex];
            int product_id = Convert.ToInt32(GridView1.DataKeys[e.NewSelectedIndex].Value);
            Session["product_id"] = product_id;

            try
            {
                
                GridViewRow selectedRow = GridView1.Rows[e.NewSelectedIndex];

                
                string category_image = selectedRow.Cells[5].Text.Trim();

              
                if (!string.IsNullOrEmpty(category_image) && category_image != "&nbsp;")
                {
                    ImageButton1.ImageUrl = ResolveUrl(category_image); 
                    ImageButton1.Visible = true;                 
                }
                else
                {
                    ImageButton1.Visible = false;                 
                }
            }
            catch (Exception ex)
            {
                 Response.Write($"Error: {ex.Message}");
            }
          TextBox1.Text = rw.Cells[6].Text;

            TextBox2.Text = rw.Cells[7].Text;
            TextBox3.Text = rw.Cells[8].Text;
            TextBox4.Text = rw.Cells[9].Text;
        }
    }
}