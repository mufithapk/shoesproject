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
    public partial class editcategory : System.Web.UI.Page
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
            string s = "select * from category_table ";
            DataTable da = objcls.fn_datatable(s);
            GridView1.DataSource = da;
            GridView1.DataBind();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Bind_Grid();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
       {
            GridView1.EditIndex = -1;
            Bind_Grid();
       }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int category_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string a = "~/category/" + FileUpload1.FileName;//phptopath
            FileUpload1.SaveAs(MapPath(a));//save to folder
           string strupd = "UPDATE category_table SET category_description='" + TextBox1.Text +  "', category_image='" + a +  "', category_status='" + TextBox2.Text + "' WHERE category_id=" + category_id+" ";
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
        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow rw = GridView1.Rows[e.NewSelectedIndex];
            int category_id = Convert.ToInt32(GridView1.DataKeys[e.NewSelectedIndex].Value);
            Session["category_id"] = category_id;
            try
            {
                GridViewRow selectedRow = GridView1.Rows[e.NewSelectedIndex];
                  string category_image = selectedRow.Cells[4].Text.Trim();
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
            TextBox1.Text = rw.Cells[5].Text;

            TextBox2.Text = rw.Cells[6].Text;



        }




       

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;


        }

        
        
    }
}