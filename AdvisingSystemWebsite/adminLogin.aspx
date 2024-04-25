<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="AdvisingSystemWebsite.adminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please Login!<br />
            <br />
        </div>
        Username:<p>
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
        </p>
        Password:<p>
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="Loginbutton" runat="server" Onclick="signin" Text="Log in" />
    </form>
</body>
</html>

