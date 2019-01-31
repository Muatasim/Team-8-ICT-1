<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Grocery_Demo.Homepage" %>
<%= System.Web.Helpers.AntiForgery.GetHtml() %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Mix & Match Groceries</title>    
    <link href="CSS/Skeleton.css" rel="stylesheet" />    
    <link href="CSS/brand.css" rel="stylesheet" />
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
                                <td><div style="text-align: right; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">
                                        <h4><strong>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignIn.aspx" Style="color: #47a447; font-size:20px; ">Sign In</asp:HyperLink>
                                            &nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SignUp.aspx" Style="color: #47a447; font-size:20px">Sign Up</asp:HyperLink>&nbsp;</strong></h4>
                                    </div>


                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="Pictures/Logo.png" style="height:150px; width:150px; position:relative"/></td>
                                <td>
                                    <h4 style="text-align:center; font-size:40px; color:#47a447; text-align:left">Welcome to Mix & Match Groceries</h4>
                                </td>
                                <td>
                                    
                                </td>
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

            <div class="container">
                <div class="jumbotron" style="height: 600px; width: 1145px;">

                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="Homepage Pics/sliderimage1.jpg" alt="First slide" style="height:500px;">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="Homepage Pics/sliderimage2.jpg" alt="Second slide" style="height:500px;">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="Homepage Pics/sliderimage3.jpg" alt="Third slide" style="height:500px;">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                </div>
            </div>



        </div>


        <div class="container">
            <div class="jumbotron" style="height: 175px; width: 1145px;">
                <h4 style="text-align: center; font-size:22px; color:#47a447"><strong>We have food products imported mainly from Bangladesh but we also do have 
    food products imported from India and Pakistan as well. Our stock has food products based on many categories such as Spices, Snacks, Rice, 
    Flour, Vegetables, Fruits, Drinks, Oil, Dairy etc.</strong> 
                </h4>

            </div>
        </div>

        <p class="brand">
            <asp:Image ID="Image3" runat="server" />
            <img src="Homepage Pics/brands.jpg" style="height: 135px; width: 740px" />
        </p>


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

