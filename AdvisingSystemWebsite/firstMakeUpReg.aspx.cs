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
    public partial class firstMakeUpReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FirstRegBut_Click(object sender, EventArgs e)
        {
            if (FirstStudentId.Text == "" || FirstCourseId.Text == "" || FirstStudentCurSem.Text == "")
            {
                response.Text = "Please fill all the fields to be able to register";
                return;
            }

            string connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            //Create a sql connection
            SqlConnection conn = new SqlConnection(connStr);

            string stdId = FirstStudentId.Text;
            string crseId = FirstCourseId.Text;
            string stdCurSem = FirstStudentCurSem.Text;

            SqlCommand firstReg = new SqlCommand("Procedures_StudentRegisterFirstMakeup", conn);
            firstReg.CommandType = CommandType.StoredProcedure;
            firstReg.Parameters.Add(new SqlParameter("@StudentID", stdId));
            firstReg.Parameters.Add(new SqlParameter("@CourseID", crseId));
            firstReg.Parameters.Add(new SqlParameter("@studentCurr_sem", stdCurSem));

            
            try {
                conn.Open();
                firstReg.ExecuteNonQuery();
                conn.Close();
                response.Text = "You have successfully registered for a first makeup";
            }
            catch(Exception ex) {
                response.Text = "An error occurred during registration, please try again later or contact the examinations centre";
            }
            
        }
    }
}