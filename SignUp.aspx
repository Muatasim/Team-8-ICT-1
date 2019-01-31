<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Grocery_Demo.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign up</title>    
    <link href="CSS/Skeleton.css" rel="stylesheet" />
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
                    <div class="jumbotron" style="height: 350px; width: 1145px;">
                        <table style="width: 100%">
                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <div style="text-align: right; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">
                                        <h4><strong>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignIn.aspx" Style="color: #47a447; font-size: 20px;">Sign In</asp:HyperLink>
                                            &nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SignUp.aspx" Style="color: #47a447; font-size: 20px;display: none;">Sign Up</asp:HyperLink>&nbsp;</strong></h4>
                                    </div>


                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="Pictures/Logo.png" style="height: 150px; width: 150px; position: relative" /></td>
                                <td>
                                    <h4 style="text-align: center; font-size: 40px; color: #47a447; text-align: left">Mix & Match Member Registration</h4>
                                </td>
                                <td></td>
                            </tr>
                        </table>

                        <div class="menu">
                            <asp:Button ID="Button2" Class="btn-success" runat="server" PostBackUrl="~/Homepage.aspx" CausesValidation="False" Text="Home" Width="142px" />
                            <asp:Button ID="Button3" Class="btn-success" runat="server" PostBackUrl="~/Promotion.aspx" CausesValidation="False" Text="Promotions" Width="142px" Font-Bold="false" />
                            <asp:Button ID="Button4" Class="btn-success" runat="server" PostBackUrl="~/ViewProducts.aspx" CausesValidation="False" Text="Products" Width="142px" Font-Bold="false" />
                            <asp:Button ID="Button5" Class="btn-success" runat="server" PostBackUrl="~/AboutUs.aspx" CausesValidation="False" Text="About Us" Width="142px" Font-Bold="false" />
                            <asp:Button ID="Button6" Class="btn-success" runat="server" PostBackUrl="~/ContactUs.aspx" CausesValidation="False" Text="Contact Us" Width="142px" Font-Bold="false" />
                        </div>
                    </div>

                </div>

       </header>

        <main>
        <div class="content-wrap">
        
       <div class="container">
                    <div class="jumbotron" style="height: 850px; width: 1145px;">
         
        <asp:Table ID="Table1" runat="server" align="center" >
            
            <asp:TableRow ID="TableRow1" runat="server">
            <asp:TableCell HorizontalAlign="Right">
                <br />
            <asp:Label ID="Label1" Text="Name" runat="server" Font-Bold="False"> 
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
            <asp:Label ID="Label2" Text="Username" runat="server" Font-Bold="False"> 
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
            <asp:Label ID="Label3" Text= "Password" runat="server" Font-Bold="False">
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
            <asp:Label ID ="Label4" Text="Phone No" runat="server" Font-Bold="False">
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
            <asp:Label ID ="Label5" Text="Email" runat="server" Font-Bold="False">
            </asp:Label> 
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <br />           
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage=" Please enter a valid email" Font-Bold="True" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
            </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="TableRow6" runat="server">
            <asp:TableCell HorizontalAlign="Right">
                <br />
                 <asp:Label ID ="Label8" Text="Branch" runat="server" Font-Bold="False">
            </asp:Label> 
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
            <asp:Label ID ="Label6" Text="Token Number" runat="server" Font-Bold="False">
            </asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                 <br />            
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6" ErrorMessage=" This field is required" Font-Bold="True"></asp:RequiredFieldValidator>
            <asp:Label ID="Label7" runat="server" Font-Bold="True"></asp:Label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox6" ErrorMessage=" Numbers only" Font-Bold="True" ValidationExpression="^[0-9]*$" />           
            </asp:TableCell>
            </asp:TableRow>  
            <asp:TableRow ID="TableRow8" runat="server">
            <asp:TableCell HorizontalAlign="Right">                
           
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">  
                <br />              
            <asp:Button ID="Button1" runat="server" OnClick="Register" Text="Register" Width="100px" />
            </asp:TableCell>
            </asp:TableRow>            
            </asp:Table>
            <br />
           
            <br />
            <br />
            
           </div>

        </div>

            </div>
        </main>

        <br/>

          <div class="container">
            <div class="jumbotron" style="height: 100px; width: 1145px; background-color: #5cb85c;">
                <p style="text-align: center; color: #ffffff; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size: medium">
                    &copy; <strong>Mix & Match Groceries. All Rights Reserved</strong>
                </p>
            </div>
        </div>
    
    </div>
            
            
    
    </form>
    </body>
</html>
