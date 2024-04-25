using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite

{
    public partial class Payments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void View_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewPay.aspx");

        }

        protected void Issue_Click(object sender, EventArgs e)
        {
            Response.Redirect("Issue.aspx");

        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}