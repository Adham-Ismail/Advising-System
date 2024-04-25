<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPay.aspx.cs" Inherits="AdvisingSystemWebsite.ViewPay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:Button ID="back" runat="server" Text="back" OnClick="back_Click" /><br />
            View Payments<br /><br />
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>

        </div>
    </form>
</body>
</html>
