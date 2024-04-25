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
    public partial class LinkStudentAdvisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand LinkSt = new SqlCommand("Procedures_AdminLinkStudentToAdvisor", conn);
            LinkSt.CommandType = CommandType.StoredProcedure;

            String studentid = student.Text;
            String advisorid = advisor.Text;

            if (string.IsNullOrEmpty(studentid) || string.IsNullOrEmpty(advisorid))
            {
                Response.Write("One of the inputs is null or empty");
            }
            else
            {
                int studentid1 = Int16.Parse(student.Text);
                int advisorid1 = Int16.Parse(advisor.Text);
                LinkSt.Parameters.Add(new SqlParameter("@studentID", studentid1));
                LinkSt.Parameters.Add(new SqlParameter("@advisorID", advisorid1));


                try
                {
                    conn.Open();
                    LinkSt.ExecuteNonQuery();
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
