<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Graduation.aspx.cs" Inherits="AdvisingSystemWebsite.Graduation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="back" runat="server" Text="back" OnClick="back_Click" /><br />
            Graduation Plan Page<br />
            You Can: <br /><br />
            <asp:Button ID="GradPlans" runat="server" Text=" View all graduation plans along with their initiated advisors" OnClick="GradPlans_Click" /><br />

        </div>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </form>
</body>
</html>