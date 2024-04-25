<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="availablecourses.aspx.cs" Inherits="AdvisingSystemWebsite.availablecourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="StyleSheet2.css" rel="stylesheet" />

    <title></title>
</head>
<body>
      <form id="form1" runat="server">
           <div class="container">
         <div class="title">Available courses<br /> </div>
            <div>semester code</div><div class="input-box">
           
        
            <asp:TextBox ID="TextBox1"  required placeholder="Enter your current semester" runat="server" Width="439px"></asp:TextBox>
            
            </div>
            
           
                <div class="button">
            <asp:Button ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" Width="439px" Height="45px" />
               </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        
    </form>
    </div>
</body>
</html>
