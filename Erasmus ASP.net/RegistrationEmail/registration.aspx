<%@ Page MasterPageFile="header.master" Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="RegistrationEmail.Registration" Title="Registration & Email Sending" %>
 
<asp:Content ContentPlaceHolderId="CPH1" runat="server">

   <link href="StyleSheet.css" rel="stylesheet" />
   <script src="javascript.js"   type="text/javascript"></script>

 <div id='container'>
    
   
        <div class="page">       
        <div class="center">

        

           <form id="form1" runat="server" >
                <table style="width: 100%"; >
                <tr>
                    <td colspan="3">
                        <h3>Registration</h3>
                    </td>
                </tr>
                <tr>
                    <td>Login:</td>
                    <td>
                      
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="txt" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                          ControlToValidate = "txtFirstName"
                          Display = "Static"
                          runat = "server"
                          ErrorMessage = "Please enter your name" ForeColor="Red">* Please enter your name</asp:RequiredFieldValidator>
                     </td>

                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtPass" TextMode="password" runat="server" CssClass="txt"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                          ControlToValidate = "txtPass"
                          Display = "Static"
                          runat = "server"
                          ErrorMessage = "Please enter password" ForeColor="Red">* Please enter password</asp:RequiredFieldValidator>

                    </td>
                    <td>&nbsp;</td>
                </tr>
                   <tr>
                    <td>Repeat password:</td>
                    <td>
                        <asp:TextBox ID="txtPass2" TextMode="password" runat="server" CssClass="txt"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                          ControlToValidate = "txtPass2"
                          Display = "Static"
                          runat = "server"
                          ErrorMessage = "Please enter password" ForeColor="Red">* Please enter password again</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Email:</td>

                    <td>
                        <asp:TextBox ID="txtEmailID" runat="server" CssClass="txt"></asp:TextBox>
                         
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmailID"
                             ErrorMessage="Enter email!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                            * Enter correct email address!</asp:RegularExpressionValidator>
                        <br /> <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                          ControlToValidate = "txtEmailID"
                          Display = "Static"
                          runat = "server"
                          ErrorMessage = "Please enter password" ForeColor="Red">* Please enter email address</asp:RequiredFieldValidator>





                    </td>
                    <td>&nbsp;</td>
                </tr>
        
                <tr>

                    <td></td>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"  CssClass="button" /></td>
                </tr>
            </table>
             </form>
        </div>
        </div>
   
   </div>

</asp:Content>