<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBranch.aspx.cs" Inherits="Grocery_Demo.ViewBranch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="CSS/HomePage.css" rel="stylesheet" />
<link href="CSS/DropDown.css" rel="stylesheet" />
<link href="CSS/displaybranch.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

         <div style="text-align:right">
         <div style="text-align:left" class="dropdown">
         <button class="dropbtn"><asp:Label ID="Label2" runat="server" ></asp:Label></button>
         <div style="text-align:left" class="dropdown-content">
         <a href="ViewProfile.aspx">View Profile</a>
         <a href="UpdateProfile.aspx">Edit Profile</a>
         <a href="HomePage.aspx">Logout</a>
         </div>
         </div>
         </div>

         <div class="displaybranch">
         <asp:Label ID="Label1" runat="server" Font-Bold="true"></asp:Label>
         &nbsp;<strong>Branch</strong> 
         </div>

        <p class="logo">
            <asp:Image ID="Image1" runat="server" />
            <img alt="" class="auto-style1" src="Grocery Image/logo.jpg" /></p>

        <p class="menu">
            <asp:Button ID="Button1" runat="server" PostBackUrl="~/AdminHomepage.aspx" CausesValidation="False" Text="Home" Width="127px" Font-Bold="True" />
            <asp:Button ID="Button2" runat="server" PostBackUrl="~/AddProducts.aspx" CausesValidation="False" Text="Add Products" Width="127px" Font-Bold="True" />
            <asp:Button ID="Button3" runat="server" PostBackUrl="~/AdminViewProducts.aspx" CausesValidation="False" Text="View Products" Width="127px" Font-Bold="True" />
            <asp:Button ID="Button4" runat="server" PostBackUrl="~/UpdateProducts.aspx" CausesValidation="False" Text="Update Products" Width="127px" Font-Bold="True" />
            <asp:Button ID="Button5" runat="server" PostBackUrl="~/AddPromotion.aspx" CausesValidation="False" Text="Add Promotion" Width="127px" Font-Bold="True" />
            <asp:Button ID="Button6" runat="server" PostBackUrl="~/ViewBranch.aspx" CausesValidation="False" Text="Branches" Width="127px" Font-Bold="True" />
            <asp:Button ID="Button7" runat="server" PostBackUrl="~/ViewAdmin.aspx" CausesValidation="False" Text="Administrators" Width="127px" Font-Bold="True" />
        </p>
        <br/>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center">
        <Columns>
         <asp:BoundField DataField="Grocery_Branch_No" HeaderText="Branch No" />
         <asp:BoundField DataField="Grocery_Branch_Name" HeaderText="Branch Name" />
         <asp:BoundField DataField="Grocery_Branch_Address" HeaderText="Branch Address" />
         <asp:BoundField DataField="Grocery_Phone_No" HeaderText="Branch Phone" />
         </Columns>
        </asp:GridView>    
    </form>
</body>
</html>
