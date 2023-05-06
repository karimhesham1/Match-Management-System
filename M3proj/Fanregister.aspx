<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fanregister.aspx.cs" Inherits="M3proj.Fanregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
 <asp:Label ID="Label101" runat="server" Text="name:"></asp:Label>
 <asp:TextBox ID="stnameee" runat="server" ></asp:TextBox>
<br />
<asp:Label ID="Label102" runat="server" Text="username:"></asp:Label>
 <asp:TextBox ID=userrrname runat="server"></asp:TextBox>
<br />
<asp:Label ID="Label103" runat="server" Text=password:></asp:Label>
 <asp:TextBox ID=passss runat="server"></asp:TextBox>
<br />
<asp:Label ID="Label104" runat="server" Text=nationalID:></asp:Label>
 <asp:TextBox ID=nationaliddddd runat="server"></asp:TextBox>
<br />
<asp:Label ID="Label105" runat="server" Text=phone:></asp:Label>
 <asp:TextBox ID=phoneeee runat="server"></asp:TextBox>
<br />
<asp:Label ID="Label106" runat="server" Text=birthdate:></asp:Label>
            <asp:TextBox ID="password3" TextMode=Date runat="server"></asp:TextBox>
            <asp:TextBox ID="password5" TextMode=Time runat="server" ></asp:TextBox>
<br />
<asp:Label ID="Label107" runat="server" Text=address:></asp:Label>
 <asp:TextBox ID=addresssssss runat="server"></asp:TextBox>
<br />
 <asp:Button ID="Button100" runat="server" OnClick="registerf" Text="Register" />
        </div>
    </form>
</body>
</html>
