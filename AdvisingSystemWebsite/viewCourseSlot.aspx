<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewCourseSlot.aspx.cs" Inherits="AdvisingSystemWebsite.viewCourseSlot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        Slots of a certain course<br />
        <br />
        Course ID<div>
            <asp:TextBox ID="crseId" runat="server"></asp:TextBox>
            <br />
            <br />
            Instructor ID</div>
        <asp:TextBox ID="instId" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="viewSl" runat="server" Text="VIEW" OnClick="viewSl_Click" />
        </p>
        <p>
            <asp:Label ID="success" runat="server" Text=""></asp:Label>
            <asp:Table ID="slotsOfCourse" runat="server">
            </asp:Table>
        </p>
    </form>
</body>
</html>
