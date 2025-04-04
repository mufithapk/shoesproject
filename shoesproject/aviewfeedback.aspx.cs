using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Text;

namespace shoesproject
{
    public partial class aviewfeedback : System.Web.UI.Page
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



            string s = "select feedback_id,user_id,feedback_message from feedback ";
            DataTable da = objcls.fn_datatable(s);
            GridView1.DataSource = da;
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {    int feedbackId = Convert.ToInt32(GridView1.DataKeys[e.NewSelectedIndex].Values["feedback_id"]);
            int userId = Convert.ToInt32(GridView1.DataKeys[e.NewSelectedIndex].Values["user_id"]);
            

           
            HiddenField1.Value = feedbackId.ToString();
            if (Session["reg_id"] != null)
            {
                int reg = Convert.ToInt32(Session["reg_id"]);
                string q = "SELECT email FROM adminreg WHERE admin_id=" + Session["reg_id"] + "";
                DataTable dt = objcls.fn_datatable(q);

                if (dt.Rows.Count > 0)
                {

                    Label4.Text = dt.Rows[0]["email"].ToString(); 
                }
            }
            
            string query = "SELECT email FROM userreg WHERE user_id = " + userId;
            DataTable db = objcls.fn_datatable(query);

            if (db.Rows.Count > 0)
            {
                
                Label5.Text = db.Rows[0]["email"].ToString(); 
            }

            
            Panel1.Visible = true;
        }

       

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            string replyMessage = TextBox1.Text.Trim();

            int feedbackId = Convert.ToInt32(HiddenField1.Value);

            
            string updateQuery = "UPDATE feedback SET reply_message = '" + replyMessage + "' WHERE feedback_id = " + feedbackId;
            objcls.fn_nonquery(updateQuery); 

            
            SendEmail2("mufitha", "mufithak3@gmail.com", "scza hyoi qilg yayj", "user", Label4.Text, "Feedback Reply", replyMessage);

            
            Label6.Text = "Reply sent successfully!";

        }


         public static void SendEmail2(string yourName, string yourGmailUserName, string yourGmailPassword, string toName, string toEmail, string subject, string body)
        {
            try
            {
                MailMessage message = new MailMessage();
                message.From = new MailAddress(yourGmailUserName, yourName);
                message.To.Add(new MailAddress(toEmail, toName));
                message.Subject = subject;
                message.Body = body;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
                {
                    EnableSsl = true,
                    UseDefaultCredentials = false, // Fix: Do not use default credentials
                    Credentials = new System.Net.NetworkCredential(yourGmailUserName, yourGmailPassword)
                };

                client.Send(message);
            }
            catch (Exception ex)
            {
                // Log the error instead of throwing it
                System.Diagnostics.Debug.WriteLine("Email Error: " + ex.Message);
            }
        }
    }   }