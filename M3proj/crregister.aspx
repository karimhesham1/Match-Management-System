<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crregister.aspx.cs" Inherits="M3proj.ClubRepresentativeRegister" %>

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
            <br />
            <asp:TextBox ID="crname" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="club name:"></asp:Label>
            <br />
            <asp:TextBox ID="cname" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="username:"></asp:Label>
            <br />
            <asp:TextBox ID="uname" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="password:"></asp:Label>
            <br />
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="registerm" Text="Register" />
        </div>
    </form>
</body>
</html>
