<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="smregister.aspx.cs" Inherits="M3proj.smregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Register:"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="name:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="smname" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="username:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="uname" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="password:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Stadium Name:"></asp:Label>
            &nbsp; <asp:TextBox ID="stname" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="registerm" Text="Register" />
        </div>
    </form>
</body>
</html>
