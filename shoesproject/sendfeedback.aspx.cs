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
    public partial class sendfeedback : System.Web.UI.Page
    {
        connectionclass objcls = new connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["reg_id"] != null)
            {
                int reg = Convert.ToInt32(Session["reg_id"]);
                string feedbackMessage = TextBox1.Text.Trim();

                if (!string.IsNullOrEmpty(feedbackMessage))
                {
                    // **DANGEROUS: Directly concatenating user input into SQL query (SQL Injection Risk!)**
                    string query = "INSERT INTO feedback (user_id, feedback_message, reply_message, feedback_status) " +
                                   "VALUES ('" + reg + "', '" + feedbackMessage.Replace("'", "''") + "', NULL, 'active')";

                    int i = objcls.fn_nonquery(query);

                    if (i == 1)
                    {
                        Label2.Text = "Feedback submitted successfully!";
                    }
                    else
                    {
                        Label2.Text = "Failed to submit feedback. Please try again.";
                    }
                }
                else
                {
                    Label2.Text = "Please enter a feedback message.";
                }
            }
            else
            {
                Label2.Text = "User is not logged in.";
            }

        }
    }
}