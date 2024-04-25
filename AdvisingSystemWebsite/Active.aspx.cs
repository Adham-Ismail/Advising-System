using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class Active : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand act = new SqlCommand("Select * FROM view_Students", conn);

            act.CommandType = System.Data.CommandType.Text;

            conn.Open();
            DataTable data = new DataTable();
            data.Load(act.ExecuteReader());

            GridView1.DataSource = data;
            GridView1.DataBind();
            conn.Close();
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Students.aspx");
        }
    }
}