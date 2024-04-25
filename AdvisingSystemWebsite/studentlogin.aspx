<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentlogin.aspx.cs" Inherits="AdvisingSystemWebsite.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="StyleSheet2.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="Login" runat="server">
        <div class="container">
       <div class="title">Log in<br />
        </div>

        <div>
            Student id</div><div class="input-box">
        <asp:TextBox ID="TextBox1" runat="server"  placeholder="Enter your id" required  Width="320px"></asp:TextBox>
                </div>
        <p>
            Password</p>
            <div class="input-box">
        <p>
            <asp:TextBox ID="TextBox2" runat="server"  placeholder="Enter your password" required Width="322px"></asp:TextBox>
        </p></div>

            <div class="button">
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="login" Text="login" Width="324px"  />
        
           
        </p>
 
        <p>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </p>
             </div>
    </form>
</body>
</html>
