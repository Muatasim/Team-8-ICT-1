<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Grocery_Demo.Homepage" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/HomePage.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class ="home" style="text-align:right;">
    
       <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignIn.aspx">Sign In</asp:HyperLink>
        &nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SignUp.aspx">Sign Up</asp:HyperLink>&nbsp;

        </div>
       <p class="logo">
            <asp:Image ID="Image1" runat="server" />
            <img alt="" class="auto-style1" src="Grocery Image/logo.jpg" /></p>

        <p class="menu">
            <asp:Button ID="Button1" runat="server" PostBackUrl="~/Homepage.aspx" Text="Home" Width="127px" Font-Bold="True" />
            <asp:Button ID="Button2" runat="server" PostBackUrl="~/Promotion.aspx" Text="Promotions" Width="127px" Font-Bold="True" />
            <asp:Button ID="Button3" runat="server" PostBackUrl="~/ViewProducts.aspx" Text="View Products" Width="127px" Font-Bold="True" /> 
            <asp:Button ID="Button4" runat="server" PostBackUrl="~/AboutUs.aspx" Text="About Us" Width="127px" Font-Bold="True" />
            <asp:Button ID="Button5" runat="server" PostBackUrl="~/ContactUs.aspx" Text="Contact Us" Width="127px" Font-Bold="True" />              
        </p>
         
   
    </form>
</body>
</html>

