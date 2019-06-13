<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="JewelleryOnline.NavigationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>
    #form1 ul{
        list-style:none;
        margin:2px 2px ;
        padding: 0;
        overflow: hidden;
        background-color: #cdabdb;
        opacity:0.9;
    }
   #form1 ul li {
   
  border-right:1px solid #bbb;
 
}
a {
  display: block;
  color: white;
 padding: 6px 3px;
 transition: 0.3s;
  text-decoration: none;
}
 a:hover {
  background-color:#74607c ;
   
}
   .logo{
             display: flex;
    align-items: center;
    justify-content: center;

        }
   .btnStyle{
       width: 140px;
            height: 30px;
            font-size:medium;
            color:black;
          
   }
   .active {
  background-color: #74607c;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
          <ul>
             
            <li style= "float:right"><a href="Login.aspx">Logout</a></li>
            <li style= "float:left"><a href="Home.aspx">Home</a></li></br></br>
            <li style= "float:left"><a href="Brand.aspx">Brand</a></li></br></br>
             <li style= "float:left"><a href ="Product.aspx">Product</a></li>
            
          </ul>
        </div>

        <div class="logo">   
        <asp:Image ID="Image2" ImageUrl="~/images/JOLogo.png" runat="server" align="centre" Height="150px" Width="300px" />
        
        </div>

         <h2 float="left">
                     Inventory  Details 
                </h2>
         <div style="padding-right:100px; height: 40px; width: 1264px;" align="right" >
                <asp:Button  ID="Button1" class="btnStyle" runat="server" Text="Add Brand"  />
            &nbsp &nbsp &nbsp &nbsp &nbsp
                <asp:Button  ID="Button2" class="btnStyle" runat="server" Text="Add Product"  />
        
      
           

           </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Brand Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Product Details<br />
        <br/>
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
                   <br />
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
