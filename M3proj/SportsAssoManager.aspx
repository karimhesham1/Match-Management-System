<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SportsAssoManager.aspx.cs" Inherits="M3proj.SportsAssoManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left: 40px">
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Add or Delete a Match:"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="host club:"></asp:Label>
            &nbsp;&nbsp; <asp:TextBox ID="hclubname" runat="server"></asp:TextBox>
            <br />
            guest club: <asp:TextBox ID="password0" runat="server"></asp:TextBox>
            <br />
            start time:&nbsp;
            <asp:TextBox ID="password3" TextMode=Date runat="server"></asp:TextBox>
            <asp:TextBox ID="password5" TextMode=Time runat="server" ></asp:TextBox>
            <br />
            end time:&nbsp;&nbsp;
            <asp:TextBox ID="password6" TextMode=Date runat="server"></asp:TextBox>
            <asp:TextBox ID="password7" TextMode=Time runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="addmatchm" Text="Add Match" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="deletematchm" Text="Delete Match" />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label7" runat="server" Text="Views:"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" OnClick="viewupcomingm" Text="View all upcoming matches" />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" OnClick="alreadyplayedm" Text="View already played matches" />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button6" runat="server" OnClick="nevermatchedm" Text="View pair of club names who never scheduled to play with each other." />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
