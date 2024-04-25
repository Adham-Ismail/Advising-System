using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace AdvisingSystemWebsite
{
    public partial class advisor_page : System.Web.UI.Page
    {

        private int advisorID;
        private SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["advisor_id"] != null)
            {
                String connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
                conn = new SqlConnection(connStr);
                advisorID = (int)Session["advisor_id"];
                // Use the advisorId here
            }
            else
            {
                Session["error_msg"] = "Please re-log in";
                Response.Redirect("login.aspx");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnViewAllAdvisingStudents_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Student Where advisor_id = @advisor_id", conn))
                {
                    cmd.Parameters.Add("@advisor_id", SqlDbType.Int).Value = advisorID;

                    conn.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(rdr);
                    Session["Data"] = dt;
                    conn.Close();
                }
                Response.Redirect("DisplayData.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred. Please try again while making sure all data entered is correct.");
            }
        }

        protected void btnCreateGP_Click(object sender, EventArgs e)
        {
            try
            {
                if (grad_plan_semester_code.Value == null || grad_plan_expected_graduation_date.Value == null || grad_plan_sem_credit_hours.Value == null || grad_plan_student_id.Value == null)
                {
                    Response.Write("Error: Some data is missing, please make sure to enter all required data.");
                    return;
                }

                using (SqlCommand cmd = new SqlCommand("Procedures_AdvisorCreateGP", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Semester_code", SqlDbType.VarChar).Value = grad_plan_semester_code.Value;
                    cmd.Parameters.Add("@expected_graduation_date", SqlDbType.Date).Value = grad_plan_expected_graduation_date.Value;
                    cmd.Parameters.Add("@sem_credit_hours", SqlDbType.Int).Value = grad_plan_sem_credit_hours.Value;
                    cmd.Parameters.Add("@advisor_id", SqlDbType.Int).Value = advisorID;
                    cmd.Parameters.Add("@student_id", SqlDbType.Int).Value = grad_plan_student_id.Value;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred. Please try again while making sure all data entered is correct.");
            }
        }

        protected void btnAddCourseGP_Click(object sender, EventArgs e)
        {
            try
            {
                if (insert_course_student_id.Value == null || insert_course_semester_code.Value == null || insert_course_course_name.Value == null)
                {
                    Response.Write("Error: Some data is missing, please make sure to enter all required data.");
                    return;
                }

                using (SqlCommand cmd = new SqlCommand("Procedures_AdvisorAddCourseGP", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@student_id", SqlDbType.Int).Value = insert_course_student_id.Value;
                    cmd.Parameters.Add("@Semester_code", SqlDbType.VarChar).Value = insert_course_semester_code.Value;
                    cmd.Parameters.Add("@course_name", SqlDbType.VarChar).Value = insert_course_course_name.Value;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred. Please try again while making sure all data entered is correct.");
            }
        }

        protected void btnUpdateGP_Click(object sender, EventArgs e)
        {
            try
            {
                if (update_grad_date_expected_graduation_date.Value == null || update_grad_date_student_id.Value == null)
                {
                    Response.Write("Error: Some data is missing, please make sure to enter all required data.");
                    return;
                }

                using (SqlCommand cmd = new SqlCommand("Procedures_AdvisorUpdateGP", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@expected_grad_date", SqlDbType.Date).Value = update_grad_date_expected_graduation_date.Value;
                    cmd.Parameters.Add("@studentID", SqlDbType.Int).Value = update_grad_date_student_id.Value;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred. Please try again while making sure all data entered is correct.");
            }
        }

        protected void btnDeleteFromGP_Click(object sender, EventArgs e)
        {
            try
            {
                if (delete_course_student_id.Value == null || delete_course_semester_code.Value == null || delete_course_course_id.Value == null)
                {
                    Response.Write("Error: Some data is missing, please make sure to enter all required data.");
                    return;
                }

                using (SqlCommand cmd = new SqlCommand("Procedures_AdvisorDeleteFromGP", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@studentID", SqlDbType.Int).Value = delete_course_student_id.Value;
                    cmd.Parameters.Add("@sem_code", SqlDbType.VarChar).Value = delete_course_semester_code.Value;
                    cmd.Parameters.Add("@courseID", SqlDbType.Int).Value = delete_course_course_id.Value;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred. Please try again while making sure all data entered is correct.");
            }
        }

        protected void btnViewRequests_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM FN_Advisors_Requests(@advisor_id)", conn))
                {
                    cmd.Parameters.Add("@advisor_id", SqlDbType.Int).Value = advisorID;

                    conn.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(rdr);
                    Session["Data"] = dt;
                    conn.Close();
                }
                Response.Redirect("DisplayData.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred. Please try again while making sure all data entered is correct.");
            }
        }

        protected void btnApproveRejectCHRequest_Click(object sender, EventArgs e)
        {
            try
            {
                if (approve_hours_request_id.Value == null || approve_hours_current_sem_code.Value == null)
                {
                    Response.Write("Error: Some data is missing, please make sure to enter all required data.");
                    return;
                }

                using (SqlCommand cmd = new SqlCommand("Procedures_AdvisorApproveRejectCHRequest", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@requestID", SqlDbType.Int).Value = approve_hours_request_id.Value;
                    cmd.Parameters.Add("@current_sem_code", SqlDbType.VarChar).Value = approve_hours_current_sem_code.Value;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred. Please try again while making sure all data entered is correct.");
            }
        }

        protected void btnViewAssignedStudents_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("Procedures_AdvisorViewAssignedStudents", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@AdvisorID", SqlDbType.Int).Value = advisorID;
                    cmd.Parameters.Add("@major", SqlDbType.VarChar).Value = view_by_major_major.Value;

                    conn.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(rdr);
                    Session["Data"] = dt;
                    conn.Close();
                }
                Response.Redirect("DisplayData.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred. Please try again while making sure all data entered is correct.");
            }
        }

        protected void btnApproveRejectCourseRequest_Click(object sender, EventArgs e)
        {
            try
            {
                if (approve_courses_request_id.Value == null || approve_courses_current_sem_code.Value == null)
                {
                    Response.Write("Error: Some data is missing, please make sure to enter all required data.");
                    return;
                }

                using (SqlCommand cmd = new SqlCommand("Procedures_AdvisorApproveRejectCourseRequest", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@requestID", SqlDbType.Int).Value = approve_courses_request_id.Value;
                    cmd.Parameters.Add("@current_sem_code", SqlDbType.VarChar).Value = approve_courses_current_sem_code.Value;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred. Please try again while making sure all data entered is correct.");
            }
        }

        protected void btnViewPendingRequests_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("Procedures_AdvisorViewPendingRequests", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Advisor_ID", SqlDbType.Int).Value = advisorID;

                    conn.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(rdr);
                    Session["Data"] = dt;
                    conn.Close();
                }
                Response.Redirect("DisplayData.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred. Please try again while making sure all data entered is correct.");
            }
        }
    }
}
