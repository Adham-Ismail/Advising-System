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
    public partial class add_phone_number_s_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int student_id = (int)Session["student_id"];
            string phone_num = TextBox2.Text;

            try
            {
                using (SqlCommand studentphone = new SqlCommand("Procedures_StudentaddMobile", conn))
                {
                    studentphone.CommandType = CommandType.StoredProcedure;
                    studentphone.Parameters.Add(new SqlParameter("@StudentID", student_id));
                    studentphone.Parameters.Add(new SqlParameter("@mobile_number", phone_num));
                    conn.Open();
                    studentphone.ExecuteNonQuery();
                    conn.Close();
                    Label2.Text = "Telephone number added";
                }
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627)  
                {
                    Label2.Text = "This phone number is already associated with a student.";
                }
                
            }
        }
             protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentlogin.aspx");
        }

    }
}