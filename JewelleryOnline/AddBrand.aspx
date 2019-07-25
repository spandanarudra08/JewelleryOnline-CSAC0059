<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBrand.aspx.cs" Inherits="JewelleryOnline.Add_Brand" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #form1 {
            width: 100%;
            height: 150px;
            background-color: #cdabdb;
        }

        #nav {
            height: 140px;
        }

            #nav ul {
                list-style: none;
                margin: 2px 2px;
                padding: 0;
                overflow: hidden;
                opacity: 0.9;
            }

        #form1 ul li {
            border-right: 1px solid #bbb;
        }

        a {
            display: block;
            color: white;
            padding: 6px 3px;
            transition: 0.3s;
            text-decoration: none;
        }

            a:hover {
                background-color: #74607c;
            }

        .logo {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-left: 400px;
        }

        .btnStyle {
            width: 140px;
            height: 30px;
            font-size: medium;
            color: black;
        }

        .brandDetails table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        .succMsg {
            color: green;
            text-align: center;
            font-size: larger;
            font-style: unset;
        }

        .brandDetails table td {
            width: 60px;
            text-align: center;
            padding: 8px;
        }


        #txtBrand table {
            align-content: center;
            margin-left: 150px;
        }

        #txtBrand .btn-style {
            background-color: #2a232d;
            margin-left: 90px;
            margin-top: 20px;
            width: 75px;
            height: 40px;
            font-size: medium;
            color: white;
            margin-bottom: 50px;
        }

        .rowStyle {
            background-color: #dddddd;
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
                            <li style="float: left"><a href="Home.aspx">Home</a></li>
                            </br></br>
            <li style="float: left"><a href="Brands.aspx">Brands</a></li>
                            </br></br>
             <li style="float: left"><a href="Products.aspx">Products</a></li>

                        </ul>
                    </div>
                </td>
                <td>
                    <div class="logo">
                        <asp:Image ID="Image2" ImageUrl="~/images/JOLogo.png" runat="server" align="centre" Height="140px" Width="300px" />

                    </div>

                </td>
                <ul>
                    <li style="float: right; list-style: none"><a href="Login.aspx">Logout</a></li>
                </ul>
            </tr>
        </table>
        <h2 style="margin-left: 50px">Add Brand
        </h2>
        <div id="txtBrand">
            <div id="divmsg" style="text-align: center">
                <asp:Label ID="lblMsg" class="succMsg" runat="server" Visible="false" />
            </div>

            <table>
                <tr>
                    <td>
                        <div style="font-size: large; color: black; font-weight: bold">
                            Brand ID
                        </div>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtBrandID" class="text-style" runat="server" Width="240px" Height="30px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <div style="font-size: large; color: black; font-weight: bold">
                            Brand Name
                        </div>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtBrandname" class="text-style" runat="server" Width="240px" Height="30px"></asp:TextBox>

                    </td>

                </tr>
                <tr>
                    <td class="auto-style1">
                        <div style="font-size: large; color: black; font-weight: bold">
                            Number Of Products
                        </div>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtNoOfProducts" class="text-style" runat="server" Width="240px" Height="30px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="1" class="auto-style2">
                        <asp:Button ID="btnAddBrand" class="btn-style" runat="server" Text="Add" OnClick="btnAddBrand_Click" />

                    </td>

                </tr>
            </table>
        </div>
        <div class="brandDetails" align="center">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>

            <br />
            <br />

            <asp:DataList ID="DataList1" runat="server" BorderColor="Black" BorderStyle="None" Width="893px">
                <HeaderTemplate>
                    <table>
                        <tr class="rowStyle">
                            <td>Brand ID</td>
                            <td>Brand Name</td>
                            <td>Number Of Products</td>

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
                                    <td><%#Eval("NumberOfProducts")%>
                                        <td>
                                            <asp:ImageButton ID="EdtButton1" ImageUrl="~/images/editBold.png" runat="server" align="centre" Height="17px" Width="20px" OnClick="EdtButton1_Click" />
                                        </td>

                                        <td>
                                            <asp:ImageButton ID="DltButton1" ImageUrl="~/images/delete.png" runat="server" align="centre" Height="17px" Width="20px" OnClick="btnDeleteBrand_Click" />
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
