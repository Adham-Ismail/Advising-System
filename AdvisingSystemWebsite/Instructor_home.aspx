<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instructor_home.aspx.cs" Inherits="AdvisingSystemWebsite.Instructor_home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
                <asp:Button ID="InstructorCourse" runat="server" Text="Link instructor to a course in a specific slot." OnClick="InstructorCourse_Click" />

        <p>
                        <asp:Button ID="ViewInst" runat="server" Text="View all details of instructors along with their assigned courses" OnClick="ViewInst_Click" />

        </p>

    </form>
</body>
</html>