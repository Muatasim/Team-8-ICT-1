<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="Grocery_Demo.ViewProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="CSS/Skeleton.css" rel="stylesheet" />
    <link href="CSS/headertext.css" rel="stylesheet" />
    <link href="CSS/searchproducts.css" rel="stylesheet" />
    <link href="CSS/viewproducts1.css" rel="stylesheet" />
    <link href="CSS/viewproducts2.css" rel="stylesheet" />
    <link href="CSS/viewproducts3.css" rel="stylesheet" />
    <link href="CSS/searchtext.css" rel="stylesheet" />
    <link href="CSS/viewtext1.css" rel="stylesheet" />
    <link href="CSS/viewtext2.css" rel="stylesheet" />
    <link href="CSS/viewtext3.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
      <div style="text-align:right;"> 
       <h4><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignIn.aspx">Sign In</asp:HyperLink> 
        &nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SignUp.aspx">Sign Up</asp:HyperLink>&nbsp;</h4>
        &nbsp;
        </div>

        <div id="site-wrapper">
        
        <header>
        <div class="content-wrap">
        <div class="logo">
            <asp:Image ID="Image1" runat="server" />
            <img src="Grocery Image/logo.jpg" style="height:105px; width:800px; margin-left:350px" /></div>
           <br />   
           <div class="menu">
            <asp:Button ID="Button1" Class="btn-success" runat="server" PostBackUrl="~/Homepage.aspx" Text="Home" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
            <asp:Button ID="Button2" Class="btn-success" runat="server" PostBackUrl="~/Promotion.aspx" Text="Promotions" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
            <asp:Button ID="Button3" Class="btn-success" runat="server" PostBackUrl="~/ViewProducts.aspx" Text="Products" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" /> 
            <asp:Button ID="Button4" Class="btn-success" runat="server" PostBackUrl="~/AboutUs.aspx" Text="About Us" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
            <asp:Button ID="Button5" Class="btn-success" runat="server" PostBackUrl="~/ContactUs.aspx" Text="Contact Us" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />              
        </div>
        <br />
      
        </div>
        </header>

        <main>
        <div class="content-wrap">
        <h4 class="searchtext">
        <strong>Search by Product Name</strong> 
        </h4>

         <div class="searchproducts">
        <asp:Table ID="Table1" runat="server" align="center" >
        <asp:TableRow ID="TableRow1" runat="server">
        <asp:TableCell HorizontalAlign="Right">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </asp:TableCell>
        <asp:TableCell HorizontalAlign="Left">
        <asp:Button ID="Button6" runat="server" OnClick="Search_Product" ValidationGroup="SearchByName"  Text="Search Product" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ValidationGroup="SearchByName" ErrorMessage=" Please enter a product name" Font-Bold="True"></asp:RequiredFieldValidator>
        <asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>
        </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
        </div>
            
        <br />
     
         <h4 class="viewtext1">
             <strong>View Option 1: View Product on Category Selection</strong>
          </h4>
            
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
            <asp:Button ID="Button7" runat="server" OnClick="View_Option1" ValidationGroup="ViewByCategory" Text="View Product" />
            </div>
           
        <br />

            <h4 class="viewtext2">
            <strong>View Option 2: View Product on Branch Selection</strong>
            </h4>

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
            <asp:Button ID="Button8" runat="server" ValidationGroup="ViewByBranch" OnClick="View_Option2" Text="View Product" />         
            </div>
        
        <br />
        
             <h4 class="viewtext3">
             <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; View Option 3: View Product on Branch and Category Selection</strong>
             </h4>

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
            <asp:Button ID="Button9" runat="server" ValidationGroup="ViewByCategoryBranch" OnClick="View_Option3" Text="View Product" />
            </div>
        <br/>    
        <br/>  
        <div style="margin-left:330px;">      
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" HeaderStyle-BackColor="#00a400" HeaderStyle-ForeColor="White">
        <Columns>
         <asp:TemplateField HeaderText="Image">
         <ItemTemplate>
          <asp:Image ID="Image1" runat="server" Height="100px" Width="150px"
          ImageUrl='<%#"data:Image/png/jpg/jpeg/gif/bmp;base64," + Convert.ToBase64String((byte[])Eval("Product_Image")) %>' />
         </ItemTemplate>         
         </asp:TemplateField>        
         <asp:BoundField DataField="Product_Name" HeaderText="Product" />
         <asp:BoundField DataField="Product_Category_Name" HeaderText="Category" />
         <asp:BoundField DataField="Product_Price" HeaderText="Price" DataFormatString="{0:0.00} AUD" />
         <asp:BoundField DataField="Product_Quantity" HeaderText="Quantity" />
         <asp:BoundField DataField="Grocery_Branch_Name" HeaderText="Branch" />
         </Columns>
        </asp:GridView>    
        </div>                

        </div>
        </main>

        <br />
        
        <footer>
        <div class="content-wrap">
        <p>&copy; Mix & Match Groceries. All Rights Reserved</p>
        </div>
        </footer>

       </div>

    </form>
</body>
</html>
