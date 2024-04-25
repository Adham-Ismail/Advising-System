using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = System.Web.UI.WebControls.Label;
namespace AdvisingSystemWebsite
{
    public partial class Required_courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                String current_semester_code = TextBox1.Text;

                int student_id = (int)Session["student_id"];

                using (SqlCommand optional_courses = new SqlCommand("Procedures_ViewRequiredCourses", conn))
                {
                    optional_courses.CommandType = CommandType.StoredProcedure;
                    optional_courses.Parameters.Add(new SqlParameter("@StudentID", student_id));
                    optional_courses.Parameters.Add(new SqlParameter("@current_semester_code", current_semester_code));
                    conn.Open();
                    SqlDataReader rdr = optional_courses.ExecuteReader(CommandBehavior.CloseConnection);
                    if (rdr.Read())
                    {
                        while (rdr.Read())
                        {
                            String courseName = rdr.GetString(rdr.GetOrdinal("name"));
                            int course_id = rdr.GetInt32(rdr.GetOrdinal("course_id"));

                            Label label = new Label();
                            label.Text = $"Course ID: {course_id}, Name: {courseName}";
                            form1.Controls.Add(label);
                            form1.Controls.Add(new LiteralControl("<br />"));
                        }
                    }
                    else
                    {
                        Label label = new Label();
                        label.Text = "there is no required courses ";
                        form1.Controls.Add(label);
                    }
                }
            }
            catch (FormatException ex)
            {

                Label2.Text = "error";
            }

        }

    }
}
