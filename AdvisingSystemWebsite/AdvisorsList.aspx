<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorsList.aspx.cs" Inherits="AdvisingSystemWebsite.AdvisorsList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        The advisors in the system are:<br />
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </form>
</body>
</html>

