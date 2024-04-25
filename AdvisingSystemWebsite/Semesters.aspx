<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Semesters.aspx.cs" Inherits="AdvisingSystemWebsite.Semesters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="back" runat="server" Text="back" OnClick="back_Click" /><br />
            Semesters Page<br />
            Your Options: <br /><br />
            <asp:Button ID="Fetch" runat="server" Text="Fetch all semesters along with their offered courses" OnClick="Fetch_Click" /><br />
        </div>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
