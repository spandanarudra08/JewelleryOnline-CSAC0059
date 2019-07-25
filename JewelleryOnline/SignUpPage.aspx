<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpPage.aspx.cs" Inherits="JewelleryOnline.SignUpPage" %>
<%@ Register Assembly="BotDetect" Namespace="BotDetect.Web.UI" TagPrefix="BotDetect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <title></title>
    <style type="text/css">

        table{
            
            align-content:center;
            margin-left:250px;
            width: 25%;
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
            width: 180px;
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
    .captchabox{
        margin-left: 150px;
    }
   
    </style> 

</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
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
            <td class="auto-style3">
                <asp:TextBox ID="txtPassword" class="text-style" placeholder="Enter Your Password" TextMode="Password" runat="server"
                    ToolTip="Enter Your Password" Width="240px" Height="30px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPAssword" runat="server" style="color:red;" ControlToValidate="txtPassword" ErrorMessage="Please Enter Valid Password"></asp:RequiredFieldValidator>
            </td>
        </tr>

            <tr>
            <td class="auto-style1">
            <div style="font-size: large; color: black; font-weight: bold">
                Confirm Password:
                </div>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtPassword1" class="text-style" runat="server" placeholder="Re-Enter Your Password" TextMode="Password"
                     ToolTip="Re-Enter Your Password" Width="240px" Height="30px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" style="color:red;" runat="server" ControlToValidate="txtPassword1" ErrorMessage="Please Enter the same Password"></asp:RequiredFieldValidator>
                  <asp:CompareValidator ID="CompareValidator1" runat="server" style="color:red;"  ControlToValidate="txtPassword1" CssClass="ValidationError" ControlToCompare="txtPassword" ErrorMessage="Password mismatch" ToolTip="Password must be the same" />

            </td>

    
        </tr>
         <tr>
            <td>
            </td>
        </tr>
           
               
        <tr>
            <td class="auto-style3">
                        <asp:TextBox ID="txtCaptcha" placeholder="Type the below Characters" Width="240px" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" style="color:red;" runat="server" ControlToValidate="txtCaptcha" ErrorMessage="Please Enter captcha"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="captchabox">
                        <BotDetect:WebFormsCaptcha ID="CaptchaBox" runat="server"/>
                    </td>
                </tr>
                
               
                <tr>
                    <td>
                        <asp:Label ID="Cmsg" runat="server" Text=""></asp:Label>
                    </td>
                  
          
      
             <td  class="auto-style2" >
                <asp:Button ID="Button1" class="btn-style" runat="server" Text="Signup" OnClick="Button1_Click"  />
            
                    </td>
            </tr>
              <asp:Label ID="lblmsg" runat="server"></asp:Label>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>

        </table>

    </form>
</body>
</html>
