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
    public partial class aviewpayedproducts : System.Web.UI.Page
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
            try
            {
                
                string query = @"
                   SELECT DISTINCT 
        dbo.product_table.product_name,
        dbo.product_table.product_price,
        dbo.[order].order_status,
        dbo.[order].product_quantity,
        dbo.[order].order_id,
        dbo.[order].sub_total,
        
        
        dbo.bill.user_id
    FROM 
        dbo.[order]
    INNER JOIN 
        dbo.product_table ON dbo.[order].product_id = dbo.product_table.product_id
    INNER JOIN 
        dbo.bill ON dbo.[order].user_id = dbo.bill.user_id
    WHERE 
        dbo.[order].order_status = 'payed'";
                
                DataTable dt = objcls.fn_datatable(query);

                
                if (dt != null && dt.Rows.Count > 0)
                {
                    DataList1.DataSource = dt;
                    DataList1.DataBind();
                }
                else
                {
                    
                    Response.Write("<script>alert('No records found for status: payed');</script>");
                }
            }
            catch (Exception ex)
            {
               
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
               
                Button btn = (Button)sender;
                string orderId = btn.CommandArgument;

                
                string updateQuery = $"UPDATE dbo.[order] SET order_status = 'delivered' WHERE order_id = {orderId}";

                
                int result = objcls.fn_nonquery(updateQuery);

                if (result > 0)
                {
                    Response.Write("<script>alert('Order status updated to delivered successfully!');</script>");
                    Bind_Grid();
                }
                else
                {
                    Response.Write("<script>alert('Failed to update order status.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }
    }
}