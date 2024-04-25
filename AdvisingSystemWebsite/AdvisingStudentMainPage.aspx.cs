using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class AdvisingStudentMainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void firstMakeUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("firstMakeUpReg.aspx");
        }

        protected void secondMakeUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("secondMakeUpReg.aspx");
        }

        protected void examSched_Click(object sender, EventArgs e)
        {
            Response.Redirect("examSched.aspx");
        }

        protected void installment_Click(object sender, EventArgs e)
        {
            Response.Redirect("unPaidInstallment.aspx");
        }

        protected void gradplan_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewGP.aspx");
        }

        protected void chooseInstructor_Click(object sender, EventArgs e)
        {
            Response.Redirect("chooseInstructor.aspx");
        }

        protected void specCourseSlots_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewCourseSlot.aspx");
        }

        protected void courseSlots_Click(object sender, EventArgs e)
        {
            Response.Redirect("courseSlots.aspx");
        }

        protected void coursesPrereq_Click(object sender, EventArgs e)
        {
            Response.Redirect("coursePrereq.aspx");
        }
    }
}