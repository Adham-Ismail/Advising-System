<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisingStudentMainPage.aspx.cs" Inherits="AdvisingSystemWebsite.AdvisingStudentMainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Graduation Plan:"></asp:Label>
            <br />
            <asp:Button ID="gradplan" runat="server" Text="View Your Graduation Plan" OnClick="gradplan_Click" />
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Installment Details:"></asp:Label>
            <br />
        </div>
        <asp:Button ID="installment" runat="server" Text="View The Next Installment " OnClick="installment_Click"/>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Exams:"></asp:Label>
        </p>
        <p>
            <asp:Button ID="examSched" runat="server" Text="View Courses And their Exams" OnClick="examSched_Click" />
        </p>
        <p>
        <asp:Button ID="firstMakeUp" runat="server" Text="Register For First Makeup Exam" OnClick="firstMakeUp_Click" />
        </p>
        <p>
            <asp:Button ID="secondMakeUp" runat="server" Text="Register For Second Makeup Exam" OnClick="secondMakeUp_Click" />
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Course Slots:"></asp:Label>
        </p>
        <p>
        <asp:Button ID="chooseInstructor" runat="server" Text="Choose An Instructor" OnClick="chooseInstructor_Click" />
        </p>
        <p>
            <asp:Button ID="specCourseSlots" runat="server" Text="View Slots Of A Course" OnClick="specCourseSlots_Click" />
        </p>
            <asp:Button ID="courseSlots" runat="server" Text="View Details About All Courses Slots" OnClick="courseSlots_Click" />
        <p>
            <asp:Button ID="coursesPrereq" runat="server" Text="View Details About All Courses Prerequsites" OnClick="coursesPrereq_Click" />
        </p>
    </form>
</body>
</html>
