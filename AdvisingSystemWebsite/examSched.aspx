<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="examSched.aspx.cs" Inherits="AdvisingSystemWebsite.examSched" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Exam Schedule<br />
        </div>
        <asp:Label ID="success" runat="server" Text=""></asp:Label>
        <asp:GridView ID="examSchedule" runat="server"></asp:GridView>
        </asp:Table>
    </form>
</body>
</html>
