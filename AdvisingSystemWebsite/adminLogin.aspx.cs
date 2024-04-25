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
    public partial class adminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void signin(object sender, EventArgs e)
        {
            String user = username.Text;
            String admin_password = password.Text;

            String admin_user = "admin";
            String admin_pass = "admin1234";

            if (user == admin_user && admin_password == admin_pass)
            {
                Response.Redirect("Home.aspx");

            }
            else
            {
                Response.Write("Invalid username or password");
            }
        }
    }
}