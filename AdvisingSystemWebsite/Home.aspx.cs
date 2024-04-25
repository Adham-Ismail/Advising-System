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
    public partial class Home : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Students_Click(object sender, EventArgs e)
        {
            Response.Redirect("Students.aspx");
        }

        protected void Exams_Click(object sender, EventArgs e)
        {
            Response.Redirect("Exams.aspx");
        }

        protected void Slots_Click(object sender, EventArgs e)
        {
            Response.Redirect("Slots.aspx");
        }

        protected void Courses_Click(object sender, EventArgs e)
        {
            Response.Redirect("Courses_home.aspx");
        }

        protected void Payments_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payments.aspx");
        }

        protected void Semesters_Click(object sender, EventArgs e)
        {
            Response.Redirect("Semesters_home.aspx");
        }

        protected void Graduation_Plan_Click(object sender, EventArgs e)
        {
            Response.Redirect("Graduation.aspx");
        }

        protected void Advisor_Click(object sender, EventArgs e)
        {
            Response.Redirect("Advisor_home.aspx");
        }


        protected void Instructor_Click(object sender, EventArgs e)
        {
            Response.Redirect("Instructor_home.aspx");
        }

        protected void request_Click(object sender, EventArgs e)
        {
            Response.Redirect("Request_home.aspx");

        }
    }
}