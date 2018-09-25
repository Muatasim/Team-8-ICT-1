<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProducts.aspx.cs" Inherits="Grocery_Demo.UpdateProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="CSS/Skeleton.css" rel="stylesheet" />
<link href="CSS/DropDown.css" rel="stylesheet" />
<link href="CSS/headingtext.css" rel="stylesheet" />
<link href="CSS/searchproducts.css" rel="stylesheet" />
<link href="CSS/searchtext.css" rel="stylesheet" />
<link href="CSS/viewproducts.css" rel="stylesheet" />
<link href="CSS/viewtext.css" rel="stylesheet" />
<link href="CSS/displaybranch.css" rel="stylesheet" />
<link href="Content/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
    
         <div style="text-align:right">
         <div style="text-align:left" class="dropdown">
         <button class="dropbtn"><asp:Label ID="Label2" runat="server" ></asp:Label></button>
         <div style="text-align:left" class="dropdown-content a">
         <a href="ViewProfile.aspx">View Profile</a>
         <a href="UpdateProfile.aspx">Edit Profile</a>
         <a href="Homepage.aspx">Logout</a>
         </div>
         </div>
         </div>

        <h3 class="displaybranch">
         <asp:Label ID="Label1" runat="server" Font-Bold="true"></asp:Label>
         &nbsp;<strong>Branch</strong> 
         </h3>

        <div id="site-wrapper">
        
        <header>
        <div class="content-wrap">
         <div class="logo">
            <asp:Image ID="Image1" runat="server" />
            <img src="Grocery Image/logo.jpg" style="height:105px; width:800px; margin-left:350px" /></div>
        <br />

        <div class="menu">
        <asp:Button ID="Button1" Class="btn-success" runat="server" PostBackUrl="~/AdminHomepage.aspx" CausesValidation="False" Text="Home" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
        <asp:Button ID="Button2" Class="btn-success" runat="server" PostBackUrl="~/AddProducts.aspx" CausesValidation="False" Text="Add Products" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
        <asp:Button ID="Button3" Class="btn-success" runat="server" PostBackUrl="~/AdminViewProducts.aspx" CausesValidation="False" Text="Products" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
        <asp:Button ID="Button4" Class="btn-success" runat="server" PostBackUrl="~/UpdateProducts.aspx" CausesValidation="False" Text="Update Products" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
        <asp:Button ID="Button5" Class="btn-success" runat="server" PostBackUrl="~/AddPromotion.aspx" CausesValidation="False" Text="Add Promotion" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
        <asp:Button ID="Button6" Class="btn-success" runat="server" PostBackUrl="~/ViewBranch.aspx" CausesValidation="False" Text="Branches" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
        <asp:Button ID="Button7" Class="btn-success" runat="server" PostBackUrl="~/ViewAdmin.aspx" CausesValidation="False" Text="Administrators" Width="142px" Height="40px" Font-Bold="True" style="background-color:#00a400" />
        </div>
        </div>
        </header>
        <br />
        <br />
        <h3 class="headingtext">
        <strong>Update a product price or quantity</strong>
        </h3>
        
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
        <asp:Button ID="Button8" runat="server" OnClick="Search_Product" ValidationGroup="SearchByName"  Text="Search Product" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ValidationGroup="SearchByName" ErrorMessage=" Please enter a product name" Font-Bold="True"></asp:RequiredFieldValidator>
        <asp:Label ID="Label3" runat="server" Font-Bold="True"></asp:Label>
        </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
        </div>
            
        <br />
   
        <h4 class="viewtext">
             <strong>View by Category: View Product on Category Selection</strong>
        </h4>

        <div class="viewproducts">
        <asp:Table ID="Table2" runat="server" align="center" >
        <asp:TableRow ID="TableRow2" runat="server">
        <asp:TableCell HorizontalAlign="Right">
        </asp:TableCell>
        <asp:TableCell HorizontalAlign="Left"> 
        <asp:DropDownList AppendDataBoundItems ="true" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" ValidationGroup="ViewByCategory" DataTextField="Product_Category_Name" DataValueField="Product_Category_Name">
        <Items>  
        <asp:ListItem value="-1">Select a Category</asp:ListItem>
        </Items>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Grocery_DemoConnectionString %>" SelectCommand="SELECT Product_Category_Name FROM Product_Category"></asp:SqlDataSource>      
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" InitialValue="-1" ValidationGroup="ViewByCategory" ErrorMessage=" Please select a category" Font-Bold="True"></asp:RequiredFieldValidator>
        </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
        <br />
        <asp:Button ID="Button9" runat="server"  OnClick="View_Product" ValidationGroup="ViewByCategory" Text="View Product" />
        </div>
        <br/>
        <div style="margin-left:200px;">   
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" HeaderStyle-BackColor="#00a400" HeaderStyle-ForeColor="White">
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
         <asp:TemplateField HeaderText="Price" >
         <ItemTemplate>
          <asp:TextBox ID ="TextBox3" runat="server" Width="80px" DataField="Product_Price" Text='<%#string.Format("{0:0.00}",Eval("Product_Price"))%>'/>
          <asp:Label ID="Label4" Text="AUD" runat="server"></asp:Label>
          <asp:Button ID ="Button11" runat="server" OnClick="Price_Update_Click" ValidationGroup="UpdatePrice" CommandArgument="Button11" CommandName="Update"  Text="Update" />
          <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Must be greater than 0.09 .. Cannot accept integer or character or more than 2 numbers after decimal" Operator="GreaterThan" Type="Currency" ValueToCompare="0.09" Display="Dynamic" />
          <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1"  runat="server" ErrorMessage="Numbers with only 2 digits after decimal" ControlToValidate="TextBox3" ValidationExpression="^\d{1,9}\.\d{1,2}$"></asp:RegularExpressionValidator>--%>               
          </ItemTemplate>
          </asp:TemplateField>
         <asp:TemplateField HeaderText="Quantity" >
         <ItemTemplate>
          <asp:TextBox ID ="TextBox4" runat="server" Width="60px" DataField="Product_Quantity" Text='<%#Eval("Product_Quantity")%>' />
          <asp:Button ID ="Button12" runat="server" OnClick="Quantity_Update_Click" ValidationGroup="UpdateQuantity" CommandArgument="Button12" CommandName="Update"  Text="Update" />
          <%--<asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Must be greater than 0 .. Cannot accept decimal or character" Operator="GreaterThan" Type="Integer" ValueToCompare="0" Display="Dynamic"  />--%>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Cannot accept decimal or character" ControlToValidate="TextBox4" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator> 
          <asp:Label ID="Label5" runat="server"></asp:Label>     
          </ItemTemplate>
          </asp:TemplateField>
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
