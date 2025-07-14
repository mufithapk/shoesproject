using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace shoesproject
{
    public partial class bill : System.Web.UI.Page
    {
        connectionclass objcls = new connectionclass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["reg_id"] != null)
            {
                int reg = Convert.ToInt32(Session["reg_id"]);

                SetBillIdForUser(reg);

                string sel = "SELECT name, email, address, place FROM userreg WHERE user_id = " + reg;
                SqlDataReader dr = objcls.fn_reader(sel);
                while (dr.Read())
                {
                    Label2.Text = dr["name"].ToString();
                    Label4.Text = dr["email"].ToString();
                    Label6.Text = dr["address"].ToString();
                    Label8.Text = dr["place"].ToString();
                }
                dr.Close();

                string g = "SELECT grand_total FROM bill WHERE bill_id = " + Session["bill_id"];
                SqlDataReader da = objcls.fn_reader(g);
                while (da.Read())
                {
                    Label14.Text = da["grand_total"].ToString();
                }
                da.Close();

                Bind_Grid();
            }
        }

        private void SetBillIdForUser(int userId)
        {
            if (Session["bill_id"] == null)
            {
                string query = "SELECT TOP 1 bill_id FROM bill WHERE user_id = " + userId + " ORDER BY bill_id DESC";
                SqlDataReader dr = objcls.fn_reader(query);
                if (dr.Read())
                {
                    Session["bill_id"] = dr["bill_id"];
                }
                dr.Close();
            }
        }

        public void Bind_Grid()
        {
            string s = @"SELECT [order].order_id, product_table.product_id, product_table.product_name, 
                                [order].product_quantity, product_table.product_price, [order].sub_total 
                         FROM product_table 
                         INNER JOIN [order] ON product_table.product_id = [order].product_id 
                         WHERE [order].user_id = " + Session["reg_id"] + " AND [order].order_status = 'ordered'";
            DataTable da = objcls.fn_datatable(s);
            GridView1.DataSource = da;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveItem")
            {
                try
                {
                    string[] args = e.CommandArgument.ToString().Split('|');
                    int orderId = Convert.ToInt32(args[0]);
                    int productId = Convert.ToInt32(args[1]);
                    int userId = Convert.ToInt32(Session["reg_id"]);
                    int billId = Convert.ToInt32(Session["bill_id"]);

                    string connectionString = @"server=MUFITHA-LAP\SQLEXPRESS05;database=shoes;Integrated Security=true";

                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();

                        string deleteQuery = @"DELETE FROM [order] 
                                               WHERE order_id = @oid 
                                               AND product_id = @pid 
                                               AND user_id = @uid 
                                               AND order_status = 'ordered'";

                        using (SqlCommand deleteCmd = new SqlCommand(deleteQuery, conn))
                        {
                            deleteCmd.Parameters.AddWithValue("@oid", orderId);
                            deleteCmd.Parameters.AddWithValue("@pid", productId);
                            deleteCmd.Parameters.AddWithValue("@uid", userId);

                            int rowsAffected = deleteCmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                Label25.Text = "Item removed successfully.";

                                string totalQuery = @"SELECT ISNULL(SUM(sub_total), 0) 
                                                      FROM [order] 
                                                      WHERE user_id = @uid AND order_status = 'ordered'";

                                using (SqlCommand totalCmd = new SqlCommand(totalQuery, conn))
                                {
                                    totalCmd.Parameters.AddWithValue("@uid", userId);
                                    decimal newTotal = Convert.ToDecimal(totalCmd.ExecuteScalar());

                                    string updateBillQuery = @"UPDATE bill 
                                                               SET grand_total = @gtotal 
                                                               WHERE bill_id = @billId AND user_id = @uid";

                                    using (SqlCommand updateCmd = new SqlCommand(updateBillQuery, conn))
                                    {
                                        updateCmd.Parameters.AddWithValue("@gtotal", newTotal);
                                        updateCmd.Parameters.AddWithValue("@billId", billId);
                                        updateCmd.Parameters.AddWithValue("@uid", userId);
                                        updateCmd.ExecuteNonQuery();
                                    }

                                    Label14.Text = newTotal.ToString();
                                }
                            }
                            else
                            {
                                Label25.Text = "Item could not be removed.";
                            }
                        }
                    }

                    Bind_Grid();
                }
                catch (Exception ex)
                {
                    Label25.Text = "Error: " + ex.Message + "<br/>" + ex.StackTrace;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["reg_id"] == null) return;

                int reg = Convert.ToInt32(Session["reg_id"]);

                if (!decimal.TryParse(TextBox2.Text, out decimal balance))
                {
                    Label20.Text = "Invalid balance amount.";
                    return;
                }

                string query = "INSERT INTO bank (account_no, user_id, account_type, balance_amount, date) " +
                               "VALUES (@acc, @uid, @type, @bal, GETDATE())";

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@acc", TextBox4.Text);
                    cmd.Parameters.AddWithValue("@uid", reg);
                    cmd.Parameters.AddWithValue("@type", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@bal", balance);

                    conn.Open();
                    int i = cmd.ExecuteNonQuery();
                    Label20.Text = (i == 1) ? "Successfully inserted" : "Insertion failed";
                }

                Panel2.Visible = true;
            }
            catch (Exception ex)
            {
                Label20.Text = "Error: " + ex.Message;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                balcheck.ServiceClient obj = new balcheck.ServiceClient();
                string bal = obj.balcheck(TextBox3.Text);
                Label21.Text = bal;
            }
            catch (Exception ex)
            {
                Label21.Text = "Error: " + ex.Message;
            }
        }

        protected void Button4_Click1(object sender, EventArgs e)
        {
            try
            {
                Label22.Text = "Processing...";

                if (string.IsNullOrEmpty(TextBox3.Text))
                {
                    Label22.Text = "Account number is required!";
                    return;
                }

                balupdate.ServiceClient objl = new balupdate.ServiceClient();
                string balu = objl.balupdate(TextBox3.Text);
                Label22.Text = balu;

                if (balu == "Balance updated successfully.")
                {
                    string query = "SELECT order_id, product_id, product_quantity FROM [order] WHERE user_id = " + Session["reg_id"] + " AND order_status = 'ordered'";
                    SqlDataReader dr = objcls.fn_reader(query);

                    List<(int orderId, int productId, int quantity)> orders = new List<(int, int, int)>();
                    while (dr.Read())
                    {
                        orders.Add((Convert.ToInt32(dr["order_id"]), Convert.ToInt32(dr["product_id"]), Convert.ToInt32(dr["product_quantity"])));
                    }
                    dr.Close();

                    int updatedCount = 0;
                    foreach (var order in orders)
                    {
                        string updateOrderQuery = "UPDATE [order] SET order_status = 'payed' WHERE order_id = " + order.orderId + " AND user_id = " + Session["reg_id"];
                        int rowsAffected = objcls.fn_nonquery(updateOrderQuery);

                        if (rowsAffected > 0)
                        {
                            updatedCount++;
                            string updateStockQuery = "UPDATE product_table SET stock = stock - " + order.quantity + " WHERE product_id = " + order.productId;
                            objcls.fn_nonquery(updateStockQuery);
                        }
                    }

                    // ✅ Get and show updated balance from bank table using account_no and user_id
                    string balanceQuery = "SELECT TOP 1 balance_amount FROM bank WHERE account_no = @acc AND user_id = @uid ORDER BY date DESC";

                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
                    using (SqlCommand cmd = new SqlCommand(balanceQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@acc", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@uid", Convert.ToInt32(Session["reg_id"]));

                        conn.Open();
                        object result = cmd.ExecuteScalar();

                        if (result != null)
                        {
                            decimal balanceAmount = Convert.ToDecimal(result);
                            Label23.Text = "Updated Balance: ₹" + balanceAmount.ToString("N2");
                        }
                        else
                        {
                            Label23.Text = "Balance not found.";
                        }
                    }

                    Label25.Text = (updatedCount > 0) ? "Order status updated to 'payed' for " + updatedCount + " orders." : "No orders were updated.";
                }
                else
                {
                    Label22.Text += " Balance update failed.";
                }
            }
            catch (Exception ex)
            {
                Label22.Text = "Error: " + ex.Message;
            }
        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("WebForm1.aspx");
        }
    }
}
