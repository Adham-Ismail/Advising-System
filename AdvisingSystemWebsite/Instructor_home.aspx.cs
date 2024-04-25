using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class Instructor_home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InstructorCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("LinkInstructorCourse.aspx");
        }

        protected void ViewInst_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewInstructors.aspx");
        }
    }
}