using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;

namespace AdvisingSystemWebsite
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void finish_register_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(advisorName.Value) || string.IsNullOrEmpty(password.Text) || string.IsNullOrEmpty(advisorEmail.Value) || string.IsNullOrEmpty(advisorOffice.Value))
            {
                // Display error message indicating missing values
                Response.Write("Error: Some values are missing. Please provide all the required information.");
                return;
            }

            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            {
                using (SqlCommand command = new SqlCommand("Procedures_AdvisorRegistration", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@advisor_name", SqlDbType.VarChar).Value = advisorName.Value;
                    command.Parameters.Add("@password", SqlDbType.VarChar).Value = password.Text;
                    command.Parameters.Add("@email", SqlDbType.VarChar).Value = advisorEmail.Value;
                    command.Parameters.Add("@office", SqlDbType.VarChar).Value = advisorOffice.Value;

                    SqlParameter outputIdParam = new SqlParameter("@Advisor_id", SqlDbType.Int)
                    {
                        Direction = ParameterDirection.Output
                    };
                    command.Parameters.Add(outputIdParam);

                    conn.Open();
                    command.ExecuteNonQuery();
                    int advisorId = (int)outputIdParam.Value;
                    conn.Close();

                    // Store the advisorId in a session variable
                    Session["RegisterAdvisorId"] = advisorId;

                    // Set the isRedirected session variable to true
                    Session["isRedirectedFromRegister"] = true;

                    // Redirect the user back to Login.aspx
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}

