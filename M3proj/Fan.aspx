<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fan.aspx.cs" Inherits="M3proj.Fan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
<br />
            <br />
 <asp:Label ID="Label205" runat="server" Text=date:></asp:Label>
            <asp:TextBox ID="password3" TextMode=Date runat="server"></asp:TextBox>
            <asp:TextBox ID="password5" TextMode=Time runat="server" ></asp:TextBox>
<br />
 <asp:Button ID="Button101" runat="server" OnClick="availableMatchesToAttendF" Text="availableMatchesToAttend" />
<br />
<br />
<br />
 <asp:Label ID="Label201" runat="server" Text=nationalID:></asp:Label>
 <asp:TextBox ID="nationallllID" runat="server"></asp:TextBox>
<br />
 <asp:Label ID="Label202" runat="server" Text=hostname:></asp:Label>
 <asp:TextBox ID="hostnameeeee" runat="server"></asp:TextBox>
<br />
 <asp:Label ID="Label203" runat="server" Text=guestname:></asp:Label>
 <asp:TextBox ID=guestnameeeee runat="server"></asp:TextBox>
<br />
 <asp:Label ID="Label204" runat="server" Text=date:></asp:Label>
            <asp:TextBox ID="password6" TextMode=Date runat="server"></asp:TextBox>
            <asp:TextBox ID="password7" TextMode=Time runat="server" ></asp:TextBox>
<br />
 <asp:Button ID="Button102" runat="server" OnClick="purchaseTicketPro" Text="purchaseTicket" />
        </div>
    </form>
</body>
</html>
