<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Issue.aspx.cs" Inherits="AdvisingSystemWebsite.Issue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Button ID="Back" runat="server" Text="back" OnClick="Back_Click" /> <br />
            <br />
            Issue Installments<br />
            <br /> Payment ID<br />
            <asp:TextBox ID="PayID" runat="server"></asp:TextBox><br /><br />
            <asp:Button ID="pro" runat="server" Text="Issue" OnClick="pro_Click" />

        </div>
    </form>
</body>
</html>
