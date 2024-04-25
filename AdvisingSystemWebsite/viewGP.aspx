<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewGP.aspx.cs" Inherits="AdvisingSystemWebsite.viewGP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Graduation Plan<br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Student ID:"></asp:Label>
            <br />
        </div>
        <asp:TextBox ID="studentID" runat="server"></asp:TextBox>
        <asp:Button ID="vGP" runat="server" Text="VIEW" OnClick="vGP_Click" />
        <br />
        <br />
        <asp:Label ID="success" runat="server" Text=""></asp:Label>
        <asp:GridView ID="GradPlan" runat="server"></asp:GridView>
    </form>
</body>
</html>
