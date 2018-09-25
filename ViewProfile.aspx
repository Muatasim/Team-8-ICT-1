<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProfile.aspx.cs" Inherits="Grocery_Demo.ViewProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View your profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="CSS/Skeleton.css" rel="stylesheet" />
<link href="CSS/DropDown.css" rel="stylesheet" />
<link href="CSS/headingtext.css" rel="stylesheet" />
<link href="CSS/viewprofile.css" rel="stylesheet" />
<link href="CSS/displaybranch.css" rel="stylesheet" />
<link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="site-wrapper">        
        <header>

         <div style="text-align:right">
         <div style="text-align:left" class="dropdown">
         <button class="dropbtn"><asp:Label ID="Label2" runat="server" ></asp:Label></button>
         <div style="text-align:left" class="dropdown-content">
         <a href="ViewProfile.aspx">View Profile</a>
         <a href="UpdateProfile.aspx">Edit Profile</a>
         <a href="Homepage.aspx">Logout</a>
         </div>
         </div>
         </div>
        
        <h3 class="displaybranch">
         <asp:Label ID="Label1" runat="server" Font-Bold="true"></asp:Label>
         &nbsp;<strong>Branch</strong> 
         </h3>
              
        <div class="content-wrap">
        <div class="logo">
            <asp:Image ID="Image1" runat="server" />
            <img alt="" class="auto-style1" src="Grocery Image/logo.jpg" style="height:105px; width:800px; margin-left:350px" />

        </div>
         <br />
         <div class="menu">
            <asp:Button ID="Button1" Class="btn-success" runat="server" PostBackUrl="~/AdminHomepage.aspx" CausesValidation="False" Text="Home" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
            <asp:Button ID="Button2" Class="btn-success" runat="server" PostBackUrl="~/AddProducts.aspx" CausesValidation="False" Text="Add Products" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
            <asp:Button ID="Button3" Class="btn-success" runat="server" PostBackUrl="~/AdminViewProducts.aspx" CausesValidation="False" Text="Products" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
            <asp:Button ID="Button4" Class="btn-success" runat="server" PostBackUrl="~/UpdateProducts.aspx" CausesValidation="False" Text="Update Products" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
            <asp:Button ID="Button5" Class="btn-success" runat="server" PostBackUrl="~/AddPromotion.aspx" CausesValidation="False" Text="Add Promotion" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
            <asp:Button ID="Button6" Class="btn-success" runat="server" PostBackUrl="~/ViewBranch.aspx" CausesValidation="False" Text="Branches" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
            <asp:Button ID="Button7" Class="btn-success" runat="server" PostBackUrl="~/ViewAdmin.aspx" CausesValidation="False" Text="Administrators" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
        </div>
        </div>
        </header>
            <br />
            <br />
        <main>
        <div class="content-wrap">
         
        <h3 class="headingtext">
        <strong>Your Profile</strong>
        </h3>
        <br />
        <div>
        <div class="viewprofile">
        <br />
            <h4>
        <asp:Table ID="Table1" runat="server" align="center" Width="394px" Height="150px" >
            
        <asp:TableRow ID="TableRow1" runat="server">
        <asp:TableCell HorizontalAlign="Left">
        <asp:Label ID="Label3" Text="Name:" runat="server" Font-Bold="True"> 
        </asp:Label>
        </asp:TableCell>
        <asp:TableCell HorizontalAlign="Right">
        <asp:Label ID="Label4" runat="server"> 
        </asp:Label>
        </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow ID="TableRow2" runat="server">
        <asp:TableCell HorizontalAlign="Left">
        <asp:Label ID="Label5" Text="Username:" runat="server" Font-Bold="True"> 
        </asp:Label>
        </asp:TableCell>
        <asp:TableCell HorizontalAlign="Right">
        <asp:Label ID="Label6" runat="server"> 
        </asp:Label>
        </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow ID="TableRow3" runat="server">
        <asp:TableCell HorizontalAlign="Left">
        <asp:Label ID="Label7" Text="Password:" runat="server" Font-Bold="True"> 
        </asp:Label>
        </asp:TableCell>
        <asp:TableCell HorizontalAlign="Right">
        <asp:Label ID="Label8" runat="server"> 
        </asp:Label>
        </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow ID="TableRow4" runat="server">
        <asp:TableCell HorizontalAlign="Left">
        <asp:Label ID="Label9" Text="Phone No:" runat="server" Font-Bold="True"> 
        </asp:Label>
        </asp:TableCell>
        <asp:TableCell HorizontalAlign="Right">
        <asp:Label ID="Label10" runat="server"> 
        </asp:Label>
        </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow ID="TableRow5" runat="server">
        <asp:TableCell HorizontalAlign="Left">
        <asp:Label ID="Label11" Text="Email:" runat="server" Font-Bold="True"> 
        </asp:Label>
        </asp:TableCell>
        <asp:TableCell HorizontalAlign="Right">
        <asp:Label ID="Label12" runat="server"> 
        </asp:Label>
        </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
                </h4>
       </div>
      
        </div>
      
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
