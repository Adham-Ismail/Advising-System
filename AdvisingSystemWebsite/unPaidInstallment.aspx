<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="unPaidInstallment.aspx.cs" Inherits="AdvisingSystemWebsite.unPaidInstallment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Next Installment details<br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Please Insert the Payment ID"></asp:Label>
        </div>
        <asp:TextBox ID="paymentId" runat="server"></asp:TextBox>
        &nbsp;<asp:Button ID="viewInstal" runat="server" Text="VIEW" OnClick="viewInstal_Click" />
        <br />
        <br />
        <asp:Label ID="installDetails" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
