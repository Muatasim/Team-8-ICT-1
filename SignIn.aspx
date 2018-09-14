<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Grocery_Demo.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/HomePage.css" rel="stylesheet" />
    <link href="CSS/login.css" rel="stylesheet" />
    <link href="CSS/text.css" rel="stylesheet" />
    <link href="CSS/headingtext.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
      <p class="logo">
            <asp:Image ID="Image1" runat="server" />
            <img alt="" class="auto-style1" src="Grocery Image/logo.jpg" /></p>

        <div class="headingtext">
        <strong>SIGN IN</strong>
        </div>

        <div class="login" >
        
            <br />
            <asp:Table ID="Table1" runat="server" align="center" >
            <asp:TableRow ID="TableRow1" runat="server">
            <asp:TableCell HorizontalAlign="Right">
            <asp:Label ID="Label1" Text="Username" runat="server" Font-Bold="True"> 
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage=" Please Enter your username" Font-Bold="True"></asp:RequiredFieldValidator>
            </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="TableRow2" runat="server">
            <asp:TableCell HorizontalAlign="Right">
            <asp:Label ID="Label2" Text="Password" runat="server" Font-Bold="True" > 
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage=" Please Enter your password" Font-Bold="True"></asp:RequiredFieldValidator>
            </asp:TableCell>
            </asp:TableRow>
            </asp:Table>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Log_In" Text="Login" Font-Bold="True" />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True"></asp:Label>
        <br />
    
        <br />
        
    
    </div>   
        <p class="text">
            If you are not registered then please
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="SignUp_Click" PostBackUrl="~/SignUp.aspx" CausesValidation="False">Sign Up</asp:LinkButton>
        </p>
    </form>
</body>
</html>
