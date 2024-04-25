<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="advisorLogin.aspx.cs" Inherits="AdvisingSystemWebsite.advisorLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        #form1 {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="usernameLabel" runat="server" Text="Username:"></asp:Label>
        <input type="number" id="advisorId" name="advisor_id" placeholder="username" runat="server"/>
        <br />
        <asp:Label ID="passwordLabel" runat="server" Text="Password:"></asp:Label>
        <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="signin" runat="server" Text="Sign in" OnClick="signin_Click" />
        <asp:Button ID="register" runat="server" Text="Register" OnClick="register_Click" />
        
    </div>
    </form>
</body>
</html>
