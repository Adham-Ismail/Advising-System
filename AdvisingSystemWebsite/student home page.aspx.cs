using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingSystemWebsite
{
    public partial class student_home_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

  

        protected void add(object sender, EventArgs e)
        {
            Response.Redirect("add phone number(s).aspx");
        }
        protected void Option_courses(object sender, EventArgs e)
        {
            Response.Redirect("opitonal courses.aspx");

        }
        protected void Required_courses(object sender, EventArgs e)
        {
            Response.Redirect("Required courses.aspx");
        }
        protected void Missing_courses(object sender, EventArgs e)
        {
            Response.Redirect("missingcourses.aspx");
        }
        protected void Available_courses(object sender, EventArgs e)
        {
            Response.Redirect("availavlecourses.aspx");

        }
        protected void Course_request(object sender, EventArgs e)
        {
            Response.Redirect("course request.aspx");
        }
        protected void Credit_request(object sender, EventArgs e)
        {
            Response.Redirect("credit request.aspx");

        }
        protected void Graduation_plan(object sender, EventArgs e)
        {
            Response.Redirect("viewGP.aspx");

        }
        protected void Upcoming_installments(object sender, EventArgs e)
        {
            Response.Redirect("unPaidInstallment.aspx");

        }
        protected void Courses_Exam_Details(object sender, EventArgs e)
        {
            Response.Redirect("examSched.aspx");
        }
        protected void Register_for_First_makup(object sender, EventArgs e)
        {
            Response.Redirect("firstMakeUpReg.aspx");
        }
        protected void Register_for_second_makup(object sender, EventArgs e)
        {
            Response.Redirect("secondMakeUpReg.aspx");
        }
        protected void All_Courses_slots_instructor(object sender, EventArgs e)
        {
            Response.Redirect("courseSlots.aspx");
        }
        protected void slot_of_acertaincourse_by_specific_instructor(object sender, EventArgs e)
        {
            Response.Redirect("viewCourseSlot.aspx");
        }
        protected void choose_instructor_of_course(object sender, EventArgs e)
        {
            Response.Redirect("chooseInstructor.aspx");
        }
        protected void courses_and_prerequisets(object sender, EventArgs e)
        {
            Response.Redirect("coursePrereq.aspx");
        }
    }
    }
