﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JewelleryOnline.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>

        table{
            
            align-content:center;
            margin-left:250px;
        }

        .text-style
        {
            border: 2px solid;
            font-size:medium;
            height: 35px;
                
        }
        .btn-style
        {   
            
            background-color: #4A274F ;
            margin-left:90px;
            width: 75px;
            height: 40px;
            font-size:medium;
            color:white
          
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
        <div>
            <table>
            <tr>
                <td>

                </td>
            </tr>
            <tr>
                <td>

                </td>
            </tr>
            <tr>
            <td colspan="2">
                <h2 style="font-family: Baskerville Old Face; font-weight: 500; font-size: xx-large;  color: black; font-weight: bold"> 
                    JEWELLERY ONLINE
                </h2>
            </td>
        </tr>
       
        <tr>
            <td class="auto-style1">
            <div style="font-size: large; color: black; font-weight: bold">
                Username:
                </div>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUsername" class="text-style" runat="server" placeholder="Enter Your Username"
                     ToolTip="Enter Your Username" Width="240px" Height="30px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please Enter Valid Username"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
            <div style="font-size: large; color: black; font-weight: bold">
                Password:
                </div>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtPassword" class="text-style" placeholder="Enter Your Password" TextMode="Password" runat="server"
                    ToolTip="Enter Your Password" Width="240px" Height="30px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPAssword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please Enter Valid Password"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td>
            </td>
        </tr>
            </div>
        <div style="font-size: large; color: black; font-weight: bold">
        <tr>
            <td colspan="1" class="auto-style2" >
                <asp:Button ID="btnLogin" class="btn-style" runat="server" Text="Login" OnClick="btnLogin_Click" />
            
                    </td>
            <td colspan="1" class="auto-style2" >
                <asp:Button ID="btnSignUp" class="btn-style" runat="server" Text="Signup" OnClick="btnSignUp_Click" CausesValidation="False" />
            
                    </td>
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
            
             
            </tr>

            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>

        </table>

        </div>
    </form>
</body>
</html>
