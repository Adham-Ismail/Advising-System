<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exams.aspx.cs" Inherits="AdvisingSystemWebsite.Exams" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div><asp:Button ID="back" runat="server" Text="back" OnClick="back_Click" /><br />
            Exams Page<br />
            <br />
            Type of Exam<br />
            <asp:TextBox ID="type" runat="server"></asp:TextBox><br />
            Date<br />
            <asp:TextBox ID="date" runat="server"></asp:TextBox><br />
            Course ID <br />
            <asp:TextBox ID="Cid" runat="server"></asp:TextBox><br/>
            <br />
            <asp:Button ID="MakeUP" runat="server" Text="Add MakeUp Exam" OnClick="MakeUP_Click" /><br />
            
        </div>
    </form>
</body>
</html>
