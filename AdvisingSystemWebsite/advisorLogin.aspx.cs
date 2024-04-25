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
    public partial class advisorLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["RegisterAdvisorId"] != null && Session["isRedirectedFromRegister"] != null && (bool)Session["isRedirectedFromRegister"])
            {
                // Display the advisorId to the user with a message
                Response.Write($"Your Advisor ID is {Session["RegisterAdvisorId"]}. Please remember it as it will be used as your username and cannot be changed.");

                // Set the isRedirected session variable back to false
                Session["isRedirectedFromRegister"] = false;
            }

            if (Session["error_msg"] != null)
            {
                // Display the error message
                Response.Write(Session["error_msg"]);
                // Set the error_msg session variable back to null
                Session["error_msg"] = null;
            }
        }

        protected void signin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(advisorId.Value) || string.IsNullOrEmpty(password.Text))
            {
                // Display error message indicating missing values
                Response.Write("Error: Some values are missing. Please provide all the required information.");

                return;
            }

            String connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("FN_AdvisorLogin", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter advisorIdParam = new SqlParameter("@advisor_Id", System.Data.SqlDbType.Int);
            advisorIdParam.Value = int.Parse(advisorId.Value);
            cmd.Parameters.Add(advisorIdParam);

            SqlParameter passwordParam = new SqlParameter("@password", System.Data.SqlDbType.VarChar, 40);
            passwordParam.Value = password.Text;
            cmd.Parameters.Add(passwordParam);

            SqlParameter returnParameter = cmd.Parameters.Add("@success", SqlDbType.Int);
            returnParameter.Direction = ParameterDirection.ReturnValue;

            conn.Open();
            cmd.ExecuteScalar();
            conn.Close();
            bool? isSuccess = (bool?)returnParameter.Value;
            if (isSuccess == null) 
            {
                // Show error message
                Response.Write("Error: Invalid credentials, please re-enter your credentials");
                return;

            }
            else if ((bool)isSuccess)
            {
                // Save the advisor id in a session variable
                Session["advisor_id"] = advisorIdParam.Value;
                // Redirect to advisor's page
                Response.Redirect("advisor_page.aspx");
            }
            else
            {
                // Show error message
                Response.Write("Error: Invalid credentials, please re-enter your credentials");
                return;
            }
        }
        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}
