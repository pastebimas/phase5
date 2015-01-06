<%@ Page MasterPageFile="header.master"  Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="RegistrationEmail.index" %>

<asp:Content ContentPlaceHolderId="CPH1" runat="server">

     <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script>
        
        var geocoder;
        var map;
        function initialize() {
            geocoder = new google.maps.Geocoder();
            var latlng = new google.maps.LatLng(-34.397, 150.644);
            var mapOptions = {
                zoom: 8,
                center: latlng
            }
            map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
        }
        var markers = [];
        function codeAddress(address, i, icona) {
           // var address = document.getElementById("address").value;
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    map.setCenter(results[0].geometry.location);
                        markers[i] = new google.maps.Marker({
                            map: map,
                            icon: icona,
                        position: results[0].geometry.location
                    });
                } else {
                    alert("Geocode was not successful for the following reason: " + status);
                }
            });
        }

        // Removes the markers from the map, but keeps them in the array.
        function clearMarkers() {
            setAllMap(null);
        }

        // Shows any markers currently in the array.
        function showMarkers() {
            setAllMap(map);
        }

        // Deletes all markers in the array by removing references to them.
        function deleteMarkers() {
            clearMarkers();
            markers = [];
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
                 <asp:Label ID="lblJavaScript" runat="server" Text=""></asp:Label> 
                <br /><br />
                <asp:Button runat="server" ID="btnHelloWorld" OnClick="btnHelloWorld_Click" Text="Search!" />

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
          
         
    
        </div>
</asp:Content>