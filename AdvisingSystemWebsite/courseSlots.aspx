<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="courseSlots.aspx.cs" Inherits="AdvisingSystemWebsite.courseSlots" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Courses And their Prerequisites
            <br />
            <br />
            <asp:Label ID="success" runat="server" Text=""></asp:Label>
            <asp:GridView ID="courseSlot" runat="server">
            </asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
