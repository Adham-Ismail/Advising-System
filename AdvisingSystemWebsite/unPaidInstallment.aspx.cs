using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class unPaidInstallment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void viewInstal_Click(object sender, EventArgs e)
        {
            string paymentID = paymentId.Text;
            if (paymentID == "")
            {
                installDetails.Text = "Please insert your payment id";
                return;
            }

            string connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand selectInstal = new SqlCommand("SELECT * FROM Installment WHERE payment_id = @payment_id AND status = 'notPaid' AND Installment.startdate <= CURRENT_TIMESTAMP AND Installment.deadline >= CURRENT_TIMESTAMP", conn);
            selectInstal.Parameters.AddWithValue("@payment_id", paymentID);

            try
            {
                conn.Open();
                SqlDataReader rdr = selectInstal.ExecuteReader();

                if (rdr.HasRows) // Check if there are any rows
                {
                    rdr.Read();

                    int paymentId = rdr.GetInt32(rdr.GetOrdinal("payment_id"));
                    DateTime startDate = rdr.GetDateTime(rdr.GetOrdinal("startdate"));
                    DateTime Deadline = rdr.GetDateTime(rdr.GetOrdinal("deadline"));
                    int amount = rdr.GetInt32(rdr.GetOrdinal("amount"));

                    installDetails.Text = $"Installment ID : {paymentId} <br />" +
                                          $"start Date : {startDate} <br />" +
                                          $"Deadline : {Deadline} <br />" +
                                          $"amount : {amount} <br />";
                }
                else
                {
                    installDetails.Text = "No unpaid installments found or maybe your payment id is wrong";
                }

                rdr.Close();
            }
            catch (Exception ex)
            {
                // Use installDetails.Text to display the error message on the web page
                installDetails.Text = $"Error: {ex.Message}";
            }
            finally
            {
                conn.Close();
            }
        }





    }
}