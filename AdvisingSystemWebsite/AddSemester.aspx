<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSemester.aspx.cs" Inherits="AdvisingSystemWebsite.AddSemester" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add a new semester:<br />
            Please add a start date to your semester in the format YYYY-MM-DD:</div>
        <asp:TextBox ID="start" runat="server"></asp:TextBox>
        <p>
            Please add an end date to your semester in the format YYYY-MM-DD</p>
        <asp:TextBox ID="end" runat="server"></asp:TextBox>
        <p>
            Please add the semester code:</p>
        <asp:TextBox ID="code" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="semester" runat="server" Onclick="Add_Semester" Text="Add Semester" />
        </p>
    </form>
</body>
</html>
