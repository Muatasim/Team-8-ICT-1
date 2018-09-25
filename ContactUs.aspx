<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Grocery_Demo.ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="CSS/Skeleton.css" rel="stylesheet" />
    <link href="CSS/headertext.css" rel="stylesheet" />
    <link href="CSS/map.css" rel="stylesheet" />
    <link href="CSS/address.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
         <div id="site-wrapper">
       <div style="text-align:right;"> 
       <h4><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignIn.aspx">Sign In</asp:HyperLink> 
        &nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SignUp.aspx">Sign Up</asp:HyperLink>&nbsp;</h4>
        &nbsp;
        </div>       
        
        <header>
        <div class="content-wrap">
        <div class="logo">
            <asp:Image ID="Image1" runat="server" />
            <img src="Grocery Image/logo.jpg" style="height:105px; width:800px; margin-left:350px" /></div>
           <br />
           <div class="menu">
            <asp:Button ID="Button1" Class="btn-success" runat="server" PostBackUrl="~/Homepage.aspx" Text="Home" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
            <asp:Button ID="Button2" Class="btn-success" runat="server" PostBackUrl="~/Promotion.aspx" Text="Promotions" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
            <asp:Button ID="Button3" Class="btn-success" runat="server" PostBackUrl="~/ViewProducts.aspx" Text="Products" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" /> 
            <asp:Button ID="Button4" Class="btn-success" runat="server" PostBackUrl="~/AboutUs.aspx" Text="About Us" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
            <asp:Button ID="Button5" Class="btn-success" runat="server" PostBackUrl="~/ContactUs.aspx" Text="Contact Us" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />              
        </div>
        <br />
        <h3 class="headertext" style="margin-left:340px">Contact Us</h3>
        </div>
        </header>

        <br />
        <br />

        <main>
        <div class="content-wrap">

        <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3536.0051473446642!2d152.96096711512467!3d-27.593370028580253!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b914ee36b6b35b3%3A0x435768387d9844!2s39+Lavender+St%2C+Inala+QLD+4077!5e0!3m2!1sen!2sau!4v1537378633298" width="500" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>

         <br />

         <h4 class="address">
            <strong>39 Lavender Street,<br />
            Inala, QLD 4077 <br />
            Contact No: 0451138852 </strong>
         </h4>

        </div> 
        </main>
           
        <br />


        <footer>
        <div class="content-wrap">
        <p>&copy; Mix & Match Groceries. All Rights Reserved</p>
        </div>
        </footer>
    
    </div>
    </form>
</body>
</html>
