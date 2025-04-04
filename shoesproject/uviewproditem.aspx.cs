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
    public partial class uviewproditem : System.Web.UI.Page
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


                    if (Session["product_id"] != null)
                    {
                        int productId = Convert.ToInt32(Session["product_id"]);

                        string s = "SELECT * FROM product_table WHERE product_status = 'available'AND product_id = " + productId + "   ";
                        DataSet ds = objcls.fn_dataset(s);
                        DataList1.DataSource = ds;
                        DataList1.DataBind();

                    }
                    Panel2.Visible = true;

                }

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["reg_id"] != null)
            {
                int reg= Convert.ToInt32(Session["reg_id"]);


                if (Session["product_id"] != null)
                {
                    int productId = Convert.ToInt32(Session["product_id"]);

                    string sel = "select max(cart_id)from cart";
                    string maxcartid = objcls.fn_scalar(sel);
                    int cart_id = 0;
                    if (maxcartid == "")
                    {
                        cart_id = 1;
                    }
                    else
                    {
                        int newcartid = Convert.ToInt32(maxcartid);
                        cart_id = newcartid + 1;
                    }

                    string s = "SELECT * FROM product_table WHERE product_status = 'available'AND product_id = " + productId + "   ";
                    SqlDataReader dr = objcls.fn_reader(s);
                    while (dr.Read())
                    {

                        Label8.Text = dr["product_price"].ToString(); 
                    }
                    int product_quantity = int.Parse(TextBox1.Text);
                    int price = int.Parse(Label8.Text);

                    // Calculate total price
                    int totalPrice = product_quantity * price;

                    // Display the result
                    Label7.Text =  totalPrice.ToString();
                    string ins = "Insert into cart values(" + cart_id + "," + reg+ "," + productId + ",'" + TextBox1.Text + "','" + Label7.Text + "')";
                    int i = objcls.fn_nonquery(ins);

                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Session.Clear();
            Session.Abandon();
            Response.Redirect("webform1.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("uviewcart.aspx");
        }
    }
}