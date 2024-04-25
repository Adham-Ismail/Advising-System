<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LinkInstructorCourse.aspx.cs" Inherits="AdvisingSystemWebsite.LinkInstructorCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        Link instructor to a course in a specific slot:<br />
        Please enter the course id:<p>
            <asp:TextBox ID="course" runat="server"></asp:TextBox>
        </p>
        Please enter the instructor id:<p>
            <asp:TextBox ID="instructor" runat="server"></asp:TextBox>
        </p>
        Please enter the slot id:<p>
            <asp:TextBox ID="slot" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="LinkInstructor" runat="server" Text="Link" OnClick="LinkInstructor_Click" />
    </form>
</body>
</html>
