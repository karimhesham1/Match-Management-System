<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemAdmin.aspx.cs" Inherits="M3proj.SystemAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Club name:"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="cname" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="location:"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="loc" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="addclub" runat="server" OnClick="addclubm" Text="Add new club" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Club name:"></asp:Label>
            <br />
            <asp:TextBox ID="cname2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="deleteclub" runat="server" OnClick="deleteclubm" Text="delete club" />
            <br />


            <asp:Label ID="Label4" runat="server" Text="Stadium name:"></asp:Label>
            <br />
            <asp:TextBox ID="sname" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="location:"></asp:Label>
            <br />
            <asp:TextBox ID="sloc" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Capacity:"></asp:Label>
            <br />
            <asp:TextBox ID="scap" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="addstadiumm" Text="add stadium" />
            <br />
            <br />

            <asp:Label ID="Label7" runat="server" Text="Stadium Name:"></asp:Label>
            <br />
            <asp:TextBox ID="ssname" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="deletestadiumm" Text="delete stadium" />

            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="National ID:"></asp:Label>
            <br />
            <asp:TextBox ID="nid" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="blockfanm" Text="Block Fan" />

        </div>
    </form>
</body>
</html>
