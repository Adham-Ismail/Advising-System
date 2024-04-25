<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trans.aspx.cs" Inherits=" AdvisingSystemWebsite.Trans" %>

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
            Student Trascript Details<br />
            <br />
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            

        </div>
    </form>
</body>
</html>
