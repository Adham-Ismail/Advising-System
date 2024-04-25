using System;
using System.Data;
using System.Diagnostics;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class DisplayData : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Data"] != null)
                {
                    DataTable dt = (DataTable)Session["Data"];

                    // No need to create a new GridView, use the existing one
                    // GridView1 = new GridView();
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("advisor_page.aspx");
        }
    }
}
