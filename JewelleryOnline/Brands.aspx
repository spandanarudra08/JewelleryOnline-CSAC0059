<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Brands.aspx.cs" Inherits="JewelleryOnline.Brands" %>

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
  #form1 .logo{
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
 #brandData  table {
       
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  

}
  #brandData table td {
           
           width:60px;
            text-align: center;
            padding: 8px;
        }



 .rowStyle {
     background-color: #dddddd;
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
      
            <h2>
            Brand List
        </h2>
         <div align="right" style="padding-bottom:20px">
         
                <asp:Button  ID="Button1" class="btnStyle"  runat="server" Text="Add Brand" OnClick="btnAddBrand_Click" />
            
             </div>
    <div id="brandData" align="center">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
           
        
            <br />
            <br />
            <asp:DataList ID="DataList1" runat="server" BorderColor="Black" BorderStyle="None" Width="893px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged1">
               <HeaderTemplate>
                   <table>
                <tr class="rowStyle">
                <td>Brand ID</td>
                <td>Brand Name</td>
                <td>Edit</td>
                <td>Delete</td>
                
                </tr>
                       </table>
                   </HeaderTemplate>
                <ItemTemplate>
                    <table>
                
                
                         
                        <tr>
                            <td><%#Eval("Brand_Id")%>
                            <td><%#Eval("Brand_Name")%>
                            
                             <td><asp:ImageButton ID="EdtButton1" ImageUrl="~/images/editBold.png"  runat="server" align="centre" Height="17px" Width="20px"  OnClick="EdtButton1_Click" /></td>

                <td><asp:ImageButton ID="DltButton1" ImageUrl="~/images/delete.png"  runat="server" align="centre" Height="17px" Width="20px"  /></td>
                   
                            
                             
                      </tr>
                
                    </table>
                    </ItemTemplate>

            </asp:DataList>
            <br />
        </div>
</form>
</body>
</html>
