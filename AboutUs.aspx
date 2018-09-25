<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Grocery_Demo.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="CSS/Skeleton.css" rel="stylesheet" />
<link href="CSS/headertext.css" rel="stylesheet" />
<link href="CSS/abouttext.css" rel="stylesheet" />
<link href="CSS/aboutimage.css" rel="stylesheet" />
<link href="CSS/listtext.css" rel="stylesheet" />
<link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    
<form id="form1" runat="server">
<div style="text-align:right;"> 
<h4><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignIn.aspx">Sign In</asp:HyperLink> 
&nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SignUp.aspx">Sign Up</asp:HyperLink>&nbsp;</h4>
&nbsp;
</div>

<div id="site-wrapper">
        
<header>
<div class="content-wrap">
<div class="logo">
<asp:Image ID="Image1" runat="server" />
<img src="Grocery Image/logo.jpg" style="height:105px; width:800px; margin-left:350px" />
</div>        
<br/>               
<div class="menu">
<asp:Button ID="Button1" Class="btn-success" runat="server" PostBackUrl="~/Homepage.aspx" Text="Home" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
<asp:Button ID="Button2" Class="btn-success" runat="server" PostBackUrl="~/Promotion.aspx" Text="Promotions" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
<asp:Button ID="Button3" Class="btn-success" runat="server" PostBackUrl="~/ViewProducts.aspx" Text="Products" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" /> 
<asp:Button ID="Button4" Class="btn-success" runat="server" PostBackUrl="~/AboutUs.aspx" Text="About Us" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
<asp:Button ID="Button5" Class="btn-success" runat="server" PostBackUrl="~/ContactUs.aspx" Text="Contact Us" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />              
</div>
<br />        
<h3 class="headertext" style="margin-left:340px">About Us</h3>
</div>
</header>
<br />
<main>
<div class="content-wrap">
<h4 class="abouttext">
We are extremely enthusiastic about Bangladeshi food 
<br />and other basic need things so we can help our clients 
<br />discover whatever they require in Brisbane. We precisely 
<br />select the best quality items whether local or Desi to serve 
<br />our clients. Customer service is our highest priority and we 
<br />make sure that you have a good experience at MixandMatch Grocery.
<br />
<br />
As of now Mix & Match Grocery is the newest and the biggest
<br /> Bangladeshi store in Brisbane. Our product range for 
<br />Bangladeshi Items include:
</h4>
            
<h4 class="listtext">
<ul>
<li>Rice</li>
<li>Dals</li>
<li>Fish</li>
<li>Flours</li>
<li>Frozen</li>
<li>Snacks & Packed Food</li>
<li>Spices</li>
<li>Drinks</li>
<li>Cooking Ingredients</li>
</ul>
</h4>
        
<p class="aboutimage">
<asp:Image ID="Image2" runat="server" />
<img src="About Us/about.jpg" style="height: 250px; width: 350px;"/></p>

</div>
</main>

<footer>
<div class="content-wrap">
<p>&copy; Mix & Match Groceries. All Rights Reserved</p>
</div>
</footer>

</div>
        
       
    </form>
</body>
</html>
