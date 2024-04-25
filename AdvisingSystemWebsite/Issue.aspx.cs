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
    public partial class Issue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payments.aspx");
        }

        protected void pro_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand inst = new SqlCommand("[Procedures_AdminIssueInstallment]", conn);

            String pay_id = PayID.Text;
            inst.CommandType = System.Data.CommandType.StoredProcedure;

            if (string.IsNullOrEmpty(pay_id))
            {
                Response.Write("One of the inputs is null or empty");
            }
            else
            {
                int xx = Int16.Parse(pay_id);
                inst.Parameters.Add(new SqlParameter("@payment_id", xx));
            }
            try
            {
                conn.Open();
                inst.ExecuteNonQuery();
                conn.Close();
                Response.Write("Installments Issued!");
            }
            catch (SqlException ex)
            {
                // Handle specific SQL exceptions
                Response.Write("Error: " + ex.Message);
            }


        }
    }
}