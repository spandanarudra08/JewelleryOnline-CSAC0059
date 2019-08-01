<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="JewelleryOnline.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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

    body {
    background-image:url('images/jewellery12.png');
    background-position: center;
   background-size: cover;
  background-repeat: no-repeat;

 
 
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
  }

.productDetails table td {
  width: 60px;
  text-align: center;
  padding: 8px;
}


    #txtBrand table {
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
            Add Product
        </h2>
         <div id="txtBrand">
             <asp:Label ID="lblMsg" runat="server" Visible="false"/>
             <asp:Label ID="lblProductEditMsg" runat="server" ></asp:Label>
       <table>
          <tr>
            <td>
            <div style="font-size: large; color: black; font-weight: bold">
                Brand
                </div>
            </td>
            <td>
             
                <asp:dropdownlist ID="dropBrandList"    class="text-style" runat="server" Width="240px" Height="25px">
                  

                </asp:dropdownlist>
               
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
           
         <br />
            <br />
           
            <asp:DataList ID="DataList1" runat="server" BorderColor="Black" BorderStyle="None" Width="965px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
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
                            <td><%#Eval("Brand_Name")%>
                            <td><%#Eval("Product_Name")%>
                            <td><%#Eval("Sales_Price")%>

                            <td><%#Eval("Available_Qty")%>

                                <td>
                    <%--<asp:ImageButton ID="EdtButton1" ImageUrl="~/images/editBold.png"  runat="server" align="centre" Height="17px" Width="20px" OnClick="EdtButton1_Click(<%#Eval("Product_Id")%>)"/>--%> 
                                <%--<asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CommandArgument='<%#Eval("Product_Id")%>'  OnClick="Btn_Click" Text="Edit" />--%>
<asp:Button ID="EditButton" runat="server" Text="Edit" OnClick="BtnEdit_Click" 
            CommandArgument='<%# Eval("Product_Id") %>'/>

                                </td>
                <td> 
                    <asp:Button ID="Button1" runat="server" Text="Delete" OnClick="BtnDelete_Click" 
            CommandArgument='<%# Eval("Product_Id") %>'/>
                </td>
                            
                 </tr>
                </table>
              </ItemTemplate>
 </asp:DataList>
            <br />
        </div>

        
</form>
</body>
</html>

