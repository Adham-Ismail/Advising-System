using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics.Eventing.Reader;

namespace AdvisingSystemWebsite
{
    public partial class courseSlots : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            //Create a Sql Connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand coursesSlot = new SqlCommand("SELECT * FROM Courses_Slots_Instructor", conn);
            coursesSlot.CommandType = CommandType.Text;
            try
            {
                conn.Open();
                DataTable data = new DataTable();
                data.Load(coursesSlot.ExecuteReader());
                courseSlot.DataSource = data;
                courseSlot.DataBind();

                conn.Close();
            }
            catch (Exception ex)
            {
                success.Text = ex.Message;
            }
        }
    }
}