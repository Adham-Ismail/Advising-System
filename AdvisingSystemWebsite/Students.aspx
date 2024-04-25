<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="AdvisingSystemWebsite.Students" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Student Page <br />
            Your Options Are: <br />
            <br />
            <br />
            <asp:Button ID="Update" runat="server" Text="Update Student Financial Status" Width="420px" OnClick="Update_Click" /> <br /> <br />
            <asp:Button ID="Active" runat="server" Text="View All Active Students" Width="420px" OnClick="Active_Click" /> <br /> <br />
            <asp:Button ID="Transcript" runat="server" Text="View All Student Transcrip Details" Width="420px" OnClick="Transcript_Click" /> <br /><br />        
                        <asp:Button ID="StudentAdvisor" runat="server" OnClick="StudentAdv" Text=" List all students with their corresponding advisors in the system." />

        </div>
        <p>
            <asp:Button ID="StudentAd" runat="server" Text="Link a student to an advisor." OnClick="StudentAd_Click" />
        </p>
        <p>
                    <asp:Button ID="StudentCours" runat="server" Text="Link a student to a course with a specific instructor.
" OnClick="StudentCours_Click" />
        </p>
        <p>
            <asp:Button ID="back" runat="server" Text="back" OnClick="back_Click" />
        </p>
    </form>
</body>
</html>
