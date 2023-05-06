<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClubRepresentative.aspx.cs" Inherits="M3proj.ClubRepresentative" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Button ID="Button5" runat="server" OnClick="viewclubinfom" Text="View information of the club" style="display: block; margin: 0 auto;" />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="viewupcomingm" Text="View upcoming matches of the club" style="display: block; margin: 0 auto;" />
            <asp:Label ID="Label6" runat="server" Text="enter date to view available stadiums:"></asp:Label>
            <br />
            <asp:TextBox ID="password3" TextMode=Date runat="server"></asp:TextBox>
            <asp:TextBox ID="password5" TextMode=Time runat="server" ></asp:TextBox>
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="viewstadiumm" Text="view available stadiums" />
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="send a host request:"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="stadium name:"></asp:Label>
            <br />
            <asp:TextBox ID="sname" runat="server" TextMode="DateTime"></asp:TextBox>
            <br />
            <asp:Label ID="Label9" runat="server" Text="time:"></asp:Label>
            <br />
            <asp:TextBox ID="password6" TextMode=Date runat="server"></asp:TextBox>
            <asp:TextBox ID="password7" TextMode=Time runat="server" ></asp:TextBox>
            <br />
            <asp:Button ID="Button4" runat="server" OnClick="sendrequestm" Text="send request" />
            <br />

        </div>
    </form>
</body>
</html>
