<%@ Page MasterPageFile="header.master" Language="C#" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="RegistrationEmail.routes_list" %>
<asp:Content ContentPlaceHolderId="CPH1" runat="server">

     <div id='container'>
    
   
        <div class="page">       
        <div class="center">

        

    <form id="form1" runat="server">
    <asp:GridView ID="GridView1"   AllowSorting="True" AutoGenerateColumns="false" runat="server" DataKeyNames="id"
        OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
        OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="From" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("go_from") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("go_from") %>'></asp:TextBox>
                </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="To" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("go_to") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtCountry" runat="server" Text='<%# Eval("go_to") %>'></asp:TextBox>
                </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>


        <br />
        <br />
    <table border="1"   >
        <tr>
            <td style="width: 150px">
                From:<br />
                <asp:TextBox ID="TextBox1" runat="server" Width="140" />
            </td>
            <td style="width: 150px">
                To:<br />
                <asp:TextBox ID="TextBox2" runat="server" Width="140" />
            </td>
            <td style="width: 100px">
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
            </td>
        </tr>
    </table>
    </form>
</div>
            </div>
         </div>
    </asp:Content>