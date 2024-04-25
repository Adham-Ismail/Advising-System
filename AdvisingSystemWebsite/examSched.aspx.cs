using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics.Eventing.Reader;

namespace AdvisingSystemWebsite
{
    public partial class examSched : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            //Create a Sql Connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand examSched = new SqlCommand("SELECT * FROM Courses_MakeupExams", conn);
            examSched.CommandType = CommandType.Text;
            try
            {
                conn.Open();
                DataTable data = new DataTable();
                data.Load(examSched.ExecuteReader());
                examSchedule.DataSource = data;
                examSchedule.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                success.Text = ex.Message;
            }
        }
    }
}