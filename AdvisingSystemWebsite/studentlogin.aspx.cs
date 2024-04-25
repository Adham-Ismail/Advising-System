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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                int student_id = Int16.Parse(TextBox1.Text);
                Session["student_id"] = student_id;
                string password = TextBox2.Text;

                SqlCommand studentlogin = new SqlCommand("SELECT dbo.FN_StudentLogin(@Student_id, @password)", conn);

                studentlogin.Parameters.Add(new SqlParameter("@Student_id", student_id));

                studentlogin.Parameters.Add(new SqlParameter("@password", password));

                SqlParameter success = new SqlParameter("@success", SqlDbType.Bit);

                success.Direction = ParameterDirection.Output;
                studentlogin.Parameters.Add(success);

                conn.Open();
                bool isSuccess = (bool)studentlogin.ExecuteScalar(); 

                if (isSuccess)
                {
                    Label1.Text = "Login successful!";
                }
                else
                {
                    Label1.Text = "Invalid user id or password.";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                
                Label1.Text = "An error occurred: " + ex.Message;
            }
        }




    }


    }

