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
    public partial class secondMakeUpReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SecondRegBut_Click(object sender, EventArgs e)
        {
            if(SecondStudentId.Text == "" || SecondCourseId.Text == "" || SecondStudentCurSem.Text == "")
            {
                response.Text = "Please fill all the fields to be able to register";
                return;
            }
            string connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            //Create a SQL Connection
            SqlConnection conn = new SqlConnection(connStr);
            
            string stdId = SecondStudentId.Text;
            string crseId = SecondCourseId.Text;
            string stdCurSem = SecondStudentCurSem.Text;
            SqlCommand secondRegCheck = new SqlCommand("FN_StudentCheckSMEligibility", conn);
            secondRegCheck.CommandType = CommandType.StoredProcedure;
            secondRegCheck.Parameters.Add(new SqlParameter("@CourseID", crseId));
            secondRegCheck.Parameters.Add(new SqlParameter("@StudentID", stdId));

            SqlCommand secondReg = new SqlCommand("Procedures_StudentRegisterSecondMakeup", conn);
            secondReg.CommandType = CommandType.StoredProcedure;
            secondReg.Parameters.Add(new SqlParameter("@StudentID", stdId));
            secondReg.Parameters.Add(new SqlParameter("@CourseID", crseId));
            secondReg.Parameters.Add(new SqlParameter("@studentCurr_sem", stdCurSem));

            conn.Open();
            int eligible = secondRegCheck.ExecuteNonQuery();
            conn.Close();

            if (eligible == 0)
            {
                response.Text = "You are not eligible for the second makeup";
            }
            else
            {
                //Not working properly
                //The registration is not successfull
                try {
                    conn.Open();
                    secondReg.ExecuteNonQuery();
                    conn.Close();
                    response.Text = "You have successfully registered for a second makeup";
                }
                catch
                {
                    response.Text = "An error occurred, please try again later or contact the examinations centre";

                }

            }
        }
    }
}