<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Courses_home.aspx.cs" Inherits="AdvisingSystemWebsite.Courses_home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Button ID="courseAdd" runat="server" OnClick="course_add" Text="Add a new course." />
        <p>
            <asp:Button ID="Del" runat="server" Text="Delete A Course With Its Related Slots" OnClick="Del_Click" />
        </p>
    </form>
</body>
</html>
