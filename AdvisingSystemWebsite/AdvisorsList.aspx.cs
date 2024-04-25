using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Configuration;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class AdvisorsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand advisors = new SqlCommand("Procedures_AdminListAdvisors", conn);
            advisors.CommandType = CommandType.StoredProcedure;

            conn.Open();
            DataTable data = new DataTable();
            data.Load(advisors.ExecuteReader());
            GridView1.DataSource = data;
            GridView1.DataBind();
            conn.Close();
        }
    }
}