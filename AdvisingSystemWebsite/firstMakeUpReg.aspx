<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="firstMakeUpReg.aspx.cs" Inherits="AdvisingSystemWebsite.firstMakeUpReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            First MakeUp Registration<br />
        </div>
        
        Student ID:<br />
        <asp:TextBox ID="FirstStudentId" runat="server"></asp:TextBox>
        <br />
        Course ID:<br />
        <asp:TextBox ID="FirstCourseId" runat="server"></asp:TextBox>
        <br />
        Student Current Semester:<br />
        <asp:TextBox ID="FirstStudentCurSem" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="FirstRegBut" runat="server" Text="REGISTER" OnClick="FirstRegBut_Click" />
        </p>
        <asp:Label ID="response" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>