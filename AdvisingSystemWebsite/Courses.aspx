<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="AdvisingSystemWebsite.Courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div><asp:Button ID="back" runat="server" Text="back" OnClick="back_Click" /><br />
            Course ID<br />
            <asp:TextBox ID="cid" runat="server"></asp:TextBox><br />
            <asp:Button ID="Del" runat="server" Text="Delete A Course With Its Related Slots" OnClick="Del_Click" /><br />
            
        </div>
    </form>
</body>
</html>
