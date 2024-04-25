using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class viewCourseSlot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewSl_Click(object sender, EventArgs e)
        {
            string courseId = crseId.Text;
            string instructorId = instId.Text;

            if (string.IsNullOrEmpty(courseId) || string.IsNullOrEmpty(instructorId))
            {
                success.Text = "Please fill all the fields";
                return;
            }

            string connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewCrseSlot = new SqlCommand("SELECT * FROM dbo.FN_StudentViewSlot(@CourseID, @InstructorID)", conn);
            viewCrseSlot.Parameters.AddWithValue("@CourseID", courseId);
            viewCrseSlot.Parameters.AddWithValue("@InstructorID", instructorId);

            try
            {
                conn.Open();
                SqlDataReader rdr = viewCrseSlot.ExecuteReader();
                TableRow header = new TableRow();
                string[] headers = { "Course ID", "Course", "Slot ID", "Day", "Time", "Location", "Course ID", "Instructor ID", "Instructor" };
                for(int i = 0; i < headers.Length; i++)
                {
                    TableCell cell = new TableCell();
                    cell.Text = headers[i].ToString();
                    header.Cells.Add(cell);
                }
                slotsOfCourse.Rows.Add(header);
                TableRow row = new TableRow();
                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        // Iterate through the columns and add them to the table
                        for (int i = 0; i < rdr.FieldCount; i++)
                        {
                            TableCell cell = new TableCell();
                            cell.Text = rdr[i].ToString();
                            row.Cells.Add(cell);
                        }

                        slotsOfCourse.Rows.Add(row);
                    }
                }
                else
                {
                    success.Text = "No slots available for this course";
                }
            }
            catch (Exception ex)
            {
                success.Text = "An error occurred: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

    }
}