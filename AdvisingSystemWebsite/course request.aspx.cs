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
    public partial class course_request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void send(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int student_id = (int)Session["student_id"];
            string courseID = TextBox1.Text;
            string type = TextBox2.Text;
            string comment = TextBox3.Text;


            using (SqlCommand send_course_req = new SqlCommand("Procedures_StudentSendingCourseRequest", conn))
            {
                send_course_req.CommandType = CommandType.StoredProcedure;

                send_course_req.Parameters.Add(new SqlParameter("@courseID", courseID));
                send_course_req.Parameters.Add(new SqlParameter("@type", type));
                send_course_req.Parameters.Add(new SqlParameter("@comment", comment));
                send_course_req.Parameters.Add(new SqlParameter("@StudentID", student_id));



                conn.Open();
                send_course_req.ExecuteNonQuery();
                conn.Close();

                Label label = new Label();
                label.Text = "Request sent";
           


            }
        }
    }
}