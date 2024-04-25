using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class missingcourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                int student_id = (int)Session["student_id"];

                using (SqlCommand missing_courses = new SqlCommand("Procedures_ViewMS", conn))
                {
                    missing_courses.CommandType = CommandType.StoredProcedure;
                    missing_courses.Parameters.Add(new SqlParameter("@StudentID", student_id));

                    conn.Open();
                    SqlDataReader rdr = missing_courses.ExecuteReader(CommandBehavior.CloseConnection);
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
                        label.Text = "there is no missig courses ";
                        form1.Controls.Add(label);
                    }
                    
                }
            }
            catch (FormatException ex)
            {
               
                Label2.Text = "Format error: " + ex.Message;
            }
            catch (NullReferenceException ex)
            {
                
                Label2.Text = "Null reference error: " + ex.Message;
            }
         
        }
    }
}
