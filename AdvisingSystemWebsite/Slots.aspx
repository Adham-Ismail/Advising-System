<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Slots.aspx.cs" Inherits="AdvisingSystemWebsite.Slots" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div><asp:Button ID="back" runat="server" Text="back" OnClick="back_Click" /><br />
            
            <br />
            Enter Semester Code<br />
            <asp:TextBox ID="Sem" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Delete" runat="server" Text="Delete Slots of Unoffered Courses This Semester" OnClick="Delete_Click" /> <br />

            
        </div>
    </form>
</body>
</html>
