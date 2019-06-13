<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add Brand.aspx.cs" Inherits="JewelleryOnline.Add_Brand" %>

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
    margin-left:400px;
        }
   .btnStyle{
       width: 140px;
            height: 30px;
            font-size:medium;
            color:black;
          
   }
.brandDetails table {
       
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 70%;
}

.brandDetails td, th {
  border: 1px solid #dddddd;
  text-align: center;
  padding: 8px;
}

.brandDetails tr:nth-child(even) {
  background-color: #dddddd;
}
#txtBrand table{
    align-content:center;
            margin-left:250px;
}
#txtBrand  .btn-style
        {   
            
            background-color: #2a232d ;
            margin-left:90px;
            margin-top:20px;
            width: 75px;
            height: 40px;
            font-size:medium;
            color:white;
          margin-bottom: 50px;
        }
.auto-style1 {
            height: 71px;
        }
    .auto-style2 {
        height: 53px;
    }
    .auto-style3 {
        height: 71px;
        width: 423px;
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
            Add Brand
        </h2>
         <div Id="txtBrand">
       <table>
          <tr>
            <td class="auto-style1">
            <div style="font-size: large; color: black; font-weight: bold">
                Brand Name
                </div>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtBrandname" class="text-style" runat="server"  Width="240px" Height="30px"></asp:TextBox>
                
            </td>
        </tr>
        <tr>
            <td>
            <div style="font-size: large; color: black; font-weight: bold">
                Brand ID
                </div>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtBrandID" class="text-style"  runat="server" Width="240px" Height="30px"></asp:TextBox>
                
            </td>
        </tr>
         <tr>
        </tr>
        <tr>
            <td></td>
            <td colspan="1" class="auto-style2" >
                <asp:Button ID="btnAddBrand" class="btn-style" runat="server" Text="Add" />
            
                    </td>
             
            </tr>
           </table>
             </div>
    <div class="brandDetails" align="center">
        <table>
            <tr>
                <th>Brand ID</th>
                <th>Brand Name</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <tr>
                <td>CTID001</td>
                <td>Kate Spade</td>
                <td><asp:Image ID="Image3" ImageUrl="~/images/editBold.png" runat="server" align="centre" Height="17px" Width="20px" /></td>

                <td><asp:Image ID="Image1" ImageUrl="~/images/delete.png" runat="server" align="centre" Height="17px" Width="20px" /></td>
  
            </tr>
            <tr>
                <td>CTID002</td>
                <td>Cezanne</td>
                <td><asp:Image ID="Image4" ImageUrl="~/images/editBold.png" runat="server" align="centre" Height="17px" Width="20px" /></td>

                <td><asp:Image ID="Image5" ImageUrl="~/images/delete.png" runat="server" align="centre" Height="17px" Width="20px" /></td>
  
            </tr>
            <tr>
                <td>CTID003</td>
                <td>Swarovski</td>
                <td><asp:Image ID="Image6" ImageUrl="~/images/editBold.png" runat="server" align="centre" Height="17px" Width="20px" /></td>

                <td><asp:Image ID="Image7" ImageUrl="~/images/delete.png" runat="server" align="centre" Height="17px" Width="20px" /></td>
  
            </tr>
            
    </table>
  </div>
    </form>
</body>
</html>
