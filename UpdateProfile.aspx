<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProfile.aspx.cs" Inherits="Grocery_Demo.UpdateProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/DropDown.css" rel="stylesheet" />
    <link href="CSS/HomePage.css" rel="stylesheet" />
    <link href="CSS/headingtext.css" rel="stylesheet" />
    <link href="CSS/updateprofile.css" rel="stylesheet" />
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
   
        <div class="headingtext">
        <strong>Edit Your Profile</strong>
        </div>
        
       <asp:HiddenField ID="HiddenField1" runat="server" />
        
        <div class="updateprofile">
        <br />
        <asp:Table ID="Table1" runat="server" align="center" Width="774px" >
            
            <asp:TableRow ID="TableRow1" runat="server">
            <asp:TableCell HorizontalAlign="Right">
            <asp:Label ID="Label3" Text="Name" runat="server" Font-Bold="True"> 
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage=" Alphabets only" Font-Bold="True" ValidationExpression="^[a-zA-Z\s]*$"></asp:RegularExpressionValidator>
            </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="TableRow2" runat="server">
            <asp:TableCell HorizontalAlign="Right">
            <asp:Label ID="Label4" Text="Username" runat="server" Font-Bold="True"> 
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">            
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            </asp:TableCell>
            </asp:TableRow>
                       
            <asp:TableRow ID="TableRow3" runat="server">
            <asp:TableCell HorizontalAlign="Right">
            <asp:Label ID="Label5" Text= "Password" runat="server" Font-Bold="True">
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
            <asp:TextBox ID="TextBox3" TextMode="Password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            </asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow ID="TableRow4" runat="server">
            <asp:TableCell HorizontalAlign="Right">           
            <asp:Label ID ="Label6" Text="Phone No" runat="server" Font-Bold="True">
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage=" Numbers only" Font-Bold="True" ValidationExpression="^[0-9]*$" />           
            </asp:TableCell></asp:TableRow><asp:TableRow ID="TableRow5" runat="server">
            <asp:TableCell HorizontalAlign="Right">
            <asp:Label ID ="Label7" Text="Email" runat="server" Font-Bold="True">
            </asp:Label> 
            </asp:TableCell><asp:TableCell HorizontalAlign="Left">           
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage=" Email should have @ and .com" Font-Bold="True" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
            </asp:TableCell></asp:TableRow></asp:Table><br />
           <asp:Button ID="Button8" runat="server" OnClick="Edit_Click" Text="Edit"  />
          </div>
 
    </form>
</body>
</html>
