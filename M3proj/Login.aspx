<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="M3proj.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please login:<br />
            <br />
            username:&nbsp;
 <asp:TextBox ID=userrrname runat="server"></asp:TextBox>
            <br />
            password:
 <asp:TextBox ID=userrrname0 runat="server"></asp:TextBox>
            <br />
            <br />
 <asp:Button ID="Button100" runat="server" OnClick="loginm" Text="Login" />
            <br />
            <br />
            Register as:<br />
            <br />
 <asp:Button ID="Button101" runat="server" OnClick="registercr" Text="Club Representative" />
        &nbsp;<asp:Button ID="Button102" runat="server" OnClick="regitserf" Text="            Fan             " />
        &nbsp;<asp:Button ID="Button103" runat="server" OnClick="registersm" Text="Stadium Manager" />
        &nbsp;<asp:Button ID="Button104" runat="server" OnClick="registersa" Text="Sports Association Manager" />
        &nbsp;</div>
    </form>
</body>
</html>
