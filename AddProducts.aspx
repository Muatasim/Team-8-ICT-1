<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="Grocery_Demo.AddProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="CSS/Skeleton.css" rel="stylesheet" />
<link href="CSS/DropDown.css" rel="stylesheet" />
<link href="CSS/headingtext.css" rel="stylesheet" />
<link href="CSS/addproducts.css" rel="stylesheet" />
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
<img  src="Grocery Image/logo.jpg" style="height:105px; width:800px; margin-left:350px" /></div>
<br/>
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
<strong>Add a new product</strong>
</h3>

<div class="addproducts">

<br />
<asp:Table ID="Table1" runat="server" align="center" >

<asp:TableRow ID="TableRow1" runat="server">
<asp:TableCell HorizontalAlign="Right">
<br />
<asp:Label ID="Label3" Text="Image" runat="server" Font-Bold="True"> 
</asp:Label>
</asp:TableCell>
<asp:TableCell HorizontalAlign="Left">
<br />
<br />
<asp:FileUpload ID="FileUpload1" runat="server" Width="200px" />
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" ErrorMessage=" Image is required" Font-Bold="True"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileUpload1" ErrorMessage=" Image only" Font-Bold="True" ValidationExpression="^([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.jpeg|.gif|.bmp)$"></asp:RegularExpressionValidator>
</asp:TableCell>
</asp:TableRow>

<asp:TableRow ID="TableRow2" runat="server">
<asp:TableCell HorizontalAlign="Right">
<br />
<asp:Label ID="Label4" Text="Name" runat="server" Font-Bold="True"> 
</asp:Label>
</asp:TableCell>
<asp:TableCell HorizontalAlign="Left">
<br />
<asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
</asp:TableCell>
</asp:TableRow>

<asp:TableRow ID="TableRow3" runat="server">
<asp:TableCell HorizontalAlign="Right">
<br />
</asp:TableCell>
<asp:TableCell HorizontalAlign="Left">   
<br />   
<asp:DropDownList AppendDataBoundItems ="true" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Product_Category_Name" DataValueField="Product_Category_Name">
<Items>
<asp:ListItem Value="">Select a Category</asp:ListItem>
</Items>
</asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Grocery_DemoConnectionString %>" SelectCommand="SELECT Product_Category_Name FROM Product_Category"></asp:SqlDataSource>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" ErrorMessage=" Category is not selected" Font-Bold="True"></asp:RequiredFieldValidator>
</asp:TableCell>         
</asp:TableRow>

<asp:TableRow ID="TableRow4" runat="server">
<asp:TableCell HorizontalAlign="Right">
<br />
<asp:Label ID="Label5" Text="Price" runat="server" Font-Bold="True"> 
</asp:Label>
</asp:TableCell>
<asp:TableCell HorizontalAlign="Left">
<br />
<asp:TextBox ID="TextBox2" runat="server" Width="80px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage=" After decimal only 2 numbers" Font-Bold="True" ValidationExpression="^\d{1,9}\.\d{1,2}$"></asp:RegularExpressionValidator>
</asp:TableCell>         
</asp:TableRow>

<asp:TableRow ID="TableRow5" runat="server">
<asp:TableCell HorizontalAlign="Right">
<br />
<asp:Label ID="Label6" Text="Quantity" runat="server" Font-Bold="True"> 
</asp:Label>
</asp:TableCell>
<asp:TableCell HorizontalAlign="Left">
<br />
<asp:TextBox ID="TextBox3" runat="server" Width="60px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox3" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage=" Numbers only" Font-Bold="True" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
</asp:TableCell>         
</asp:TableRow>

<asp:TableRow ID="TableRow6" runat="server">
<asp:TableCell HorizontalAlign="Right">
<br />
<asp:Label ID="Label7" Text="Barcode" runat="server" Font-Bold="True"> 
</asp:Label>
</asp:TableCell>
<asp:TableCell HorizontalAlign="Left">
<br />
<asp:TextBox ID="TextBox4" runat="server" Width="260px"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage=" Numbers only" Font-Bold="True" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
</asp:TableCell>         
</asp:TableRow>

</asp:Table>
<br />
<asp:Button ID="Button8" runat="server" OnClick="Add_Click" Text="Add Product" />
<br />
<br />
</div>

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
