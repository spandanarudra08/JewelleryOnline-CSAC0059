<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="JewelleryOnline.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        ul {
  list-style-type: none;
  margin-top:0 ;
  padding: 0;
  overflow: hidden;
  background-color: #cdabdb;
  opacity:0.9;
}

li {
  float: left;
  border-right:1px solid #bbb;
}

li:last-child {
  border-right: none;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 30px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color:#74607c ;
}

.active {
  background-color: #74607c;
}
       
       
        .logo{
             display: flex;
    align-items: center;
    justify-content: center;

        }

        .text-style
        {
            width: 150px;
            height: 30px;
            border-radius:4px;
            font-size:medium
        }
        .btn-style
        {
            width: 75px;
            height: 30px;
            font-size:medium;
            color:black
          
        }
        td{
           
        }
        
    .grid{
        width:100%;
        
    } 
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
                &nbsp; </div>
      <div>
     <ul>
            <li style= "font-size:20px; background-color:#cdabdb;float:right"><a href="Admin_Login.aspx">Logout</a></li>
            
             <li style="font-size:20px; background-color:#cdabdb; float:right"><a href="AddProduct.aspx">Add Product</a></li>
            
                <li style="font-size:20px; background-color:#cdabdb; float:right" ><a href="AddBrand.aspx">Add Brand</a></li>
    
          
           
            <li><a href="MainPage.aspx">Home</a></li>
            <li><a href="Brand.aspx">Brand</a></li>
             <li><a href ="Product.aspx">Product</a></li>
            
          
      
      </div>    
       
    </ul>      

        <div class="logo">
        <asp:Image ID="Image2" ImageUrl="~/images/JOLogo.png" runat="server" align="centre" Height="150px" Width="300px" />
        </div>
        <span style="font-size:30px; color: white; cursor:pointer" onclick="openNavmenu()">&#9776;</span>
  

  
        <div>
        </div>
        
   
      
        
                <h2 style="padding-left:50px">
                     Inventory  Details 
                </h2>
      

        <div >
        <table align="center">

        
        <tr>
        
            <td>
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource1" ForeColor="Black">
                       <Columns>
                           <asp:BoundField DataField="Brand_Name" HeaderText="Brand_Name" SortExpression="Brand_Name" />
                           
                           <asp:BoundField DataField="NumberOfProducts" HeaderText="NumberOfProducts" SortExpression="NumberOfProducts" />
                       </Columns>
                       <FooterStyle BackColor="#CCCCCC" />
                       <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                       <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                       <RowStyle BackColor="White" />
                       <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                       <SortedAscendingCellStyle BackColor="#F1F1F1" />
                       <SortedAscendingHeaderStyle BackColor="#808080" />
                       <SortedDescendingCellStyle BackColor="#CAC9C9" />
                       <SortedDescendingHeaderStyle BackColor="#383838" />
                   </asp:GridView>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:JewelleryOnlineConnection %>" SelectCommand="select [Brand_Name],[NumberOfProducts] FROM [Brand_Details]"></asp:SqlDataSource>
            </td>
            
    
          <td>
              </td>
            <td>
                </td>
       
       
            
            <td>
                   <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource2" ForeColor="Black">
                       <Columns>
                          
                           
                           <asp:BoundField DataField="Product_Name" HeaderText="Product_Name" SortExpression="Product_Name" />
                           <asp:BoundField DataField="Available_Quantity" HeaderText="Available_Quantity" SortExpression="Available_Quantity" />
                           <asp:BoundField DataField="Brand_Name" HeaderText="Brand_Name" SortExpression="Brand_Name" />
                      
                           </Columns>
                       <FooterStyle BackColor="#CCCCCC" />
                       <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                       <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                       <RowStyle BackColor="White" />
                       <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                       <SortedAscendingCellStyle BackColor="#F1F1F1" />
                       <SortedAscendingHeaderStyle BackColor="#808080" />
                       <SortedDescendingCellStyle BackColor="#CAC9C9" />
                       <SortedDescendingHeaderStyle BackColor="#383838" />
                   </asp:GridView>    
                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:JewelleryOnlineConnection %>" SelectCommand="SELECT  [Product_Name], [Available_Quantity],[Brand_Name] FROM [Product_Details]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>