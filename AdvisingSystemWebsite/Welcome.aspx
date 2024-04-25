<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="AdvisingSystemWebsite.Welcome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome Page</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }
        h1 {
            margin-bottom: 50px;
        }
        .button {
            margin: 10px;
            padding: 15px 25px;
            font-size: 24px;
            text-align: center;
            cursor: pointer;
            outline: none;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 15px;
            box-shadow: 0 9px #999;
        }
        .button:hover {background-color: #3e8e41}
        .button:active {
            background-color: #3e8e41;
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Welcome. Please Choose One:</h1>
        <asp:Button ID="admin" runat="server" Text="Admin" CssClass="button" OnClick="btnAdmin_Click" />
        <asp:Button ID="advisor" runat="server" Text="Advisor" CssClass="button" OnClick="btnAdvisor_Click" />
        <asp:Button ID="student" runat="server" Text="Student" CssClass="button" OnClick="btnStudent_Click" />
    </form>
</body>
</html>
