<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="course request.aspx.cs" Inherits="AdvisingSystemWebsite.course_request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><link href="StyleSheet2.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div class="container">
             <div class="title">Course request<br />
 </div><div>
    CourseID</div>
                     <div class="input-box">
     <p>
         <asp:TextBox ID="TextBox1" runat="server"  placeholder="Enter your password" required Width="322px"></asp:TextBox>
     </p>
                     <div>
    Type</div>     <p>
     <asp:TextBox ID="TextBox2" runat="server"  placeholder="Enter your password" required Width="322px"></asp:TextBox>
 </p>
                        <div>Comment
    </div>  <p>
     <asp:TextBox ID="TextBox3" runat="server"  placeholder="Enter your password" required Width="322px"></asp:TextBox>
 </p>
                     </div>

         <div class="button">
     <p>
         <asp:Button ID="Button1" runat="server" OnClick="send" Text="Add" Width="324px"  />
     
        
     </p>
        </div>
        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
    </form>
    </div>
</body>
</html>
