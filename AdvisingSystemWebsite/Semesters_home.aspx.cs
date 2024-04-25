using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
	public partial class Semesters_home : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void Fetch_Click(object sender, EventArgs e)
        {
			Response.Redirect("Semesters.aspx");
        }

		protected void sem(object sender, EventArgs e)
		{
			Response.Redirect("AddSemester.aspx");
		}

		protected void ViewSem_Click(object sender, EventArgs e)
		{
			Response.Redirect("ViewSemesters.aspx");

		}
	}
}