using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace AdvisingSystemWebsite
{
    public partial class UpdateSts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Students.aspx");
        }

        protected void Enter_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand up = new SqlCommand("[Procedure_AdminUpdateStudentStatus]", conn);

            String sid = StdID.Text;

            up.CommandType = System.Data.CommandType.StoredProcedure;



            if (string.IsNullOrEmpty(sid))
            {
                Response.Write("One of the inputs is null or empty");
            }
            else
            {
                up.Parameters.Add(new SqlParameter("@student_id", sid));
            }
            try
            {
                conn.Open();
                up.ExecuteNonQuery();
                conn.Close();
                Response.Write("Status Updated!");
            }
            catch (SqlException ex)
            {
                // Handle specific SQL exceptions
                Response.Write("Error: " + ex.Message);
            }





        }


    }
}