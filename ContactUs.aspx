﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Grocery_Demo.ContactUs" %>
<%= System.Web.Helpers.AntiForgery.GetHtml() %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Contact Us</title>    
    <link href="CSS/Skeleton.css" rel="stylesheet" />
    <link href="CSS/map.css" rel="stylesheet" />
    <link href="CSS/address.css" rel="stylesheet" />
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
                                    <h4 style="text-align:center; font-size:40px; color:#47a447; text-align:left">Contact Us</h4>
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

        <br />
        <br />

        <main>
        <div class="content-wrap">

        <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3536.0051473446642!2d152.96096711512467!3d-27.593370028580253!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b914ee36b6b35b3%3A0x435768387d9844!2s39+Lavender+St%2C+Inala+QLD+4077!5e0!3m2!1sen!2sau!4v1537378633298" width="500" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>

         <br />

         <h4 class="address">
            <strong>39 Lavender Street,<br />
            Inala, QLD 4077 <br />
            Contact No: 0451138852 </strong>
         </h4>

        </div> 
        </main>
           
        <br />
         
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
