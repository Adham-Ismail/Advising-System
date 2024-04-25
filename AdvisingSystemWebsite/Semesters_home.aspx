<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Semesters_home.aspx.cs" Inherits="AdvisingSystemWebsite.Semesters_home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Button ID="semester" runat="server" Text="Add a new semester" OnClick="sem" />
        <p>
            <asp:Button ID="ViewSem" runat="server" Text="Fetch all semesters along with their offered courses 1." OnClick="ViewSem_Click" />
        </p>
        <asp:Button ID="Fetch" runat="server" Text="Fetch all semesters along with their offered courses 2." OnClick="Fetch_Click" />
    </form>
</body>
</html>
