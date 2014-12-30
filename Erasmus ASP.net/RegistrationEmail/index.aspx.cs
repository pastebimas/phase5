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
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            table = dt;
                        } 
                    }
                }
            }

            int i = 1;
            string markers =
             @"var marker" + i.ToString() + @" = new google.maps.Marker({
             position: new google.maps.LatLng(54.9247592, 23.9601946)," +
              @"map: map,
              title:'Pavadinimas'});";


            Literal1.Text = @"
     <script type='text/javascript'>
     function initialize() {
  
     var mapOptions = {
     center: new google.maps.LatLng(28.3213, 77.5435),
     zoom: 2,
     mapTypeId: google.maps.MapTypeId.ROADMAP
     };
 
     var myMap = new google.maps.Map(document.getElementById('map-canvas'),
     mapOptions);"
            + markers +
            @"}
     google.maps.event.addDomListener(window, 'load', initialize);

</script>";
         

            
            
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