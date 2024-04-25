using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
	public partial class Request_home : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void pending(object sender, EventArgs e)
		{
			Response.Redirect("pending_requests.aspx");
		}
	}
}