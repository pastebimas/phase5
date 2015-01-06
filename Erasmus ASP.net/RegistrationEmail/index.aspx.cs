using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationEmail
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btnHelloWorld_Click(object sender, EventArgs e)
        {
           // lblHelloWorld.Text = search.Text + " The time right now is: " + DateTime.Now.ToLongTimeString();
          
            DataTable table = new DataTable();

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string where = " AND go_from LIKE '%" + search_go_from.Text + "%' AND go_to LIKE '%" + search_go_to.Text + "%'";
            string sqlstring = " SELECT * FROM routes WHERE 1=1  "+ where;
           // preview.InnerHtml = sqlstring;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                using (MySqlCommand cmd = new MySqlCommand(sqlstring))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                       // cmd.Parameters.AddWithValue("@useris", Session["login"]);
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                          //  ./string from = dt.Rows[0]["go_from"].ToString;
                         //   ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('"+sda+"');", true);
                          //  ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('" + sda['id'] + "');", true);   
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            table = dt;
                        } 
                    }
                }
            }

            try
            {
                MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
      
                conn.Open();


                string finish = "http://skyvoco.com/stop.png";
                 string startas = "http://skyvoco.com/sportscar.png";

                
                MySqlCommand cmd = new MySqlCommand(sqlstring, conn);
                 
                MySqlDataReader print = cmd.ExecuteReader();
                int i = 1;
                while (print.Read())
                {
                   // lblJavaScript.Text = sqlstring;
                   // ScriptManager.RegisterStartupScript(this, GetType(), "alert"+i, "alert('" + print["go_from"] + "');", true);
                   //    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "disp_confirm();", true);
                   //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('" + print["go_to"] + "');", true);
                    ScriptManager.RegisterStartupScript(this, GetType(), "codeAddress3" + i, "deleteMarkers();", true);
                    
                    ScriptManager.RegisterStartupScript(this, GetType(), "codeAddress" + i, "codeAddress('" + print["go_from"].ToString() + "', " + i + ", '" + startas + "' );", true);
                    
                     ScriptManager.RegisterStartupScript(this, GetType(), "codeAddress2" + i, "codeAddress('" + print["go_to"].ToString() + "', " + i + ", '" + finish + "' );", true);
                   
                    i++;
                }
                   
                
            }
            catch (Exception ex)
            {
                Literal1.Text = ex.ToString();
            }
         
        }
         
       
        protected string GetMarkers()
        {
            string markers = "";
            int i = 1;
            // 54.9247592,   23.9601946
             markers +=
             @"var marker" + i.ToString() + @" = new google.maps.Marker({
             position: new google.maps.LatLng(54.9247592, 23.9601946)," +
              @"map: map,
              title:'Pavadinimas'});";
          
            return markers;
        }
    }
}