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
	public partial class Students : System.Web.UI.Page
	{

		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Update_Click(object sender, EventArgs e)
		{
			Response.Redirect("UpdateSts.aspx");
		}

		protected void Active_Click(object sender, EventArgs e)
		{
			Response.Redirect("Active.aspx");
		}

		protected void Transcript_Click(object sender, EventArgs e)
		{
			Response.Redirect("Trans.aspx");
		}

		protected void back_Click(object sender, EventArgs e)
		{
			Response.Redirect("Home.aspx");
		}

		protected void StudentAdv(object sender, EventArgs e)
		{
			Response.Redirect("List_Student_Advisor.aspx");
		}

		protected void StudentCours_Click(object sender, EventArgs e)
		{
			Response.Redirect("LinkStudentCourseInst.aspx");

		}

		protected void StudentAd_Click(object sender, EventArgs e)
		{
			Response.Redirect("LinkStudentAdvisor.aspx");

		}
	}
}