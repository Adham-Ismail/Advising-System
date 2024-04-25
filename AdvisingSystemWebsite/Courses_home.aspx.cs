using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class Courses_home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void course_add(object sender, EventArgs e)
        {
            Response.Redirect("AddCourse.aspx");

        }

        protected void Del_Click(object sender, EventArgs e)
        {
            Response.Redirect("Courses.aspx");

        }
    }
}