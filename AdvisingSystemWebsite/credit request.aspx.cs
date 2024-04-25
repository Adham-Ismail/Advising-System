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
    public partial class credit_request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void send(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int student_id = (int)Session["student_id"];
            string credit_hours = TextBox1.Text;
            string type = TextBox2.Text;
            string comment = TextBox3.Text;


            using (SqlCommand send_request_req = new SqlCommand("Procedures_StudentSendingCHRequest", conn))
            {
                send_request_req.CommandType = CommandType.StoredProcedure;

                send_request_req.Parameters.Add(new SqlParameter("@credit_hours", credit_hours));
                send_request_req.Parameters.Add(new SqlParameter("@type", type));
                send_request_req.Parameters.Add(new SqlParameter("@comment", comment));
                send_request_req.Parameters.Add(new SqlParameter("@StudentID", student_id));



                conn.Open();
                send_request_req.ExecuteNonQuery();
                conn.Close();



            }
        }
    }
}