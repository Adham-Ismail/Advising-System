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
	public partial class Semesters : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Fetch_Click(object sender, EventArgs e)
		{
			String connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
			SqlConnection conn = new SqlConnection(connStr);
			SqlCommand act = new SqlCommand("Select * FROM Semster_offered_Courses", conn);

			act.CommandType = System.Data.CommandType.Text;

			conn.Open();
			DataTable dt = new DataTable();
			dt.Load(act.ExecuteReader());
			GridView1.DataSource = dt;
			GridView1.DataBind();
			conn.Close();
		}

		protected void back_Click(object sender, EventArgs e)
		{
			Response.Redirect("Home.aspx");
		}
	}
}