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
    public partial class coursePrereq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            // Create a SqlConnection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand examSched = new SqlCommand("SELECT * FROM Courses_MakeupExams", conn);
            examSched.CommandType = CommandType.Text;

            try
            {
                conn.Open();
                SqlDataReader rdr = examSched.ExecuteReader();

                // Check if there are rows before attempting to read
                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        TableRow row = new TableRow();

                        // Iterate through the columns and add them to the table
                        for (int i = 0; i < rdr.FieldCount; i++)
                        {
                            TableCell cell = new TableCell();
                            cell.Text = rdr[i].ToString();
                            row.Cells.Add(cell);
                        }

                        cPrereq.Rows.Add(row);
                    }
                }
                else
                {
                    success.Text = "No data found.";
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