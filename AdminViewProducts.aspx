<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminViewProducts.aspx.cs" Inherits="Grocery_Demo.AdminViewProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/HomePage.css" rel="stylesheet" />
    <link href="CSS/DropDown.css" rel="stylesheet" />
    <link href="CSS/searchproducts.css" rel="stylesheet" />
    <link href="CSS/viewproducts1.css" rel="stylesheet" />
    <link href="CSS/viewproducts2.css" rel="stylesheet" />
    <link href="CSS/viewproducts3.css" rel="stylesheet" />
    <link href="CSS/searchtext.css" rel="stylesheet" />
    <link href="CSS/viewtext1.css" rel="stylesheet" />
    <link href="CSS/viewtext2.css" rel="stylesheet" />
    <link href="CSS/viewtext3.css" rel="stylesheet" />
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
   
   <div class="searchtext">
        <strong>Search by Product Name</strong> 
        </div>

         <div class="searchproducts">
        <asp:Table ID="Table1" runat="server" align="center" >
        <asp:TableRow ID="TableRow1" runat="server">
        <asp:TableCell HorizontalAlign="Right">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </asp:TableCell>
        <asp:TableCell HorizontalAlign="Left">
        <asp:Button ID="Button8" runat="server" OnClick="Search_Product" ValidationGroup="SearchByName"  Text="Search Product" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ValidationGroup="SearchByName" ErrorMessage=" Please enter a product name" Font-Bold="True"></asp:RequiredFieldValidator>
        <asp:Label ID="Label3" runat="server" Font-Bold="True"></asp:Label>
        </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
        </div>
            
        <br />
     
         <div class="viewtext1">
             <strong>View Option 1: View Product on Category Selection</strong>
          </div>
            
            <div class="viewproducts1">
            <asp:Table ID="Table2" runat="server" align="center" >
            <asp:TableRow ID="TableRow2" runat="server">
            <asp:TableCell HorizontalAlign="Right">
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
            <asp:DropDownList AppendDataBoundItems ="true" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Product_Category_Name" DataValueField="Product_Category_Name">
            <Items>
             <asp:ListItem Value="-1">Select a Category</asp:ListItem>
            </Items>
            </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Grocery_DemoConnectionString %>" SelectCommand="SELECT Product_Category_Name FROM Product_Category"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" ValidationGroup="ViewByCategory" InitialValue="-1" ErrorMessage=" Please select a category" Font-Bold="True"></asp:RequiredFieldValidator>
            </asp:TableCell>
            </asp:TableRow>
            </asp:Table>
            <br />
            <asp:Button ID="Button9" runat="server" OnClick="View_Option1" ValidationGroup="ViewByCategory" Text="View Product" />
            </div>
           
        <br />

            <div class="viewtext2">
            <strong>View Option 2: View Product on Branch Selection</strong>
            </div>

            <div class="viewproducts2">
            <asp:Table ID="Table3" runat="server" align="center" >
            <asp:TableRow ID="TableRow3" runat="server">
            <asp:TableCell HorizontalAlign="Right">
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
            <asp:DropDownList AppendDataBoundItems ="true" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Grocery_Branch_Name" DataValueField="Grocery_Branch_Name">
            <asp:ListItem Value="-1">Select a Branch</asp:ListItem>
            </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Grocery_DemoConnectionString %>" SelectCommand="SELECT Grocery_Branch_Name FROM Grocery_Branch"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList2" ValidationGroup="ViewByBranch" InitialValue="-1" ErrorMessage=" Please select a branch" Font-Bold="True"></asp:RequiredFieldValidator>
            </asp:TableCell>
            </asp:TableRow>
            </asp:Table>
            <br />
            <asp:Button ID="Button10" runat="server" ValidationGroup="ViewByBranch" OnClick="View_Option2" Text="View Product" />         
            </div>
        
        <br />
        
             <div class="viewtext3">
             <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; View Option 3: View Product on Branch and Category Selection</strong>
             </div>

            <div class="viewproducts3">
            <asp:Table ID="Table4" runat="server" align="center" >
            <asp:TableRow ID="TableRow4" runat="server">
            <asp:TableCell HorizontalAlign="Right">
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
            <asp:DropDownList AppendDataBoundItems ="true" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Product_Category_Name" DataValueField="Product_Category_Name">
            <asp:ListItem Value="-1">Select a Category</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Grocery_DemoConnectionString %>" SelectCommand="SELECT Product_Category_Name FROM Product_Category"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList3" ValidationGroup="ViewByCategoryBranch" InitialValue="-1" ErrorMessage=" Please select a category" Font-Bold="True"></asp:RequiredFieldValidator>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Right">
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
            <asp:DropDownList AppendDataBoundItems ="true" ID="DropDownList4" runat="server" DataSourceID="SqlDataSource4" DataTextField="Grocery_Branch_Name" DataValueField="Grocery_Branch_Name">
            <asp:ListItem Value="-1">Select a Branch</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Grocery_DemoConnectionString %>" SelectCommand="SELECT Grocery_Branch_Name FROM Grocery_Branch"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList4" ValidationGroup="ViewByCategoryBranch" InitialValue="-1" ErrorMessage=" Please select a branch" Font-Bold="True"></asp:RequiredFieldValidator>
            </asp:TableCell>
            </asp:TableRow>
            </asp:Table>
            <br />
            <asp:Button ID="Button11" runat="server" ValidationGroup="ViewByCategoryBranch" OnClick="View_Option3" Text="View Product" />
            </div>

        <br/>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center">
        <Columns>
         <asp:BoundField DataField="Product_No" HeaderText="Product No" />
         <asp:TemplateField HeaderText="Image">
         <ItemTemplate>
          <asp:Image ID="Image1" runat="server" Height="100px" Width="150px"
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
   
    </form>
    </body>
</html>
