<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Grocery_Demo.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="CSS/Skeleton.css" rel="stylesheet" />
    <link href="CSS/homebutton.css" rel="stylesheet" />
    <link href="CSS/registration.css" rel="stylesheet" />
    <link href="CSS/headingtext.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
      
      <div id="site-wrapper">
      
      <header>
      <div class="content-wrap">
      <div class="logo">
      <asp:Image ID="Image1" runat="server" />
      <img src="Grocery Image/logo.jpg" style="height:105px; width:800px; margin-left:350px" /></div>
       <br />
       </div>
       </header>

        <main>
        <div class="content-wrap">

        <div class="homebutton">
        <a href="Homepage.aspx">
        <img src="Home Button/home button.png" style="height:75px; width:90px" />
        </a>
        </div>
        <br />
        <h3 class="headingtext">
        <strong>SIGN UP</strong>
        </h3>
        
        <div class="registration">
         
        <asp:Table ID="Table1" runat="server" align="center" >
            
            <asp:TableRow ID="TableRow1" runat="server">
            <asp:TableCell HorizontalAlign="Right">
                <br />
            <asp:Label ID="Label1" Text="Name" runat="server" Font-Bold="True"> 
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage=" Alphabets only" Font-Bold="True" ValidationExpression="^[a-zA-Z\s]*$"></asp:RegularExpressionValidator>
            </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="TableRow2" runat="server">
            <asp:TableCell HorizontalAlign="Right">
                <br />
            <asp:Label ID="Label2" Text="Username" runat="server" Font-Bold="True"> 
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <br />            
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            </asp:TableCell>
            </asp:TableRow>
                       
            <asp:TableRow ID="TableRow3" runat="server">
            <asp:TableCell HorizontalAlign="Right">
                <br />
            <asp:Label ID="Label3" Text= "Password" runat="server" Font-Bold="True">
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <br />
            <asp:TextBox ID="TextBox3" TextMode="Password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            </asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow ID="TableRow4" runat="server">
            <asp:TableCell HorizontalAlign="Right">
                <br />           
            <asp:Label ID ="Label4" Text="Phone No" runat="server" Font-Bold="True">
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <br />
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage=" Numbers only" Font-Bold="True" ValidationExpression="^[0-9]*$" />           
            </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="TableRow5" runat="server">
            <asp:TableCell HorizontalAlign="Right">
                <br />
            <asp:Label ID ="Label5" Text="Email" runat="server" Font-Bold="True">
            </asp:Label> 
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <br />           
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage=" Email should have @ and .com" Font-Bold="True" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
            </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="TableRow6" runat="server">
            <asp:TableCell HorizontalAlign="Right">
                <br />
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <br /> 
            <asp:DropDownList AppendDataBoundItems ="true" ID ="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Grocery_Branch_Name" DataValueField="Grocery_Branch_Name">
             <Items>
             <asp:ListItem Value="" >Select a Branch</asp:ListItem>
             </Items>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Grocery_DemoConnectionString %>" SelectCommand="SELECT [Grocery_Branch_Name] FROM [Grocery_Branch]"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList1" ErrorMessage=" Branch is not selected" Font-Bold="True"></asp:RequiredFieldValidator>
            </asp:TableCell>         
            </asp:TableRow>
            

            <asp:TableRow ID="TableRow7" runat="server">
            <asp:TableCell HorizontalAlign="Right">
                <br />
            <asp:Label ID ="Label6" Text="Token Number" runat="server" Font-Bold="True">
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                 <br />            
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            <asp:Label ID="Label7" runat="server"></asp:Label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox6" ErrorMessage=" Numbers only" Font-Bold="True" ValidationExpression="^[0-9]*$" />           
            </asp:TableCell>
            </asp:TableRow>
            
            </asp:Table>
            <br />
           <asp:Button ID="Button1" runat="server" OnClick="Register" Text="Register" />
            <br />
            <br />
            
           </div>

        </div>
        </main>

        <br/>

        <footer>
        <div class="content-wrap">
        <p>&copy; Mix & Match Groceries. All Rights Reserved</p>
        </div>
        </footer>
    
    </div>
            
            
    
    </form>
    </body>
</html>
