<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProducts.aspx.cs" Inherits="Grocery_Demo.UpdateProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="CSS/HomePage.css" rel="stylesheet" />
<link href="CSS/DropDown.css" rel="stylesheet" />
<link href="CSS/searchproducts.css" rel="stylesheet" />
<link href="CSS/searchtext.css" rel="stylesheet" />
<link href="CSS/viewproducts.css" rel="stylesheet" />
<link href="CSS/viewtext.css" rel="stylesheet" />
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

       </div>
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
   
        <div class="viewtext">
             <strong>View by Category: View Product on Category Selection</strong>
        </div>

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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
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
          <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Must be greater than 0.00" Operator="GreaterThan" Type="Currency" ValueToCompare="0.00" />
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Numbers with decimals only" ControlToValidate="TextBox3" ValidationExpression="^\d{1,9}\.\d{1,2}$"></asp:RegularExpressionValidator>          
          </ItemTemplate>
          </asp:TemplateField>
         <asp:TemplateField HeaderText="Quantity" >
         <ItemTemplate>
          <asp:TextBox ID ="TextBox4" runat="server" Width="60px" DataField="Product_Quantity" Text='<%#Eval("Product_Quantity")%>' />
          <asp:Button ID ="Button12" runat="server" OnClick="Quantity_Update_Click" CommandArgument="Button12" CommandName="Update"  Text="Update" />
          <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Must be greater than 0" Operator="GreaterThan" Type="Integer" ValueToCompare="0" />
          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numbers only" ControlToValidate="TextBox4" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>      
          </ItemTemplate>
          </asp:TemplateField>
         <asp:BoundField DataField="Grocery_Branch_Name" HeaderText="Branch" />
     
         </Columns>
         </asp:GridView>

        <%--<asp:BoundField DataField="Product_Price" HeaderText="Price" DataFormatString="{0} AUD" />--%>
            
    </form>
</body>
</html>
