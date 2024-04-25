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
    public partial class availablecourses : System.Web.UI.Page
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

                
                string query = "SELECT name, course_id FROM FN_SemsterAvailableCourses(@current_semester_code)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.Add(new SqlParameter("@current_semester_code", current_semester_code));
                    conn.Open();
                    SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

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
                        label.Text = "there is no available courses ";
                        form1.Controls.Add(label);
                    }
                }
            }
            catch (SqlException ex)
            {
               
                Label2.Text = "SQL error: " + ex.Message;
            }
            catch (Exception ex)
            {
                
                Label2.Text = "An error occurred: " + ex.Message;
            }
        }

    }
}