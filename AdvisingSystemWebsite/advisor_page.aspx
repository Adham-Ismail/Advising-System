<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="advisor_page.aspx.cs" Inherits="AdvisingSystemWebsite.advisor_page" %>

<!DOCTYPE html>

<html>
<head>
    <title>Advisor Dashboard</title>
</head>
<body>
    <h1>Advisor Dashboard</h1>

    <form id="form1" runat="server">
        <h2>View Advising Students</h2>
        <asp:Button ID="view_students" runat="server" Text="View Students" OnClick="btnViewAllAdvisingStudents_Click" />

        <h2>Insert Graduation Plan</h2>
        <input type="text" name="semester_code" id="grad_plan_semester_code" placeholder="Semester Code" runat="server">
        <input type="date" name="expected_graduation_date" id="grad_plan_expected_graduation_date" placeholder="YYYY-MM-DD" runat="server">
        <input type="number" name="sem_credit_hours" id="grad_plan_sem_credit_hours" placeholder="sem credit hours" runat="server">
        <input type="number" name="student_id" id="grad_plan_student_id" placeholder="Student ID" runat="server">
        <asp:Button ID="insert_grad_plan" runat="server" Text="Insert Graduation Plan" OnClick="btnCreateGP_Click" />

        <h2>Insert Courses for Graduation Plan</h2>
        <input type="number" name="student_id" id="insert_course_student_id" placeholder="Student ID" runat="server">
        <input type="text" name="semester_code" id="insert_course_semester_code" placeholder="Semester Code" runat="server">
        <input type="text" name="course_name" id="insert_course_course_name" placeholder="Course Name" runat="server">
        <asp:Button ID="insert_course" runat="server" Text="Insert Course" OnClick="btnAddCourseGP_Click" />

        <h2>Update Graduation Date</h2>
        <input type="date" name="expected_graduation_date" id="update_grad_date_expected_graduation_date" placeholder="YYYY-MM-DD" runat="server">
        <input type="number" name="student_id" id="update_grad_date_student_id" placeholder="Student ID" runat="server">
        <asp:Button ID="update_grad_date" runat="server" Text="Update Graduation Date" OnClick="btnUpdateGP_Click" />

        <h2>Delete Course from Graduation Plan</h2>
        <input type="number" name="student_id" id="delete_course_student_id" placeholder="Student ID" runat="server">
        <input type="text" name="semester_code" id="delete_course_semester_code" placeholder="Semester Code" runat="server">
        <input type="number" name="course_id" id="delete_course_course_id" placeholder="Course ID" runat="server">
        <asp:Button ID="delete_course" runat="server" Text="Delete Course" OnClick="btnDeleteFromGP_Click" />

        <h2>View Students by Major</h2>
        <input type="text" name="major" id="view_by_major_major" placeholder="Major" runat="server">
        <asp:Button ID="view_by_major" runat="server" Text="View Students" OnClick="btnViewAssignedStudents_Click" />

        <h2>View All Requests</h2>
        <asp:Button ID="view_requests" runat="server" Text="View Requests" OnClick="btnViewRequests_Click" />

        <h2>View Pending Requests</h2>
        <asp:Button ID="view_pending_requests" runat="server" Text="View Pending Requests" OnClick="btnViewPendingRequests_Click" />

        <h2>Approve/Reject Extra Credit Hours Request</h2>
        <input type="text" name="request_id" id="approve_hours_request_id" placeholder="Request ID" runat="server">
        <input type="text" name="current_sem_code" id="approve_hours_current_sem_code" placeholder="Current Semester Code" runat="server">
        <asp:Button ID="approve_reject_hours" runat="server" Text="Approve/Reject Hours" OnClick="btnApproveRejectCHRequest_Click" />

        <h2>Approve/Reject Extra Courses Request</h2>
        <input type="text" name="request_id" id="approve_courses_request_id" placeholder="Request ID" runat="server">
        <input type="text" name="current_sem_code" id="approve_courses_current_sem_code" placeholder="Current Semester Code" runat="server">
        <asp:Button ID="approve_reject_courses" runat="server" Text="Approve/Reject Courses" OnClick="btnApproveRejectCourseRequest_Click" />

        <br />
        <br />
        <asp:Button ID="btnBack" runat="server" Text="sign out" OnClick="btnBack_Click" />
    </form>
</body>
</html>
