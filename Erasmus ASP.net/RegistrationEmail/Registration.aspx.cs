using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
//Using namespaces 
using MySql.Data.MySqlClient; 
using System.Configuration;
using System.Text;
using System.Net;
using System.Net.Mail;

namespace RegistrationEmail
{
    public partial class Registration : System.Web.UI.Page
    {
          
        #region MySqlConnection Connection
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    btnSubmit.Attributes.Add("onclick", "javascript:return validationCheck()");                    
                }
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message);
            }
        }
        /// <summary>
        /// This function is used for show message.
        /// </summary>
        /// <param name="msg"></param>
        void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
        }
        /// <summary>
        /// This Function is used TextBox Empty.
        /// </summary>
        void clear()
        {
            txtFirstName.Text = string.Empty; txtFirstName.Text = string.Empty; txtEmailID.Text = string.Empty; 
            txtFirstName.Focus();
        }

        #region This code user to Email Sending Server.MapPath "Event.html" mailbody.Replace using html email templates
        private void SendMail()
        {           
            string filename = Server.MapPath("~/Event.html");
            string mailbody = System.IO.File.ReadAllText(filename);
            mailbody = mailbody.Replace("##NAME##", txtFirstName.Text);
            mailbody = mailbody.Replace("##FirstName##", txtFirstName.Text);
            
            string to = txtEmailID.Text;
            string from = "info@pastebimas.lt";
            MailMessage message = new MailMessage(from, to);
            message.Subject = "Auto Response Email";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            System.Net.NetworkCredential basicCredential = new System.Net.NetworkCredential("indreberno@gmail.com", "mamatetisbrolisas");
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            client.Credentials = basicCredential;
            try
            {
                client.Send(message);
                ShowMessage("Email Sending successfully...!");                
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message);
            }
        }
        #endregion

        #region This Code used to Insert data and Send Email 
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                if (txtFirstName.Text != "" && txtPass.Text != "" && txtEmailID.Text != "")
                {
                    if (txtPass.Text == txtPass2.Text)
                    {
                        MySqlCommand cmd = new MySqlCommand("INSERT INTO users (login,pass,email) values (@login,@pass,@email)", conn);
                        cmd.Parameters.AddWithValue("@login", txtFirstName.Text);
                        cmd.Parameters.AddWithValue("@pass", txtPass.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmailID.Text);

                        cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        ShowMessage("Registered successfully......!");
                        //  SendMail();
                        clear();
                    }
                    else
                    {
                        ShowMessage("Password do not match!");
                    }
                    
                }
                else
                {
                   // ShowMessage("You have to fill all blanks!");
                }
               
            }
            catch (MySqlException ex)
            {
                ShowMessage(ex.Message);
            }
            finally
            {
                conn.Close();
            }

        }
        #endregion

        public void getSession(string key)
        {
            if (HttpContext.Current.Session[key] != null)
            {
                string sessionID = HttpContext.Current.Session[key].ToString();
            }
        }


        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {

        }




    }
}