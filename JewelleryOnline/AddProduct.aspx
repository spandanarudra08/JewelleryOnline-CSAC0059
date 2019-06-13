<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="JewelleryOnline.AddProduct" %>

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

.productDetails td, th {
  border: 1px solid #dddddd;
  text-align: center;
  padding: 8px;
}

.productDetails tr:nth-child(even) {
  background-color: #dddddd;
}
    #txtBrand table {
        align-content: center;
        margin-left: 150px;
    }
#txtBrand td, tr {
  
  text-align: left;
  padding: 6px;
  
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
            Add Product
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
             
                <asp:dropdownlist ID="dropBrandList" class="text-style" runat="server" Width="240px" Height="25px"></asp:dropdownlist>
                
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
      
        
           <td >
            
                <asp:Button ID="btnAddProduct" class="btn-style" runat="server" Text="Add" OnClick="btnAddProduct_Click" />
               
             </td>
            
           
            </tr>
           </table>
             </div>
        <div class="productDetails" align="center">
        <table>
            <tr>
                <th>Product ID</th>
                <th>Brand</th>
                <th>Product Name</th>
                <th>Sales Price</th>
                <th>Available Quantity</th>

                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <tr>
                <td>PDT001</td>
                <td>Kate Spade</td>
                <td>Princess Stud Earrings</td>
                
                <td>160.99</td>
                <td>12</td>
                <td><asp:Image ID="Image3" ImageUrl="~/images/editBold.png" runat="server" align="centre" Height="17px" Width="20px" /></td>

                <td><asp:Image ID="Image1" ImageUrl="~/images/delete.png" runat="server" align="centre" Height="17px" Width="20px" /></td>
  
            </tr>
            <tr>
                <td>PDT002</td>
                <td>Cezanne</td>
                <td>Cuff Bracelet</td>
                
                <td>270.99</td>
                <td>9</td>
                <td><asp:Image ID="Image4" ImageUrl="~/images/editBold.png" runat="server" align="centre" Height="17px" Width="20px" /></td>

                <td><asp:Image ID="Image5" ImageUrl="~/images/delete.png" runat="server" align="centre" Height="17px" Width="20px" /></td>
  
            </tr>
            <tr>
                <td>PDT003</td>
                <td>Swarovski</td>
                <td>26* Crystal Charm</td>
                <td>190.99</td>
                <td>3</td>

                <td><asp:Image ID="Image6" ImageUrl="~/images/editBold.png" runat="server" align="centre" Height="17px" Width="20px" /></td>

                <td><asp:Image ID="Image7" ImageUrl="~/images/delete.png" runat="server" align="centre" Height="17px" Width="20px" /></td>
  
            </tr>
            <tr>
                <td>PDT004</td>
                <td>Kate Spade</td>
                <td>Heart Necklace</td>
                <td>300.99</td>
                <td>18</td>

                <td><asp:Image ID="Image8" ImageUrl="~/images/editBold.png" runat="server" align="centre" Height="17px" Width="20px" /></td>

                <td><asp:Image ID="Image9" ImageUrl="~/images/delete.png" runat="server" align="centre" Height="17px" Width="20px" /></td>
  
            </tr>
    </table>
  </div>
 
    </form>
</body>
</html>

