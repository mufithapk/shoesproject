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
    public partial class uviewcart : System.Web.UI.Page
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
                Bind_Grid();

            }
        }
        public void Bind_Grid()
        {
            if (Session["reg_id"] != null)
            {
                int reg = Convert.ToInt32(Session["reg_id"]);


                string s = "select * from cart where user_id=" + Session["reg_id"] + "";
                DataSet da = objcls.fn_dataset(s);
                GridView1.DataSource = da;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Bind_Grid();

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            if (Session["product_id"] != null)
            {
                try
                {
                   
                    int productId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

                    
                    string str = "DELETE FROM cart WHERE product_id = " + productId + " and user_id = " + Session["reg_id"] + "";

                   
                    int result = objcls.fn_nonquery(str);

                    if (result > 0)
                    {
                        Label1.Text = "Deleted successfully!";
                    }
                    else
                    {
                        Label1.Text = "Delete failed!";
                    }

                    
                    Bind_Grid();
                }
                catch (Exception ex)
                {
                    Label1.Text = "Error: " + ex.Message;
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Bind_Grid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (Session["reg_id"] != null)
            {
                int reg = Convert.ToInt32(Session["reg_id"]);

                if (Session["product_id"] != null)
                {




                    try
                    {
                       
                        int productId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
                        Label1.Text = "Product ID: " + productId;

                        
                        TextBox txtQuantity = (TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0];
                        int quantity = Convert.ToInt32(txtQuantity.Text);

                       
                        string updateQuery = "UPDATE cart SET product_quantity = " + quantity + " WHERE product_id = " + productId+" and user_id = " + Session["reg_id"] + "";
                        Label1.Text = "Update Query: " + updateQuery;

                       
                        int result = objcls.fn_nonquery(updateQuery);
                        Label1.Text += "<br/>Rows Affected: " + result;

                       

                        string priceQuery = "SELECT product_price FROM product_table WHERE product_id = " + productId + "";
                        int price = Convert.ToInt32(objcls.fn_scalar(priceQuery));

                      
                        int totalPrice = quantity * price;

                        string updateSubtotalQuery = "UPDATE cart SET sub_total = " + totalPrice + " WHERE product_id = " + productId+ " and user_id = " + Session["reg_id"] + "";
                        Label1.Text += "<br/>Subtotal Query: " + updateSubtotalQuery;

                        int res = objcls.fn_nonquery(updateSubtotalQuery);

                        if (res == 1)
                        {
                            Label1.Text = "Updated succesfully!";
                        }
                        else
                        {
                            Label1.Text = " update failed!";
                        }


                        // Reload Grid
                        GridView1.EditIndex = -1;
                        Bind_Grid();
                    }
                    catch (Exception ex)
                    {
                        Label1.Text = "Error: " + ex.Message;
                    }
                }
            }
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["reg_id"] != null)
                {
                    int reg = Convert.ToInt32(Session["reg_id"]);

                    // Fetch all items in the user's cart
                    string query = "SELECT * FROM cart WHERE user_id = " + reg;
                    SqlDataReader dr = objcls.fn_reader(query);

                    List<(int productId, int quantity, decimal subtotal)> cartItems = new List<(int, int, decimal)>();

                    while (dr.Read())
                    {
                        // Fetch raw data from cart
                        string productIdString = dr["product_id"].ToString();
                        string quantityString = dr["product_quantity"].ToString();
                        string subtotalString = dr["sub_total"].ToString();

                        // Debug output to verify data being fetched
                        Label1.Text += $"<br/>product_id: {productIdString}, product_quantity: {quantityString}, sub_total: {subtotalString}";

                        // Clean subtotal value (remove $ and commas)
                        subtotalString = subtotalString.Replace("$", "").Replace(",", "");

                        // Validate and safely parse data
                        if (!string.IsNullOrEmpty(productIdString) &&
                            !string.IsNullOrEmpty(quantityString) &&
                            !string.IsNullOrEmpty(subtotalString) &&
                            int.TryParse(productIdString, out int productId) &&
                            int.TryParse(quantityString, out int quantity) &&
                            decimal.TryParse(subtotalString, out decimal subtotal))
                        {
                            cartItems.Add((productId, quantity, subtotal));
                        }
                        else
                        {
                            // If invalid data is found, show message and close reader
                            Label1.Text += "<br/>Invalid data in cart.";
                            dr.Close();
                            return;
                        }
                    }

                    dr.Close(); // Close reader before performing insert operations

                    // Loop through each cart item and place the order
                    foreach (var item in cartItems)
                    {
                        // Insert order data into [order] table
                        string insertOrder = "INSERT INTO [order] (product_id, user_id, product_quantity, sub_total, date, order_status) " +
                                             "VALUES (" + item.productId + ", " + reg + ", " + item.quantity + ", " + item.subtotal + ", GETDATE(), 'ordered')";
                        int orderResult = objcls.fn_nonquery(insertOrder);

                        if (orderResult <= 0)
                        {
                            Label1.Text = "Failed to place order for product ID: " + item.productId;
                            return;
                        }
                    }

                    // Clear the cart after placing the order
                    string deleteCart = "DELETE FROM cart WHERE user_id = " + reg;
                    int deleteResult = objcls.fn_nonquery(deleteCart);

                    if (deleteResult > 0)
                    {
                        // Insert into bill table after clearing the cart
                        string insertBill = "INSERT INTO bill (user_id, grand_total, date) " +
                                            "VALUES (" + reg + ", (SELECT SUM(sub_total) FROM [order] WHERE user_id = " + reg + " and order_status='ordered'), GETDATE())";
                        int billResult = objcls.fn_nonquery(insertBill);

                        if (billResult > 0)
                        {
                            Label1.Text = "Order placed successfully, cart cleared, and bill generated!";
                            
                        }
                        else
                        {
                            Label1.Text = "Order placed and cart cleared, but bill generation failed. Please check the SQL query.";
                        }
                        Response.Redirect("bill.aspx");
                    }
                    else
                    {
                        Label1.Text = "Order placed, but cart was not cleared.";
                    }
                }
                else
                {
                    Label1.Text = "Session expired. Please log in again.";
                }
            }
            catch (Exception ex)
            {
                // Handle any errors and log exception if necessary
                Label1.Text = "Error: " + ex.Message;
            }
           
        }
    }

    
}