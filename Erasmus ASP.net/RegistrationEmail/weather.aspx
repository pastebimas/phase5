<%@ Page MasterPageFile="header.master" Language="C#" AutoEventWireup="true"  Inherits="RegistrationEmail.login" %>


<asp:Content ContentPlaceHolderId="CPH1" runat="server">
   <div id='container'>
    
   
        <div class="page">       
        <div class="center">

<h1>GeoIP information</h1>
<script type="text/javascript" src="//js.maxmind.com/js/geoip.js">
  </script>
 
 
   <h2>City</h2>
  
      <script type="text/javascript">
          document.write(geoip_city());
      </script>

<h2>Country Name</h2>
   
      <script type="text/javascript">
          document.write(geoip_country_name());
      </script>
  


<br />

<h1>Weather</h1>
 <div class="weather-wrapper hide">

		 
		<p><strong>Place</strong>
		<br /><span class="weather-place"></span></p>
		
		<p><strong>Temperature</strong>
		<br /><span class="weather-temperature"></span> (<span class="weather-min-temperature"></span> - <span class="weather-max-temperature"></span>)</p>
		
		<p><strong>Description</strong>
		<br /><span class="weather-description" ></span></p>
		
		<p><strong>Humidity</strong>
		<br /><span class="weather-humidity"></span></p>
		
		<p><strong>Wind speed</strong>
		<br /><span class="weather-wind-speed"></span></p>
		
		<p><strong>Sunrise</strong>
		<br /><span class="weather-sunrise"></span></p>
		
		<p><strong>Sunset</strong>
		<br /><span class="weather-sunset"></span></p>
	
	</div>
	</div></div></div>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

 
	
	<script src="weather.js"></script>
	
	<script>
	    jQuery.ajax({
	        url: '//freegeoip.net/json/',
	        type: 'POST',
	        dataType: 'jsonp',
	        success: function (location) {
	            // example where I update content on the page.
	            jQuery('#cityy').html(location.city);
	            jQuery('#region-code').html(location.region_code);
	            jQuery('#region-name').html(location.region_name);
	            jQuery('#areacode').html(location.areacode);
	            jQuery('#ip').html(location.ip);
	            jQuery('#zipcode').html(location.zipcode);
	            jQuery('#longitude').html(location.longitude);
	            jQuery('#latitude').html(location.latitude);
	            jQuery('#country-name').html(location.country_name);
	            jQuery('#country-code').html(location.country_code);
	        }
	    });

	    $(function () {

	        $('.weather-temperature').openWeather({
	            city: 'Ljubljana, Slovenia',
	            descriptionTarget: '.weather-description',
	            windSpeedTarget: '.weather-wind-speed',
	            minTemperatureTarget: '.weather-min-temperature',
	            maxTemperatureTarget: '.weather-max-temperature',
	            humidityTarget: '.weather-humidity',
	            sunriseTarget: '.weather-sunrise',
	            sunsetTarget: '.weather-sunset',
	            placeTarget: '.weather-place',
	            iconTarget: '.weather-icon',
	            customIcons: 'img/icons/weather/',
	            success: function () {
	                $('.weather-wrapper').show();
	            },
	            error: function () {
	                console.log("These aren't the droids you're looking for.");
	            }
	        });

	    });

	</script>

</asp:Content>