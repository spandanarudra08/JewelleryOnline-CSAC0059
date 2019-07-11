<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="JewelleryOnline.EditProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
     #form1  {
       width: 100%;
        height: 150px;
         background-color: #cdabdb; 
   }
   #nav{
        height: 140px;
        
      
    }
    #nav ul{
        list-style:none;
        margin:2px 2px ;
        padding: 0;
        overflow: hidden;
        
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
    margin-left: 400px;
        }
 
.productDetails table {
       
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

.productDetails table td{
  width: 60px;
  text-align: center;
  padding: 8px;
}


    #txtBrand table  {
        align-content: center;
        margin-left: 150px;
    }
#txtBrand td, tr {
  
  text-align: center;
  padding: 8px;
  
}
#txtBrand  .btn-style
        {   
            
            background-color: #2a232d ;
            margin-left:60px;
            margin-top:5px;
            width: 60px;
            height: 35px;
            font-size:medium;
            color:white;
          margin-bottom: 20px;
        }
.rowStyle{
      background-color:#dddddd;
}
.auto-style1 {
            height: 71px;
        }
    .auto-style2 {
        height: 53px;
       
    }
    .auto-style3 {
        height: 71px;
        width: 320px;
    }
    .auto-style4 {
        width: 423px;
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
       <table>
            <tr>
                <td>
       <div id="nav">
         <ul>
             
            <!--<li style= "float:right"><a href="Login.aspx">Logout</a></li>-->
            <li style= "float:left"><a href="Home.aspx">Home</a></li></br></br>
            <li style= "float:left"><a href="Brands.aspx">Brands</a></li></br></br>
             <li style= "float:left"><a href ="Products.aspx">Products</a></li>
            
          </ul>
       </div>
        </td>
        <td>
        <div class="logo">   
        <asp:Image ID="Image2" ImageUrl="~/images/JOLogo.png" runat="server" align="centre" height="140px" Width="300px" />
        
        </div>

        </td>
                <ul><li style= "float:right; list-style:none"><a href="Login.aspx">Logout</a></li></ul>
                </tr>
        </table>
            <h2 style="margin-left:50px">
            Edit Product
        </h2>
         <div Id="txtBrand">
       <table>
          <tr>
            <td>
            <div style="font-size: large; color: black; font-weight: bold">
                Brand
                </div>
            </td>
            <td>
             
                <asp:DropDownList ID="dropBrandList" class="text-style" runat="server" Width="240px" Height="25px">
                    <asp:ListItem>Kate Spade</asp:ListItem>
                    <asp:ListItem>Cezanne</asp:ListItem>
                    <asp:ListItem>CTID001</asp:ListItem>
                    <asp:ListItem>CTID003</asp:ListItem>
                </asp:DropDownList>
                
            </td>

              <td >
            <div style="font-size: large; color: black; font-weight: bold">
                Product Name
                </div>
            </td>
            <td >
                <asp:TextBox ID="txtProductName" class="text-style" runat="server"  Width="240px" Height="25px"></asp:TextBox>
                
            </td>
        </tr>
        <tr>
            <td >
            <div style="font-size: large; color: black; font-weight: bold">
                Product ID
                </div>
            </td>
            <td>
                <asp:TextBox ID="txtProductID" class="text-style"  runat="server" Width="240px" Height="25px"></asp:TextBox>
                
            </td>
             <td>
            <div style="font-size: large; color: black; font-weight: bold">
                Available Quantity
                </div>
            </td>
             <td>
                <asp:TextBox ID="txtQuantity" class="text-style"  runat="server" Width="240px" Height="25px"></asp:TextBox>
                
            </td>
            </tr>
           <tr>
              
            <td>
            <div style="font-size: large; color: black; font-weight: bold">
               Sales Price
                </div>
            </td>
          
            <td>
                <asp:TextBox ID="txtSales" class="text-style"  runat="server" Width="240px" Height="25px"></asp:TextBox>
                
            </td>
        </tr>
           <tr><td></td>
  <td><asp:Button ID="btnCancelProduct" class="btn-style" runat="server" Text="update" OnClick="btnUpdateProduct_Click" /></td>
          
            
  <td><asp:Button ID="btnUpdateProduct" class="btn-style" runat="server" Text="Cancel" OnClick="btnCancelProduct_Click" /></td>
               
       </tr>
    </table>
 </div>
        <div class="productDetails" align="center">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
           
         <br />
            <br />
           
            <asp:DataList ID="DataList1" runat="server" BorderColor="Black" BorderStyle="None" Width="893px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <HeaderTemplate>
                   <table>
                <tr class="rowStyle">
                <td>Product ID</td>
                <td>Brand</td>
                <td>Product Name</td>
                <td>Sales Price</td>
                <td>Available Quantity</td>

                <td>Edit</td>
                <td>Delete</td>
                
                </tr>
                       </table>
                   </HeaderTemplate>
                <ItemTemplate>
          <table>
            
                        <tr>
                            <td><%#Eval("Product_Id")%>
                            <td><%#Eval("Brand_Id")%>
                            <td><%#Eval("Product_Name")%>
                            <td><%#Eval("Sales_Price")%>

                            <td><%#Eval("Available_Qty")%>

                                <td>
                    <asp:ImageButton ID="EdtButton1" ImageUrl="~/images/editBold.png"  runat="server" align="centre" Height="17px" Width="20px" OnClick="EdtButton1_Click"/> </td>

                <td> <asp:ImageButton ID="DltButton1" ImageUrl="~/images/delete.png"  runat="server" align="centre" Height="17px" Width="20px" OnClick="btnDeleteProduct_Click"/></td>
                            
                 </tr>
                </table>
              </ItemTemplate>

            </asp:DataList>
            <br />
        </div>
 
    </form>
</body>
</html>
