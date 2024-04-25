using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class chooseInstructor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void chooseInst_Click(object sender, EventArgs e)
        {
            string studentID = studentId.Text;
            string instructorID = instructorId.Text;
            string courseID = courseId.Text;
            string currentSemesterCode = curSemCode.Text;
            if(studentID == "" || instructorID == "" || courseID == "" || currentSemesterCode == "")
            {
                success.Text = "Please fill all the required fields";
                return;
            }

            string connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            //Create a Sql Connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand chooseInstructor = new SqlCommand("Procedures_Chooseinstructor", conn);
            chooseInstructor.CommandType = CommandType.StoredProcedure;

            chooseInstructor.Parameters.AddWithValue("@StudentID", studentID);
            chooseInstructor.Parameters.AddWithValue("@instrucorID", instructorID);
            chooseInstructor.Parameters.AddWithValue("@CourseID", courseID);
            chooseInstructor.Parameters.AddWithValue("@current_semester_code", currentSemesterCode);

            try
            {
                conn.Open();
                chooseInstructor.ExecuteNonQuery();
                conn.Close();
                success.Text = "You have chosen the instructor successfully";
            
            }
            catch (Exception ex)
            {
                success.Text = "An error occurred during registration, please try again later";
            }
        }
    }
}