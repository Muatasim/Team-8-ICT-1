<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Grocery_Demo.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign in</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="CSS/Skeleton.css" rel="stylesheet" />
    <link href="CSS/text.css" rel="stylesheet" />
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
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignIn.aspx" Style="color: #47a447; font-size: 20px; display: none">Sign In</asp:HyperLink>
                                            &nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SignUp.aspx" Style="color: #47a447; font-size: 20px">Sign Up</asp:HyperLink>&nbsp;</strong></h4>
                                    </div>


                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="Pictures/Logo.png" style="height: 150px; width: 150px; position: relative" /></td>
                                <td>
                                    <h4 style="text-align: center; font-size: 40px; color: #47a447; text-align: left">Mix & Match Member Login</h4>
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
            <br />

            <main>
                <div class="content-wrap">

                    <div class="container">
                        <div class="jumbotron" style="height:400px; width: 1145px; align-self: center;">

                            <table>
                                <tr>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td><asp:Label ID="Label1" Text="Username" runat="server" Font-Bold="False"> 
                                        </asp:Label></td>
                                    <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage=" Please enter your username" Font-Bold="False"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td><asp:Label ID="Label2" Text="Password" runat="server" Font-Bold="False"></asp:Label> </td>
                                    <td><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
                                    <td> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage=" Please enter your password" Font-Bold="False"></asp:RequiredFieldValidator></td>
                                </tr>
                                 <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td> <asp:Button ID="Button1" runat="server" OnClick="Log_In" Text="Login" Font-Bold="False" Width="100px" /></td>
                                    <td> <asp:Label ID="Label3" runat="server" Font-Bold="False"></asp:Label></td>
                                </tr>
                            </table>
                          
                            <br />
                            <h3 class="text">If you are not registered then please
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="SignUp_Click" PostBackUrl="~/SignUp.aspx" CausesValidation="False" Style="color: #47a447;">Sign Up</asp:LinkButton>
                            </h3>
                        </div>
                    </div>

                    <br />


                </div>
            </main>

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
