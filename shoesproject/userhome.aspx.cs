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
    public partial class userhome : System.Web.UI.Page
    {
        connectionclass objcls = new connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["reg_id"] != null)
            {
                // Read session value and convert it to the required type
                int reg = Convert.ToInt32(Session["reg_id"]);
               

                // Display session values
                Response.Write("User ID: " + reg);
               
            }
            else
            {
                // Redirect to login page if session does not exist
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
                {
                    string s = "select * from category_table where category_status='available' ";
                    DataSet ds = objcls.fn_dataset(s);
                    DataList1.DataSource = ds;
                    DataList1.DataBind();


                }
            if (Session["reg_id"] != null)
            {
                int reg = Convert.ToInt32(Session["reg_id"]);
                Response.Write(Session["reg_id"]);
            }
        }



        private void LoadCategories(string searchQuery)
        {
            string s;
            if (string.IsNullOrEmpty(searchQuery))
            {
                s = "SELECT * FROM category_table WHERE category_status='available'";
            }
            else
            {
                s = "SELECT * FROM category_table WHERE category_status='available' AND category_name LIKE '%" + searchQuery + "%'";
            }

            DataSet ds = objcls.fn_dataset(s);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }









        protected void ImageButton1_Command(object sender, CommandEventArgs e)
            {
            
                try
                {

                    if (e.CommandName == "SelectItem")


                    {

                        int categoryId = 0;
                        if (int.TryParse(e.CommandArgument.ToString(), out categoryId))
                        {

                            Session["category_id"] = categoryId;

                            Response.Redirect("uviewproducts.aspx", false);
                            Context.ApplicationInstance.CompleteRequest();
                        }
                        else
                        {
                            Response.Write("Invalid category ID.");
                        }
                    }
                }
                catch (Exception ex)
                {

                    Response.Write("Error: " + ex.Message);
                }

           

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("sendfeedback.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string searchText = TextBox1.Text.Trim();
            LoadCategories(searchText);
        }
    }

 }