<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StadiumManager.aspx.cs" Inherits="M3proj.StadiumManager" %>

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
            Views:<br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="viewinfom" Text="View info about stadium" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="viewrequestsm" Text="View all requests" />
            <br />
            <br />
            Accept/Reject requests:<br />
            <br />
            username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="password4" runat="server"></asp:TextBox>
            <br />
            host club name:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="password1" runat="server"></asp:TextBox>
            <br />
            guest club name:&nbsp; <asp:TextBox ID="password2" runat="server"></asp:TextBox>
            <br />
            start time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="password3" TextMode=Date runat="server"></asp:TextBox>
            &nbsp;<asp:TextBox ID="password5" TextMode=Time runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" OnClick="acceptm" Text="Accept" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" OnClick="rejectm" Text="Reject" />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
