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
    public partial class AddSemester : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add_Semester(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand SemesterAdd = new SqlCommand("AdminAddingSemester", conn);
            SemesterAdd.CommandType = CommandType.StoredProcedure;

            String startdate = start.Text;
            String enddate = end.Text;
            String codesem = code.Text;

            if (string.IsNullOrEmpty(startdate) || string.IsNullOrEmpty(enddate) || string.IsNullOrEmpty(codesem))
            {
                Response.Write("One of the inputs is null or empty");
            }
            else
            {
                // Add parameters to the command
                SemesterAdd.Parameters.Add(new SqlParameter("@start_date", startdate));
                SemesterAdd.Parameters.Add(new SqlParameter("@end_date", enddate));
                SemesterAdd.Parameters.Add(new SqlParameter("@semester_code", codesem));

                try
                {
                    conn.Open();
                    SemesterAdd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("Semester added");
                }
                catch (SqlException ex)
                {
                    // Handle specific SQL exceptions
                    Response.Write("Error: " + ex.Message);
                }
            }

        }
    }
}