using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using AdvisingSystemWebsite;

namespace AdvisingSystemWebsite
{
    public partial class LinkInstructorCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkInstructor_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand LinkInst = new SqlCommand("Procedures_AdminLinkInstructor", conn);
            LinkInst.CommandType = CommandType.StoredProcedure;

            String courseId = course.Text;
            String InstructorId = instructor.Text;
            String SlotId = slot.Text;

            if (string.IsNullOrEmpty(courseId) || string.IsNullOrEmpty(InstructorId) || string.IsNullOrEmpty(SlotId))
            {
                Response.Write("One of the inputs is null or empty");
            }
            else
            {

                LinkInst.Parameters.Add(new SqlParameter("@cours_id", courseId));
                LinkInst.Parameters.Add(new SqlParameter("@instructor_id", InstructorId));
                LinkInst.Parameters.Add(new SqlParameter("@slot_id", SlotId));


                try
                {
                    conn.Open();
                    LinkInst.ExecuteNonQuery();
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