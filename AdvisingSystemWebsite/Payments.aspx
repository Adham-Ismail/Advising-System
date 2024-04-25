<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="AdvisingSystemWebsite.Payments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="back" runat="server" Text="back" OnClick="back_Click" /><br />
            Payments Page<br />
            Your Options: <br /><br />
            <asp:Button ID="View" runat="server" Text="View details for all payments along with their corresponding students" OnClick="View_Click" /> <br /> <br />
            <asp:Button ID="Issue" runat="server" Text="Issue installments as per the number of installments for a certain payment" OnClick="Issue_Click" />
        </div>
    </form>
</body>
</html>
