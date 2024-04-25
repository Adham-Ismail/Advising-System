<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AdvisingSystemWebsite.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="Home" runat="server">
        <div>
            <asp:Label ID="Home_Page" runat="server" Text="Home Page"></asp:Label> <br />

            <asp:Label ID="Selection" runat="server" Text="Which Page Would You Like To Visit?"></asp:Label>

            <br />
            <asp:Button ID="Students" runat="server" Text="Students" Width="110px" OnClick="Students_Click" /> <br />
            <br />
            <asp:Button ID="Exams" runat="server" Text="Exams" Width="110px" OnClick="Exams_Click" /> <br />
            <br />
            <asp:Button ID="Slots" runat="server" Text="Slots" Width="110px" OnClick="Slots_Click" /> <br />
            <br />
            <asp:Button ID="Courses" runat="server" Text="Courses" Width="111px" OnClick="Courses_Click" /> <br />
            <br />
            <asp:Button ID="Payments" runat="server" Text="Payments" Width="110px" OnClick="Payments_Click" /> <br />
            <br />
            <asp:Button ID="Semesters" runat="server" Text="Semesters" Width="110px" OnClick="Semesters_Click" /> <br />
            <br />
            <asp:Button ID="Graduation_Plan" runat="server" Text="Graduation Plan"  Width="180px" OnClick="Graduation_Plan_Click" />




        </div>
        <p>
            <asp:Button ID="Advisor" runat="server" OnClick="Advisor_Click" Text="Advisors" />
        </p>
        <asp:Button ID="request" runat="server" OnClick="request_Click" Text="Requests" />
        <p>
            <asp:Button ID="Instructor" runat="server" OnClick="Instructor_Click" Text="Instructors" />
        </p>
    </form>
</body>
</html>
