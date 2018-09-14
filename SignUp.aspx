<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Grocery_Demo.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/HomePage.css" rel="stylesheet" />
    <link href="CSS/registration.css" rel="stylesheet" />
    <link href="CSS/headingtext.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
      <p class="logo">
            <asp:Image ID="Image1" runat="server" />
            <img alt="" class="auto-style1" src="Grocery Image/logo.jpg" /></p>
       
        <div class="headingtext">
        <strong>SIGN UP</strong>
        </div>
        
        <div class="registration">
        
        <br />
        <asp:Table ID="Table1" runat="server" align="center" >
            
            <asp:TableRow ID="TableRow1" runat="server">
            <asp:TableCell HorizontalAlign="Right">
            <asp:Label ID="Label1" Text="Name" runat="server" Font-Bold="True"> 
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
            <asp:Label ID="Label2" Text="Username" runat="server" Font-Bold="True"> 
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">            
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            </asp:TableCell>
            </asp:TableRow>
                       
            <asp:TableRow ID="TableRow3" runat="server">
            <asp:TableCell HorizontalAlign="Right">
            <asp:Label ID="Label3" Text= "Password" runat="server" Font-Bold="True">
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
            <asp:TextBox ID="TextBox3" TextMode="Password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            </asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow ID="TableRow4" runat="server">
            <asp:TableCell HorizontalAlign="Right">           
            <asp:Label ID ="Label4" Text="Phone No" runat="server" Font-Bold="True">
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage=" Numbers only" Font-Bold="True" ValidationExpression="^[0-9]*$" />           
            </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="TableRow5" runat="server">
            <asp:TableCell HorizontalAlign="Right">
            <asp:Label ID ="Label5" Text="Email" runat="server" Font-Bold="True">
            </asp:Label> 
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">           
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage=" Email should have @ and .com" Font-Bold="True" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
            </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="TableRow6" runat="server">
            <asp:TableCell HorizontalAlign="Right">
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left"> 
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
            <asp:Label ID ="Label6" Text="Token Number" runat="server" Font-Bold="True">
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">             
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            <asp:Label ID="Label7" runat="server"></asp:Label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage=" Numbers only" Font-Bold="True" ValidationExpression="^[0-9]*$" />           
            </asp:TableCell>
            </asp:TableRow>
            
            </asp:Table>
            <br />
           <asp:Button ID="Button1" runat="server" OnClick="Register" Text="Register" />
           </div>
            
            
    
    </form>
    </body>
</html>
