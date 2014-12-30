using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationEmail
{
    public partial class login : System.Web.UI.Page
    {
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

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
            txtLogin.Text = string.Empty; txtPass.Text = string.Empty;  
        }

        
      
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                
                conn.Open();
                if (txtLogin.Text != "" && txtPass.Text != ""  )
                {
                   // ShowMessage("aaa!"); iki cia veikia
                        MySqlCommand cmd = new MySqlCommand("SELECT COUNT(id) FROM users WHERE login = @login AND pass = @pass ", conn);
                        cmd.Parameters.AddWithValue("@login", txtLogin.Text);
                        cmd.Parameters.AddWithValue("@pass", txtPass.Text);
                        //int result = cmd.ExecuteScalar();
                        //int result = (int)cmd.ExecuteScalar();
                        int num = Convert.ToInt32(cmd.ExecuteScalar());
                        if (num == 1)
                        {
                            // log in
                            Session["login"] = txtLogin.Text;
                            ShowMessage("Logged in!");
                            Response.Redirect("index.aspx");
                        }

                     

                        cmd.Dispose();
                      
                        //  SendMail();
                       // clear();
                   
                    
                }
                else
                {
                    ShowMessage("You have to fill all blanks!");
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
        
 




    }
}