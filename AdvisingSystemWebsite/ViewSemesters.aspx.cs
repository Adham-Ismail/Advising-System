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
	public partial class ViewSemesters : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			String connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
			SqlConnection conn = new SqlConnection(connStr);
			SqlCommand viewsemester = new SqlCommand("SELECT * FROM Semster_offered_Courses", conn);

			viewsemester.CommandType = CommandType.Text;

			conn.Open();
			DataTable data = new DataTable();
			data.Load(viewsemester.ExecuteReader());
			GridView1.DataSource = data;
			GridView1.DataBind();
			conn.Close();
		}
	}
}