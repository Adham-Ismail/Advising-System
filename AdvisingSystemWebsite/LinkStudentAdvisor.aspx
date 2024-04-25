<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LinkStudentAdvisor.aspx.cs" Inherits="AdvisingSystemWebsite.LinkStudentAdvisor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        Link student to advisor:<br />
        Please enter the student id:<p>
            <asp:TextBox ID="student" runat="server"></asp:TextBox>
        </p>
        Please enter the advisor id:<p>
            <asp:TextBox ID="advisor" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="LinkSt" runat="server" Text="Link" OnClick="Button1_Click" />
    </form>
</body>
</html>