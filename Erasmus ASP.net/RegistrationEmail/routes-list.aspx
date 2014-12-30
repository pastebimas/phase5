<%@ Page MasterPageFile="header.master" Language="C#" AutoEventWireup="true" CodeBehind="routes-list.aspx.cs" Inherits="RegistrationEmail.routes_list1" %>
  
<asp:Content ContentPlaceHolderId="CPH1" runat="server">

     <div id='container'>
    
   
        <div class="page">       
        <div class="center">

        
   <form id="form1" runat="server">


    <asp:GridView ID="GridView1" OnSorting="SortRecords" AllowSorting="true" runat="server" AutoGenerateColumns="false">
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#BFE4FF" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="chkCtrl" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField SortExpression="id" DataField="id" HeaderText="Route id" ItemStyle-Width="70" />
            <asp:BoundField SortExpression="go_from" DataField="go_from" HeaderText="From" ItemStyle-Width="150" />
            <asp:BoundField SortExpression="go_to" DataField="go_to" HeaderText="To" ItemStyle-Width="50" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:Button ID="btnDisplay" runat="server" Text="Show selected Data" OnClick="btmDisplay_Click" />
    <br /><br />
    <asp:Label ID="lblmsg" runat="server" />
    </form>
            </div>
                        </div>
         </div>
    </asp:Content>