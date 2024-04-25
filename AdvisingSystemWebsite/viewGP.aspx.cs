using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class viewGP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void vGP_Click(object sender, EventArgs e)
        {
            string studentId = studentID.Text;
            
            if(studentId == "")
            {
                success.Text = "Please Insert your id";
                return;
            }
            string connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            /*
             Student Id, Student_name, graduation Plan 
             Id, Course id, Course name, Semester code, expected 
             graduation date, Semester credit hours, advisor id
             */

            SqlCommand viewGradPlan = new SqlCommand("SELECT * FROM dbo.FN_StudentViewGP(@student_ID)", conn);
            viewGradPlan.Parameters.Add(new SqlParameter("@student_ID",studentId));
            try {

                conn.Open();
                DataTable data = new DataTable();
                data.Load(viewGradPlan.ExecuteReader());
                GradPlan.DataSource = data;
                GradPlan.DataBind();
                if(data != null) {
                    success.Text = "Your graduation plan:";
                    Console.WriteLine(data);
                }
                else
                {
                    success.Text = "No graduation plan is found for this id";
                }
                
                conn.Close();
            }
            catch(Exception ex)
            {
                success.Text = ex.Message;
            }

        }
    }
}