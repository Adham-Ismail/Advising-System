<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student home page.aspx.cs" Inherits="AdvisingSystemWebsite.student_home_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><link href="StyleSheet2.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server"><div class="container">
         <div class="title">Student home<br />
  </div>
        <div class="button">
        <div style="height: 175px">
            <asp:Button ID="Button1"   onclick="add" runat="server" Text="Add phone" />
            <asp:Button ID="Button2"   onclick="Option_courses" runat="server" Text="Option courses" />
            <asp:Button ID="Button3"   onclick="Required_courses" runat="server" Text="Required courses" />
            <asp:Button ID="Button4"   onclick="Missing_courses" runat="server" Text="Missing courses" />
            <asp:Button ID="Button5"   onclick="Available_courses" runat="server" Text="Available courses" />
            <asp:Button ID="Button6"   onclick="Course_request" runat="server" Text="Course request" />
            <asp:Button ID="Button7"   onclick="Credit_request" runat="server" Text="Credit request" />
            <asp:Button ID="Button8"   onclick="Graduation_plan" runat="server" Text="Graduation plan" />
            <asp:Button ID="Button9"   onclick="Upcoming_installments" runat="server" Text="Upcoming installments" />
            <asp:Button ID="Button10"  onclick="Courses_Exam_Details" runat="server" Text="Courses Exam Details" />
            <asp:Button ID="Button11"  onclick="Register_for_First_makup" runat="server" Text="Register for First makup" />
            <asp:Button ID="Button12"  onclick="Register_for_second_makup" runat="server" Text="Register for second makup" />
            <asp:Button ID="Button13"  onclick="All_Courses_slots_instructor" runat="server" Text="All Courses slots instructor" />
            <asp:Button ID="Button14"  onclick="slot_of_acertaincourse_by_specific_instructor" runat="server" Text="slot of a certain course by specific instructor " />
            <asp:Button ID="Button15"  onclick="choose_instructor_of_course" runat="server" Text="choose instructor of course" />
            <asp:Button ID="Button16"  onclick="courses_and_prerequisets" runat="server" Text="courses and prerequisets" />
        </div>
            </div> </div>
    </form>
</body>
</html>
