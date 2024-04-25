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
    public partial class Registeration_page : System.Web.UI.Page
    {

        protected void Register(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                string first_name = TextBox1.Text;
                string last_name = TextBox2.Text;
                string password = TextBox3.Text;
                string faculty = TextBox4.Text;
                string email = TextBox5.Text;
                string major = TextBox6.Text;
                int semester = Int16.Parse(TextBox7.Text);

                using (SqlCommand studentreges = new SqlCommand("Procedures_StudentRegistration", conn))
                {
                    studentreges.CommandType = CommandType.StoredProcedure;

                    studentreges.Parameters.Add(new SqlParameter("@first_name", first_name));
                    studentreges.Parameters.Add(new SqlParameter("@last_name", last_name));
                    studentreges.Parameters.Add(new SqlParameter("@password", password));
                    studentreges.Parameters.Add(new SqlParameter("@faculty", faculty));
                    studentreges.Parameters.Add(new SqlParameter("@email", email));
                    studentreges.Parameters.Add(new SqlParameter("@major", major));
                    studentreges.Parameters.Add(new SqlParameter("@Semester", semester));

                    SqlParameter Student_id = new SqlParameter("@Student_id", SqlDbType.Int);
                    Student_id.Direction = ParameterDirection.Output;
                    studentreges.Parameters.Add(Student_id);

                    conn.Open();
                    studentreges.ExecuteNonQuery();
                    conn.Close();

                    Label10.Text = "Your id is :"+Student_id.Value.ToString();
                }
            }
            catch (FormatException ex)
            {
               
                Label10.Text = " please Input semester as int";
            
            }
        }


    }

}
