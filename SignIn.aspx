<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Grocery_Demo.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="CSS/Skeleton.css" rel="stylesheet" />
    <link href="CSS/homebutton.css" rel="stylesheet" />
    <link href="CSS/login.css" rel="stylesheet" />
    <link href="CSS/text.css" rel="stylesheet" />
    <link href="CSS/headingtext.css" rel="stylesheet" />
    
</head>
    <body>
    <form id="form1" runat="server">
     
     <div id="site-wrapper">
      
      <header>
      <div class="content-wrap">
      <div class="logo">
      <asp:Image ID="Image1" runat="server" />
      <img src="Grocery Image/logo.jpg" style="height:105px; width:800px; margin-left:350px" />
      </div>
      </div>
      </header>
       <br />

      <main>
      <div class="content-wrap">

      <div class="homebutton">
      <a href="Homepage.aspx">
      <img src="Home Button/home button.png" style="height:75px; width:90px" />
      </a>
      </div>
      <br />
      <h3 class="headingtext">
      <strong>SIGN IN</strong>
      </h3>

      <div class="login">

      <br />
                        
      <asp:Table ID="Table1" runat="server" align="center">
      <asp:TableRow ID="TableRow1" runat="server">
      <asp:TableCell HorizontalAlign="Right">
      <asp:Label ID="Label1" Text="Username" runat="server" Font-Bold="True"> 
      </asp:Label>
      </asp:TableCell>
      <asp:TableCell HorizontalAlign="Left">
          <br />
      <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
          <br />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage=" Please enter your username" Font-Bold="True"></asp:RequiredFieldValidator>
      </asp:TableCell>
      </asp:TableRow>
         
      <asp:TableRow ID="TableRow2" runat="server">
      <asp:TableCell HorizontalAlign="Right">
      <asp:Label ID="Label2" Text="Password" runat="server" Font-Bold="True"> 
      </asp:Label>
      </asp:TableCell>
      <asp:TableCell HorizontalAlign="Left">
          <br />
      <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
          <br />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage=" Please enter your password" Font-Bold="True"></asp:RequiredFieldValidator>
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
        <br />
       <br />           
       <br />
       <h3 class="text">
       If you are not registered then please
       <asp:LinkButton ID="LinkButton1" runat="server" OnClick="SignUp_Click" PostBackUrl="~/SignUp.aspx" CausesValidation="False">Sign Up</asp:LinkButton>
       </h3>
                
      </div>
      </main>

      <footer>
      <div class="content-wrap">
      <p>&copy; 2018 Mix & Match Groceries. All Rights Reserved</p>
      </div>
      </footer>
      </div>
    
   </form>
</body>
</html>
