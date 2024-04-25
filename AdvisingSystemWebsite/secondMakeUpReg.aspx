<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="secondMakeUpReg.aspx.cs" Inherits="AdvisingSystemWebsite.secondMakeUpReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Second MakeUp Registration<br />
    </div>
    Student ID:<br />
    <asp:TextBox ID="SecondStudentId" runat="server"></asp:TextBox>
    <br />
    Course ID:<br />
    <asp:TextBox ID="SecondCourseId" runat="server"></asp:TextBox>
    <br />
    Student Current Semester:<br />
    <asp:TextBox ID="SecondStudentCurSem" runat="server"></asp:TextBox>
    <p>
        <asp:Button ID="SecondRegBut" runat="server" Text="REGISTER" OnClick="SecondRegBut_Click"/>
    </p>
        <asp:Label ID="response" runat="server" Text=""></asp:Label>
</form>
</body>
</html>