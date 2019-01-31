<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="Grocery_Demo.AddProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Add Products</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="CSS/Skeleton.css" rel="stylesheet" />
<link href="CSS/DropDown.css" rel="stylesheet" />
<link href="Content/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
<form id="form1" runat="server">

<div id="site-wrapper">
<header>
           <div class="container">
                    <div class="jumbotron" style="height: 380px; width: 1145px;">

                        <table style="width: 100%">
                            <tr>
                                <td>

                                </td>
                                <td>
                                 <h2 style="color:#47a447";>
                            <asp:Label ID="Label1" runat="server" Font-Bold="true" Style="color:#47a447; font-size: 30px;"></asp:Label>
                            &nbsp;<strong style="font-size: 30px;">Branch</strong>
                                 </h2>
                                </td>
                                <td>
                                     <div style="text-align: right">
                                        <div style="text-align: left" class="dropdown">
                                            <button class="dropbtn">
                                                <asp:Label ID="Label2" runat="server"></asp:Label></button>
                                            <div style="text-align: left" class="dropdown-content">
                                                <a href="ViewProfile.aspx">View Profile</a>
                                                <a href="UpdateProfile.aspx">Edit Profile</a>
                                                <a href="Homepage.aspx">Logout</a>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="Pictures/Logo.png" style="height: 150px; width: 150px; position: relative" /></td>
                                <td>
                                    <h5 style="text-align: center; font-size: 40px; color: #47a447; text-align: left">Add a New Product</h5>
                                </td>
                                <td>
                                   
                                </td>
                            </tr>
                        </table>                            
                           
                            <div class="menu">
                                <asp:Button ID="Button1" Class="btn-success" runat="server" PostBackUrl="~/AdminHomepage.aspx" CausesValidation="False" Text="Home" Width="100px" Height="50px" Font-Bold="False"/>
                                <asp:Button ID="Button2" Class="btn-success" runat="server" PostBackUrl="~/AddProducts.aspx" CausesValidation="False" Text="Add Products" Width="142px" Height="50px" Font-Bold="False"/>
                                <asp:Button ID="Button3" Class="btn-success" runat="server" PostBackUrl="~/AdminViewProducts.aspx" CausesValidation="False" Text="Products" Width="110px" Height="50px" Font-Bold="False"/>
                                <asp:Button ID="Button4" Class="btn-success" runat="server" PostBackUrl="~/UpdateProducts.aspx" CausesValidation="False" Text="Update Products" Width="170px" Height="50px" Font-Bold="False"/>
                                <asp:Button ID="Button5" Class="btn-success" runat="server" PostBackUrl="~/AddPromotion.aspx" CausesValidation="False" Text="Add Promotion" Width="160px" Height="50px" Font-Bold="False"/>
                                <asp:Button ID="Button6" Class="btn-success" runat="server" PostBackUrl="~/ViewBranch.aspx" CausesValidation="False" Text="Branches" Width="110px" Height="50px" Font-Bold="False"/>
                                <asp:Button ID="Button7" Class="btn-success" runat="server" PostBackUrl="~/ViewAdmin.aspx" CausesValidation="False" Text="Administrators" Width="155px" Height="50px" Font-Bold="False"/>
                            </div>
                        
                        <br />
                        <br />
                    </div>
                </div>

</header>

<div class="container">
        <div class="jumbotron" style="height: 800px; width: 1145px;">

<asp:Table ID="Table1" runat="server" align="center" >

<asp:TableRow ID="TableRow1" runat="server">
<asp:TableCell HorizontalAlign="Right">
<asp:Label ID="Label3" Text="Image" runat="server" Font-Bold="False">     
</asp:Label>
</asp:TableCell>
<asp:TableCell HorizontalAlign="Left">
    <br />
<asp:FileUpload ID="FileUpload1" runat="server" Width="500px" />
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Image is required" Font-Bold="False"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Image only" Font-Bold="False" ValidationExpression="^([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.jpeg|.gif|.bmp)$"></asp:RegularExpressionValidator>
</asp:TableCell>
</asp:TableRow>

<asp:TableRow ID="TableRow2" runat="server">
<asp:TableCell HorizontalAlign="Right">
<br />
<asp:Label ID="Label4" Text="Name" runat="server" Font-Bold="False"> 
</asp:Label>
</asp:TableCell>
<asp:TableCell HorizontalAlign="Left">
<br />
<asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage=" This field is required" Font-Bold="False"></asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage=" Alphabets only" Font-Bold="False" ValidationExpression="^[a-zA-Z\s]*$"></asp:RegularExpressionValidator>
</asp:TableCell>
</asp:TableRow>

<asp:TableRow ID="TableRow3" runat="server">
<asp:TableCell HorizontalAlign="Right">
<br />
<asp:Label ID ="Label5" Text="Category" runat="server" Font-Bold="False">
            </asp:Label> 
</asp:TableCell>
<asp:TableCell HorizontalAlign="Left">   
<br />   
<asp:DropDownList AppendDataBoundItems ="true" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Product_Category_Name" DataValueField="Product_Category_Name">
<Items>
<asp:ListItem Value="">Select a Category</asp:ListItem>
</Items>
</asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Grocery_DemoConnectionString %>" SelectCommand="SELECT Product_Category_Name FROM Product_Category"></asp:SqlDataSource>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" ErrorMessage=" Category is not selected" Font-Bold="False"></asp:RequiredFieldValidator>
</asp:TableCell>         
</asp:TableRow>

<asp:TableRow ID="TableRow4" runat="server">
<asp:TableCell HorizontalAlign="Right">
<br />
<asp:Label ID="Label6" Text="Price" runat="server" Font-Bold="False"> 
</asp:Label>
</asp:TableCell>
<asp:TableCell HorizontalAlign="Left">
<br />
<asp:TextBox ID="TextBox2" runat="server" Width="80px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage=" This field is required" Font-Bold="False"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage=" After decimal only 2 numbers" Font-Bold="False" ValidationExpression="^\d{1,9}\.\d{1,2}$"></asp:RegularExpressionValidator>
</asp:TableCell>         
</asp:TableRow>

<asp:TableRow ID="TableRow5" runat="server">
<asp:TableCell HorizontalAlign="Right">
<br />
<asp:Label ID="Label7" Text="Quantity" runat="server" Font-Bold="False"> 
</asp:Label>
</asp:TableCell>
<asp:TableCell HorizontalAlign="Left">
<br />
<asp:TextBox ID="TextBox3" runat="server" Width="60px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox3" ErrorMessage=" This field is required" Font-Bold="False"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage=" Numbers only" Font-Bold="False" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
<asp:Label ID="Label8" runat="server" Font-Bold="false"></asp:Label>
</asp:TableCell>         
</asp:TableRow>

<asp:TableRow ID="TableRow6" runat="server">
<asp:TableCell HorizontalAlign="Right">
<br />
<asp:Label ID="Label9" Text="Barcode" runat="server" Font-Bold="False"> 
</asp:Label>
</asp:TableCell>
<asp:TableCell HorizontalAlign="Left">
<br />
<asp:TextBox ID="TextBox4" runat="server" Width="260px"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage=" Numbers only" Font-Bold="False" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
</asp:TableCell>         
</asp:TableRow>
    
<asp:TableRow ID="TableRow7" runat="server">
<asp:TableCell HorizontalAlign="Right">
    
</asp:TableCell>  
<asp:TableCell HorizontalAlign="Center">
    <br />
<asp:Button ID="Button8" runat="server" OnClick="Add_Click" Text="Add Product" />
</asp:TableCell>   
       
</asp:TableRow>
</asp:Table>

<br />

<br />
<br />
</div>

</div>
    
</div>



<br />

<div class="container">
            <div class="jumbotron" style="height: 100px; width: 1145px; background-color: #5cb85c;">
                <p style="text-align: center; color: #ffffff; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size: medium">
                    &copy; <strong>Mix & Match Groceries. All Rights Reserved</strong>
                </p>
            </div>
        </div>
         
</form>
</body>
</html>
