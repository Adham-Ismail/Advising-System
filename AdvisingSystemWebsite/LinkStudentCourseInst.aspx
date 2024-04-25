<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LinkStudentCourseInst.aspx.cs" Inherits="AdvisingSystemWebsite.LinkStudentCourseInst" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Link a student to a course with a specific instructor:<br />
            Please enter student id:</div>
        <asp:TextBox ID="studentid" runat="server"></asp:TextBox>
        <p>
            Please enter course id:</p>
        <asp:TextBox ID="courseid" runat="server"></asp:TextBox>
        <p>
            Please enter instructor id:</p>
        <asp:TextBox ID="instid" runat="server"></asp:TextBox>
        <p>
            Please enter semester code:</p>
        <asp:TextBox ID="semcode" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="StudInstCourse" runat="server" Text="Link" OnClick="StudInstCourse_Click" />
        </p>
    </form>
</body>
</html>
