using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace AdvisingSystemWebsite
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand rmv = new SqlCommand("[Procedures_AdminDeleteCourse]", conn);

            rmv.CommandType = System.Data.CommandType.StoredProcedure;

            String c = cid.Text;

            if (string.IsNullOrEmpty(c))
            {
                Response.Write("One of the inputs is null or empty");
            }
            else
            {
                rmv.Parameters.Add(new SqlParameter("@courseID", c));
            }
            try
            {
                conn.Open();
                rmv.ExecuteNonQuery();
                conn.Close();
                Response.Write("Course Deleted!");
            }
            catch (SqlException ex)
            {
                // Handle specific SQL exceptions
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}