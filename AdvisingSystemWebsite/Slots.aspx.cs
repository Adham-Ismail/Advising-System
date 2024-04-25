using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class Slots : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["AdvisingSystemWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand rmv = new SqlCommand("[Procedures_AdminDeleteSlots]", conn);

            rmv.CommandType = System.Data.CommandType.StoredProcedure;

            String curr = Sem.Text;

            if (string.IsNullOrEmpty(curr))
            {
                Response.Write("One of the inputs is null or empty");
            }
            else
            {
                rmv.Parameters.Add(new SqlParameter("@current_semester", curr));
            }
            try
            {
                conn.Open();
                rmv.ExecuteNonQuery();
                conn.Close();
                Response.Write("Slots Removed!");
            }
            catch (SqlException ex)
            {
                // Handle specific SQL exceptions
                Response.Write("Error: " + ex.Message);
            }

        }
    }
}