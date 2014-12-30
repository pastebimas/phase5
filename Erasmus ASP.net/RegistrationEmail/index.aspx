<%@ Page MasterPageFile="header.master"  Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="RegistrationEmail.index" %>

<asp:Content ContentPlaceHolderId="CPH1" runat="server">

     <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script>
        function initialize() {
            var myLatlng = new google.maps.LatLng(-25.363882, 131.044922);
            var myLatlng2 = new google.maps.LatLng(-25.563882, 131.044922);
            var mapOptions = {
                zoom: 4,
                center: myLatlng
            }
            var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: 'Hello World!'
            });
            var marker = new google.maps.Marker({
                position: myLatlng2,
                map: map,
                title: 'Hello World!'
            });
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>

        <div id='map-canvas'> </div>
       
        <div id='left-block'>
    <%= DateTime.Now.ToString() %>
            <h1> Search for the routes! </h1>
           <form id="form1" runat="server">
        <asp:ScriptManager ID="MainScriptManager" runat="server" />
        <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
            <ContentTemplate>
              From:  <br /><asp:TextBox ID="search_go_from" runat="server" CssClass="txt" />
              <br />To:   <br /> <asp:TextBox id="search_go_to" runat="server" AutoPostBack="true"></asp:TextBox>
                <asp:Label runat="server" ID="lblHelloWorld"   />
              <div id="preview" runat="server"></div>  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#BFE4FF" />
        <Columns> 
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="chkCtrl" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id" HeaderText="Route id" ItemStyle-Width="70" />
            <asp:BoundField DataField="go_from" HeaderText="From" ItemStyle-Width="150" />
            <asp:BoundField DataField="go_to" HeaderText="To" ItemStyle-Width="50" />
        </Columns>
    </asp:GridView>
                 
                 <asp:Literal ID="Literal1" runat="server"></asp:Literal> 
                <br /><br />
                <asp:Button runat="server" ID="btnHelloWorld" OnClick="btnHelloWorld_Click" Text="Search!" />

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
          
         
    
        </div>
</asp:Content>