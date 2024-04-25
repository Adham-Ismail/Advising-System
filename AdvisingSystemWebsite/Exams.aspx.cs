using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class Exams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void MakeUP_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand addMakeup = new SqlCommand("[Procedures_AdminAddExam]", conn);

            String tp = type.Text;
            String dt = date.Text;
            String cID = Cid.Text;
            addMakeup.CommandType = System.Data.CommandType.StoredProcedure;


            if (string.IsNullOrEmpty(tp) || string.IsNullOrEmpty(dt) || string.IsNullOrEmpty(cID))
            {
                Response.Write("One of the inputs is null or empty");
            }
            else
            {
                addMakeup.Parameters.Add(new SqlParameter("@Type", tp));
                addMakeup.Parameters.Add(new SqlParameter("@date", dt));
                addMakeup.Parameters.Add(new SqlParameter("@courseID", cID));
            }
            try
            {
                conn.Open();
                addMakeup.ExecuteNonQuery();
                conn.Close();
                Response.Write("MakeUp Exam Added!");
            }
            catch (SqlException ex)
            {
                // Handle specific SQL exceptions
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}