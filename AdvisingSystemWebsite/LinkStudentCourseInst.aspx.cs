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
    public partial class LinkStudentCourseInst : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void StudInstCourse_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand LinkStInst = new SqlCommand("Procedures_AdminLinkStudent", conn);
            LinkStInst.CommandType = CommandType.StoredProcedure;

            String studentid1 = studentid.Text;
            String courseid1 = courseid.Text;
            String instructorid1 = instid.Text;
            String semcode1 = semcode.Text;

            if (string.IsNullOrEmpty(studentid1) || string.IsNullOrEmpty(courseid1) || string.IsNullOrEmpty(instructorid1) || string.IsNullOrEmpty(semcode1))
            {
                Response.Write("One of the inputs is null or empty");
            }
            else
            {
                int studentid2 = Int16.Parse(studentid.Text);
                int courseid2 = Int16.Parse(courseid.Text);
                int instructorid2 = Int16.Parse(instid.Text);

                LinkStInst.Parameters.Add(new SqlParameter("@studentID", studentid2));
                LinkStInst.Parameters.Add(new SqlParameter("@cours_id", courseid2));
                LinkStInst.Parameters.Add(new SqlParameter("@instructor_id", instructorid2));
                LinkStInst.Parameters.Add(new SqlParameter("@semester_code", semcode1));


                try
                {
                    conn.Open();
                    LinkStInst.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("Link added");
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