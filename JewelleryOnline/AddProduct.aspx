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

        <div class="productDetails">
             <asp:gridview ID="Gridview1" runat="server" AutoGenerateColumns="False" onrowdatabound="GridView1_RowDataBound" OnPageIndexChanging="Gridview1_PageIndexChanging" OnRowCancelingEdit="Gridview1_RowCancelingEdit" OnRowCommand="Gridview1_RowCommand" OnRowDeleting="Gridview1_RowDeleting" OnRowEditing="Gridview1_RowEditing" OnRowUpdating="Gridview1_RowUpdating" ShowFooter="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" ShowHeaderWhenEmpty="True" Width="100%">
      <Columns>
          <asp:TemplateField HeaderText="Id">
              <EditItemTemplate>
                  <asp:Label ID="lbleditid" runat="server" Text='<%# Bind("PID") %>'></asp:Label>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblid" runat="server" Text='<%# Bind("PID") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Product Name">
              <EditItemTemplate>
                  <asp:TextBox ID="txtProductname" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
              </EditItemTemplate>
              <FooterTemplate>
                  <asp:TextBox ID="txtnameProductname1" runat="server"></asp:TextBox>
              </FooterTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblProductname" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Brand ID">
              <EditItemTemplate>
                  <asp:TextBox ID="txtBrandId" runat="server" Text='<%# Bind("BrandId") %>'></asp:TextBox>
              </EditItemTemplate>
              <FooterTemplate>
                  <asp:TextBox ID="txtBrand1" runat="server"></asp:TextBox>
              </FooterTemplate>
              <ItemTemplate>
                 <asp:DropDownList ID="ddlBrandId" runat="server">  
                        </asp:DropDownList> 
              </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Sales Price">
              <EditItemTemplate>
                  <asp:TextBox ID="txtSalesPrice" runat="server" TextMode="Number" Text='<%# Bind("SalesPrice") %>'></asp:TextBox>
              </EditItemTemplate>
              <FooterTemplate>
                  <asp:TextBox ID="txtSalesPrice1" TextMode="Number"
                      runat="server"></asp:TextBox>
              </FooterTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("SalesPrice") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                <EditItemTemplate>
                  <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True"
                        CommandName="Update" Text="Update" ></asp:LinkButton>
                    &nbsp;
                  <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                  <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False"
                        CommandName="AddNew" Text="Add New" ></asp:LinkButton>
                </FooterTemplate>
                <ItemTemplate>
                  <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False"
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True"  ShowHeader="True" />
                <asp:CommandField HeaderText="Select" ShowSelectButton="True"  ShowHeader="True" />

      </Columns>

      <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
      <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
      <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
      <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
      <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
      <SortedAscendingCellStyle BackColor="#FFF1D4" />
      <SortedAscendingHeaderStyle BackColor="#B95C30" />
      <SortedDescendingCellStyle BackColor="#F1E5CE" />
      <SortedDescendingHeaderStyle BackColor="#93451F" />

  </asp:gridview>
        </div>
</form>
</body>
</html>

