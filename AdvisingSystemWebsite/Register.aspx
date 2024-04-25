<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AdvisingSystemWebsite.Register" %>

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
        <asp:Button ID="btnBack" runat="server" Text="Back to log in" OnClick="btnBack_Click" />
    <div>
        <input type="text" id="advisorName" name="advisorName" placeholder="Name" runat="server"/>
        <br />
        <input type="email" id="advisorEmail" name="advisorEmail" placeholder="Email" runat="server"/>
        <br />
        <input type="text" id="advisorOffice" name="advisorOffice" placeholder="Office" runat="server"/>
        <br />
        <asp:Label ID="passwordLabel" runat="server" Text="Password:"></asp:Label>
        <br />
        <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="finish_register" runat="server" Text="finish registration" OnClick="finish_register_Click" />
        
    </div>
    </form>
</body>
</html>
