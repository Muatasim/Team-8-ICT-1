<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Grocery_Demo.AboutUs" %>

<%= System.Web.Helpers.AntiForgery.GetHtml() %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Mix and Match</title>    
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
                                            &nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SignUp.aspx" Style="color: #47a447; font-size: 20px">Sign Up</asp:HyperLink>&nbsp;</strong></h4>
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="Pictures/Logo.png" style="height: 150px; width: 150px; position: relative" /></td>
                                <td>
                                    <h4 style="text-align: center; font-size: 40px; color: #47a447; text-align: left">About Us</h4>
                                </td>
                                <td></td>
                            </tr>
                        </table>

                        <div class="menu">
                            <asp:Button ID="Button1" Class="btn-success" runat="server" PostBackUrl="~/Homepage.aspx" Text="Home" Width="142px" />
                            <asp:Button ID="Button2" Class="btn-success" runat="server" PostBackUrl="~/Promotion.aspx" Text="Promotions" Width="142px" Font-Bold="false" />
                            <asp:Button ID="Button3" Class="btn-success" runat="server" PostBackUrl="~/ViewProducts.aspx" Text="Products" Width="142px" Font-Bold="false" />
                            <asp:Button ID="Button4" Class="btn-success" runat="server" PostBackUrl="~/AboutUs.aspx" Text="About Us" Width="142px" Font-Bold="false" />
                            <asp:Button ID="Button5" Class="btn-success" runat="server" PostBackUrl="~/ContactUs.aspx" Text="Contact Us" Width="142px" Font-Bold="false" />
                        </div>
                    </div>

                </div>
            </header>
            
            <main>

                <div class="container">
                    <div class="jumbotron" style="height: 450px; width: 1145px;">
                        <table>
                        <tr>
                            <td><p style="color:#47a447;"> <b>We are extremely enthusiastic about Bangladeshi food               
                                and other basic need things so we can help our clients                                 
                                discover whatever they require in Brisbane. We precisely                               
                                select the best quality items whether local or Desi to serve                                 
                                our clients. Customer service is our highest priority and we                                
                                make sure that you have a good experience at MixandMatch Grocery.                               
                                As of now Mix & Match Grocery is the newest and the biggest                                
                                Bangladeshi store in Brisbane. Our product range for
                                
                                Bangladeshi Items include:</b>

                                </p>
                                <ul style="color:#47a447"><b>
                            <li>Rice</li>
                            <li>Dals</li>
                            <li>Fish</li>
                            <li>Flours</li>
                            <li>Frozen</li>
                            <li>Snacks & Packed Food</li>
                            <li>Spices</li>
                            <li>Drinks</li>
                            <li>Cooking Ingredients</li>
                        </b></ul>
                            </td>
                           
                            <td>
                                &nbsp; &nbsp;                       
                    </td>                                             
                        
                     <td>
                        <asp:Image ID="Image2" runat="server" />
                        <img src="About Us/about.jpg" style="height: 325px; width: 450px;" />
                    </td>                                
                            </tr>
                            
                        </table>
                        
                    </div>

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
