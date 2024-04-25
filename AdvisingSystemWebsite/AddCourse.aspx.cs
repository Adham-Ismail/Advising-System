using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.InteropServices.ComTypes;

namespace AdvisingSystemWebsite
{
    public partial class AddCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Course_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand CourseAdd = new SqlCommand("Procedures_AdminAddingCourse", conn);
            CourseAdd.CommandType = CommandType.StoredProcedure;

            String major1 = major.Text;
            String sem = semester.Text;
            String name1 = name.Text;
            String hours = credit.Text;
            String offered1 = offered.Text;




            if (string.IsNullOrEmpty(major1) || string.IsNullOrEmpty(sem) || string.IsNullOrEmpty(name1) || string.IsNullOrEmpty(hours) || string.IsNullOrEmpty(offered1))
            {
                Response.Write("One of the inputs is null or empty");
            }
            else
            {
                int sem1 = Int16.Parse(semester.Text);
                int hours1 = Int16.Parse(credit.Text);
                int offered2 = Int16.Parse(offered.Text);
                CourseAdd.Parameters.Add(new SqlParameter("@major", major1));
                CourseAdd.Parameters.Add(new SqlParameter("@semester", sem1));
                CourseAdd.Parameters.Add(new SqlParameter("@credit_hours", hours1));
                CourseAdd.Parameters.Add(new SqlParameter("@name", name1));
                CourseAdd.Parameters.Add(new SqlParameter("@is_offered", offered2));

                try
                {
                    conn.Open();
                    CourseAdd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("Course added");
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
