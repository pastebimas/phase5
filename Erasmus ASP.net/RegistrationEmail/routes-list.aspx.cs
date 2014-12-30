using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationEmail
{
    public partial class routes_list1 : System.Web.UI.Page
    {
        string _connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                BindData();

            }

        }



        protected void SortRecords(object sender, GridViewSortEventArgs e)
        {

            string sortExpression = e.SortExpression;

            string direction = string.Empty;

            if (SortDirection == SortDirection.Ascending)
            {

                SortDirection = SortDirection.Descending;

                direction = " DESC";

            }

            else
            {

                SortDirection = SortDirection.Ascending;

                direction = " ASC";

            }

            DataTable table = this.GetData();

            table.DefaultView.Sort = sortExpression + direction;

            GridView1.DataSource = table;

            GridView1.DataBind();

        }



        private void BindData()
        {

            // specify the data source for the GridView

            GridView1.DataSource = this.GetData();

            // bind the data now

            GridView1.DataBind();

        }



        /// <summary>

        /// Gets or sets the grid view sort direction.

        /// </summary>

        /// <value>

        /// The grid view sort direction.

        /// </value>

        public SortDirection SortDirection
        {

            get
            {

                if (ViewState["SortDirection"] == null)
                {

                    ViewState["SortDirection"] = SortDirection.Ascending;

                }

                return (SortDirection)ViewState["SortDirection"];

            }

            set
            {

                ViewState["SortDirection"] = value;

            }

        }

        protected void btmDisplay_Click(object sender, EventArgs e)
        {
            string data = "";
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkCtrl") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string storid = row.Cells[1].Text;
                        string storname = row.Cells[2].Text;
                        string state = row.Cells[3].Text;
                        data = data + storid + " ,  " + storname + " , " + state + "<br>";
                    }
                }
            }
            lblmsg.Text = data;
        }

        private DataTable GetData()
        {

            DataTable table = new DataTable();

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM routes "))
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

            return table;

        }
    }
}