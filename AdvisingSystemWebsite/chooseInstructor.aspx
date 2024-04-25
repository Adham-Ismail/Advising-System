<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chooseInstructor.aspx.cs" Inherits="AdvisingSystemWebsite.chooseInstructor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Choose Your Instructor<br />
            <br />
            Student ID:</div>
        <asp:TextBox ID="studentId" runat="server"></asp:TextBox>
        <br />
        <br />
        Instructor ID:<br />
        <asp:TextBox ID="instructorId" runat="server"></asp:TextBox>
        <br />
        <br />
        Course ID:<br />
        <asp:TextBox ID="courseId" runat="server"></asp:TextBox>
        <br />
        <br />
        Current Semester Code:<br />
        <asp:TextBox ID="curSemCode" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="chooseInst" runat="server" Text="CHOOSE" OnClick="chooseInst_Click" />
        <br />
        <br />
        <asp:Label ID="success" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
