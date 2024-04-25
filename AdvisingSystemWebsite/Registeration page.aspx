<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration page.aspx.cs" Inherits="AdvisingSystemWebsite.Registeration_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet2.css" rel="stylesheet" />
    <title></title>
      
</head>
<body>
    <form id="form1" runat="server">
         <div class="container" >
               <div class="title">Regestraion<br />
   </div>
              <div>
     First name</div><div class="input-box">
        <p>
           
    <asp:TextBox ID="TextBox1"  required  placeholder="Enter your First name"  runat="server" Width="322px" Height="25"></asp:TextBox>
       </p>
                  
     <div>Last name</div><div class="input-box">
        <p>
         
        
    <asp:TextBox ID="TextBox2" required  placeholder="Enter your Last name" runat="server" Height="25" Width="322px"></asp:TextBox>
        </p>
         <div>Password</div><div class="input-box">
    <p>
           

    <asp:TextBox ID="TextBox3" required  placeholder="Enter your Password"  runat="server" Height="25" Width="322px"></asp:TextBox>
</p>
             <div>Faculty</div><div class="input-box">
     <p>
  
    <asp:TextBox ID="TextBox4" required  placeholder="Enter your Faculty"  runat="server"  Height="25" Width="322px"></asp:TextBox>
      </p>
                 <div>Email</div><div class="input-box">
        <p>


    <asp:TextBox ID="TextBox5"  required  placeholder="Enter your Email"  runat="server" Height="25" Width="322px"></asp:TextBox>
</p>
                     <div>Major</div><div class="input-box">
        <p>
    <asp:TextBox ID="TextBox6"   required  placeholder="Enter your Major" runat="server" Height="25" Width="322px"></asp:TextBox>
</p> <div>Semester</div><div class="input-box">
        <p>
    <asp:TextBox ID="TextBox7" runat="server" required  placeholder="Enter your Semester" Height="25" Width="322px"></asp:TextBox>
</p>
        <p>
&nbsp;<asp:Label ID="Label10" runat="server" Text=""></asp:Label>
</p> <div class="button">
        <p>
        <asp:Button ID="Button1" runat="server" OnClick="Register" Text="Register" Height="45px" Width="323px" />
        </p><div/>
             <div/>
    </form>
</body>
</html>
