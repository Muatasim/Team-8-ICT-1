<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminViewProducts.aspx.cs" Inherits="Grocery_Demo.AdminViewProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Admin View Products</title>
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

<header>
         <div class="container">
                    <div class="jumbotron" style="height: 380px; width: 1245px;">

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
                                    <h5 style="text-align: center; font-size: 40px; color: #47a447; text-align: left">Admin Product Search</h5>
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
            <div class="jumbotron" style="height: 175px; width: 1245px;">
                <h2 style="text-align:center; color: #47a447;">
                    <strong>Search by Product Name</strong>
                </h2>

                <div>
                    <asp:Table ID="Table1" runat="server" align="center">
                        <asp:TableRow ID="TableRow1" runat="server">
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Left">
                                <asp:Button ID="Button8" runat="server" OnClick="Search_Product" ValidationGroup="SearchByName" Text="Search Product" />
                                
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="TableRow2" runat="server">
                            <asp:TableCell HorizontalAlign="Right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ValidationGroup="SearchByName" ErrorMessage=" Please enter a product name" Font-Bold="False"></asp:RequiredFieldValidator>
                               
                                </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                           
                                <asp:Label ID="Label3" runat="server" Font-Bold="false"></asp:Label>
                                </asp:TableCell>
                        </asp:TableRow>                      
                    </asp:Table>
                </div>
           </div>
            </div>


           <div class="container">
            <div class="jumbotron" style="height: 175px; width: 1245px;">               

                <h2 style="text-align:center; color: #47a447";>
                    <strong>View Product by Category</strong>
                </h2>
                
                <div>
                    <asp:Table ID="Table2" runat="server" align="center">
                        <asp:TableRow ID="TableRow4" runat="server">
                            
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:DropDownList AppendDataBoundItems="true" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Product_Category_Name" DataValueField="Product_Category_Name">
                                    <Items>
                                        <asp:ListItem Value="-1">Select a Category</asp:ListItem>
                                    </Items>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Grocery_DemoConnectionString %>" SelectCommand="SELECT Product_Category_Name FROM Product_Category"></asp:SqlDataSource>
                                
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Left">
                                <asp:Button ID="Button9" runat="server" OnClick="View_Option1" ValidationGroup="ViewByCategory" Text="View Product" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="TableRow5" runat="server">
                        <asp:TableCell HorizontalAlign="Left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" ValidationGroup="ViewByCategory" InitialValue="-1" ErrorMessage=" Please select a category" Font-Bold="False"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                            </asp:TableRow>
                    </asp:Table>                    
                    
                </div>
            </div>
            </div>



            <div class="container">
            <div class="jumbotron" style="height: 175px; width: 1245px;">               

                <h2 style="text-align:center; color: #47a447";>
                    <strong>View Product by Branch</strong>
                </h2>            
                <div>
                    <asp:Table ID="Table3" runat="server" align="center">
                        <asp:TableRow ID="TableRow6" runat="server">                           
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:DropDownList AppendDataBoundItems="true" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Grocery_Branch_Name" DataValueField="Grocery_Branch_Name">
                                    <asp:ListItem Value="-1">Select a Branch</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Grocery_DemoConnectionString %>" SelectCommand="SELECT Grocery_Branch_Name FROM Grocery_Branch"></asp:SqlDataSource>
                               
                            </asp:TableCell>
                             <asp:TableCell HorizontalAlign="Left">
                                 <asp:Button ID="Button10" runat="server" ValidationGroup="ViewByBranch" OnClick="View_Option2" Text="View Product" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="TableRow7" runat="server">                           
                            <asp:TableCell HorizontalAlign="Right">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList2" ValidationGroup="ViewByBranch" InitialValue="-1" ErrorMessage=" Please select a branch" Font-Bold="False"></asp:RequiredFieldValidator>
                                </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <br />
                    
                </div>
             </div>
             </div>


            <div class="container">
            <div class="jumbotron" style="height: 175px; width: 1245px;">               

                <h2 style="text-align:center; color: #47a447";>
                    <strong>View Product by Branch & Category</strong>
                </h2>   

                <div>
                    <asp:Table ID="Table4" runat="server" align="center">
                        <asp:TableRow ID="TableRow8" runat="server">                            
                            <asp:TableCell HorizontalAlign="Left">
                                <asp:DropDownList AppendDataBoundItems="true" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Product_Category_Name" DataValueField="Product_Category_Name">
                                    <asp:ListItem Value="-1">Select a Category</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Grocery_DemoConnectionString %>" SelectCommand="SELECT Product_Category_Name FROM Product_Category"></asp:SqlDataSource>                               
                            </asp:TableCell>                           
                            <asp:TableCell HorizontalAlign="Left">
                                <asp:DropDownList AppendDataBoundItems="true" ID="DropDownList4" runat="server" DataSourceID="SqlDataSource4" DataTextField="Grocery_Branch_Name" DataValueField="Grocery_Branch_Name">
                                    <asp:ListItem Value="-1">Select a Branch</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Grocery_DemoConnectionString %>" SelectCommand="SELECT Grocery_Branch_Name FROM Grocery_Branch"></asp:SqlDataSource>
                                
                            </asp:TableCell>
                             <asp:TableCell HorizontalAlign="Right">
                                 <asp:Button ID="Button11" runat="server" ValidationGroup="ViewByCategoryBranch" OnClick="View_Option3" Text="View Product" />
                            </asp:TableCell>                            
                        </asp:TableRow>
                        <asp:TableRow ID="TableRow9" runat="server">
                            <asp:TableCell HorizontalAlign="Left">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList3" ValidationGroup="ViewByCategoryBranch" InitialValue="-1" ErrorMessage="Please select a category" Font-Bold="False"></asp:RequiredFieldValidator>
                            </asp:TableCell>                                                    
                            <asp:TableCell HorizontalAlign="Right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList4" ValidationGroup="ViewByCategoryBranch" InitialValue="-1" ErrorMessage=" Please select a branch" Font-Bold="False"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                                </asp:TableRow>
                    </asp:Table>                  

                    
                </div>

             </div>
            </div>
          
         <div class="container">
            <div class="jumbotron" style="height: 1230px; width: 1245px;">   
                <div style="align-items:center;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" HeaderStyle-BackColor="#00a400" HeaderStyle-ForeColor="White">
                        <Columns>
                        <asp:BoundField DataField="Product_No" HeaderText="Product No" />
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="100px" Width="120px"
                                        ImageUrl='<%#"data:Image/png/jpg/jpeg/gif/bmp;base64," + Convert.ToBase64String((byte[])Eval("Product_Image")) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Product_Name" HeaderText="Product" />
                            <asp:BoundField DataField="Barcode_No" HeaderText="Barcode" />
                            <asp:BoundField DataField="Product_Category_Name" HeaderText="Category" />
                            <asp:BoundField DataField="Product_Price" HeaderText="Price" DataFormatString="{0:0.00} AUD" />
                            <asp:BoundField DataField="Product_Quantity" HeaderText="Quantity" />
                            <asp:BoundField DataField="Grocery_Branch_Name" HeaderText="Branch" />
                        </Columns>
                    </asp:GridView>

                    <br />
                    </div>
                 </div>


<div class="container">             
<table style="align-content: center; width: 1000px; font-size:large">
<tr>
<td>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
<asp:LinkButton ID="LinkButton1" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
Enabled='<%# Eval("Enabled") %>' OnClick="lnkbtn_PageIndexChanged" ForeColor="#00a400"></asp:LinkButton>
</ItemTemplate>
</asp:Repeater>
<asp:Repeater ID="Repeater2" runat="server">
<ItemTemplate>
<asp:LinkButton ID="LinkButton1" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
Enabled='<%# Eval("Enabled") %>' OnClick="lnkbtn_PageSearchIndexChanged" ForeColor="#00a400"></asp:LinkButton>
</ItemTemplate>
</asp:Repeater>
<asp:Repeater ID="Repeater3" runat="server">
<ItemTemplate>
<asp:LinkButton ID="LinkButton1" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
Enabled='<%# Eval("Enabled") %>' OnClick="lnkbtn_ViewOption1IndexChanged" ForeColor="#00a400"></asp:LinkButton>
</ItemTemplate>
</asp:Repeater>
<asp:Repeater ID="Repeater4" runat="server">
<ItemTemplate>
<asp:LinkButton ID="LinkButton1" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
Enabled='<%# Eval("Enabled") %>' OnClick="lnkbtn_ViewOption2IndexChanged" ForeColor="#00a400"></asp:LinkButton>
</ItemTemplate>
</asp:Repeater>
<asp:Repeater ID="Repeater5" runat="server">
<ItemTemplate>
<asp:LinkButton ID="LinkButton1" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
Enabled='<%# Eval("Enabled") %>' OnClick="lnkbtn_ViewOption3IndexChanged" ForeColor="#00a400"></asp:LinkButton>
</ItemTemplate>
</asp:Repeater>
</td>
</tr>
</table>


</div>

</div>


<br />

<div class="container">
            <div class="jumbotron" style="height: 100px; width: 1245px; background-color: #5cb85c;">
                <p style="text-align: center; color: #ffffff; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size: medium">
                    &copy; <strong>Mix & Match Groceries. All Rights Reserved</strong>
                </p>
            </div>
        </div>

</form>
</body>
</html>
