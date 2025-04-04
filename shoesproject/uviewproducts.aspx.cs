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
    public partial class uviewproducts : System.Web.UI.Page
    {
        connectionclass objcls = new connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["reg_id"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Response.Write("Session Active. User ID: " + Session["reg_id"].ToString());
            }
            if (!IsPostBack)
                {


                    if (Session["category_id"] != null)
                    {
                        int categoryId = Convert.ToInt32(Session["category_id"]);

                        string s = "SELECT * FROM product_table WHERE product_status = 'available'AND category_id = " + categoryId + "   ";
                        DataSet ds = objcls.fn_dataset(s);
                        DataList1.DataSource = ds;
                        DataList1.DataBind();

                    }

                if (Session["reg_id"] != null)
                {
                    int  reg = Convert.ToInt32(Session["reg_id"]);
                }

            }
        }

            protected void ImageButton1_Command1(object sender, CommandEventArgs e)
            {
                try
                {
                    if (e.CommandName == "SelectItem")
                    {
                        Response.Write("Command Argument: " + e.CommandArgument.ToString());

                        int productId;
                        if (int.TryParse(e.CommandArgument.ToString(), out productId))
                        {
                            Session["product_id"] = productId;
                            Response.Write("<br>Session Value Set: " + Session["product_id"].ToString());

                            Response.Redirect("uviewproditem.aspx");
                        }
                        else
                        {
                            Response.Write("Invalid Product ID.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            



        }
    }
}