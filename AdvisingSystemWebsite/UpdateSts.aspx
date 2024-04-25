<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateSts.aspx.cs" Inherits="AdvisingSystemWebsite.UpdateSts" %>

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
            Update Student Status <br />
            Student ID<br />
            <asp:TextBox ID="StdID" runat="server"></asp:TextBox><br />
            <asp:Button ID="Enter" runat="server" Text="Enter" OnClick="Enter_Click" />

        </div>
    </form>
</body>
</html>
