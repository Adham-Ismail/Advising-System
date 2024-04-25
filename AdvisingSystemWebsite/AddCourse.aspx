<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="AdvisingSystemWebsite.AddCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        Add a new course:<br />
        Please add the major of the course:<p>
            <asp:TextBox ID="major" runat="server"></asp:TextBox>
        </p>
        Please add the semester of the course:<p>
            <asp:TextBox ID="semester" runat="server"></asp:TextBox>
        </p>
        Please add the the name of the course:<p>
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
        </p>
        Please add the credit hours of the course:<p>
            <asp:TextBox ID="credit" runat="server"></asp:TextBox>
        </p>
        Is it offered? Please type 1 if yes or 0 if no<p>
            <asp:TextBox ID="offered" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="Course" runat="server" Text="Add course" OnClick="Course_Click" />
    </form>
</body>
</html>
