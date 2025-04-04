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
    public partial class bill : System.Web.UI.Page
    {
        connectionclass objcls = new connectionclass();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind_Grid();
                if (Session["reg_id"] != null)
                {
                    int reg = Convert.ToInt32(Session["reg_id"]);
                    string sel = "select name,email,address,place from userreg where user_id=" + Session["reg_id"] + "";


                    //SqlDataReader dr = cmd.ExecuteReader();
                    SqlDataReader dr = objcls.fn_reader(sel);
                    while (dr.Read())
                    {
                        Label2.Text = dr["name"].ToString();
                        Label4.Text = dr["email"].ToString();
                        Label6.Text = dr["address"].ToString();
                        Label8.Text = dr["place"].ToString();

                    }
                    
                        string g = "SELECT grand_total FROM bill WHERE user_id = " + Session["reg_id"] + "";
                    SqlDataReader da = objcls.fn_reader(g);
                    while (da.Read())
                    {

                        Label14.Text = da["grand_total"].ToString();
                    }

                }
            }

           
        }
        public void Bind_Grid()
        {
            string s = "SELECT product_table.product_name, [order].product_quantity, product_table.product_price " +
            "FROM product_table " +
            "INNER JOIN [order] ON product_table.product_id = [order].product_id " +
            "WHERE [order].user_id = " + Session["reg_id"];
            DataTable da = objcls.fn_datatable(s);
            GridView1.DataSource = da;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            if (Session["reg_id"] != null)
            {
                int reg = Convert.ToInt32(Session["reg_id"]);
                string query = "INSERT INTO bank (account_no, user_id, account_type, balance_amount, date) " +
                 "VALUES (" + TextBox4.Text + ", " + reg + ", '" + TextBox1.Text + "', " + TextBox2.Text + ", GETDATE())";
                int i = objcls.fn_nonquery(query);
                if (i == 1)
                {
                    Label20.Text = "successfully inserted";
                }
            }
            Panel2.Visible = true;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            balcheck.ServiceClient obj = new balcheck.ServiceClient();
            string bal = obj.balcheck(TextBox3.Text);
            Label21.Text = bal;

            

        }

      

        protected void Button4_Click1(object sender, EventArgs e)
        {
            try
            {
                Label22.Text = "Button clicked."; // Debug point 1

                if (string.IsNullOrEmpty(TextBox3.Text)) // Check for account number input
                {
                    Label22.Text = "Account number is required!"; // Debug point 2
                    return;
                }

                // Service Call
                balupdate.ServiceClient objl = new balupdate.ServiceClient();
                string balu = objl.balupdate(TextBox3.Text); // Pass account number
                Label22.Text = balu; // Debug point 3

                if (balu == "Balance updated successfully.") // Check if balance was updated
                {
                    // Fetch all orders with status 'ordered'
                    string query = "SELECT order_id, product_id, product_quantity FROM [order] WHERE user_id = " + Session["reg_id"] + " AND order_status = 'ordered'";
                    SqlDataReader dr = objcls.fn_reader(query); // Execute query

                    List<(int orderId, int productId, int quantity)> orders = new List<(int, int, int)>(); // List to store order details

                    // Read order_id, product_id, and quantity
                    while (dr.Read())
                    {
                        orders.Add((
                            Convert.ToInt32(dr["order_id"]),
                            Convert.ToInt32(dr["product_id"]),
                            Convert.ToInt32(dr["product_quantity"])
                        ));
                    }

                    // Close the reader
                    dr.Close();

                    int updatedCount = 0; // Track updated orders count

                    foreach (var order in orders)
                    {
                        // Update order status to 'payed'
                        string updateOrderQuery = "UPDATE [order] SET order_status = 'payed' WHERE order_id = " + order.orderId + " AND user_id = " + Session["reg_id"];
                        int rowsAffected = objcls.fn_nonquery(updateOrderQuery);

                        if (rowsAffected > 0)
                        {
                            updatedCount++; // Increment count if successfully updated

                            // Decrease stock in product_table
                            string updateStockQuery = "UPDATE product_table SET stock = stock - " + order.quantity +" WHERE product_id = " + order.productId;
                            objcls.fn_nonquery(updateStockQuery); // Execute stock update query
                        }
                    }

                    // Display success or failure message
                    if (updatedCount > 0)
                    {
                        Label25.Text = "Order status updated to 'payed' for " + updatedCount + " orders.";
                    }
                    else
                    {
                        Label25.Text = "No orders were updated.";
                    }
                }
                else
                {
                    Label22.Text += " Balance update failed."; // Balance update failure
                }
            }
            catch (Exception ex)
            {
                Label22.Text = "Error: " + ex.Message; // Handle exceptions
            }

        }
    }
}