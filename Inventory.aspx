﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="JewelleryOnline.Inventory" %>

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

</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
          <ul>
             
            <li style= "float:right"><a href="Login.aspx">Logout</a></li>
            <li style= "float:left"><a href="Home.aspx">Home</a></li></br></br>
            <li style= "float:left"><a href="Brands.aspx">Brands</a></li></br></br>
             <li style= "float:left"><a href ="Products.aspx">Products</a></li>
            
          </ul>
        </div>

        <div class="logo">   
        <asp:Image ID="Image2" ImageUrl="~/images/JOLogo.png" runat="server" align="centre" Height="150px" Width="300px" />
        
        </div>

         <div style="padding-right:100px; height: 40px; width: 1264px;" align="right" >
                <asp:Button  ID="Button1" class="btnStyle" runat="server" Text="Add Brand"  />
            &nbsp &nbsp &nbsp &nbsp &nbsp
                <asp:Button  ID="Button2" class="btnStyle" runat="server" Text="Add Product"  />
             </div>
          <div align="center">
         <h2 >
                     Inventory has no data - Please add brands and Products
                </h2>
      
           </div>
        
 
    </form>
</body>
</html>
