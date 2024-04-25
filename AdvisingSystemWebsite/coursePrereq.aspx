<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="coursePrereq.aspx.cs" Inherits="AdvisingSystemWebsite.coursePrereq" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Courses And their Prerequisites<br />
            <br />
            <asp:Label ID="success" runat="server" Text=""></asp:Label>
&nbsp;<asp:Table ID="cPrereq" runat="server">
            </asp:Table>
        </div>
    </form>
</body>
</html>
