<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add phone number(s).aspx.cs" Inherits="AdvisingSystemWebsite.add_phone_number_s_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet2.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="title">Phone number<br /> </div>
            <div>Telephone number</div><div class="input-box">
          
            <asp:TextBox ID="TextBox2" runat="server"  placeholder="Enter your phone number" required Width="376px" ></asp:TextBox>
           </div>
                <br />
            <br />
       <div class="button">
        <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" Height="45px" Width="141px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Another one " OnClick="Button1_Click"  Width="141px" Height="45px" />
        <br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
       </div>      
       </div>
    </form>
</body>
</html>
