<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<script src='https://api.tiles.mapbox.com/mapbox-gl-js/v1.1.1/mapbox-gl.js'></script>
	<link href='https://api.tiles.mapbox.com/mapbox-gl-js/v1.1.1/mapbox-gl.css' rel='stylesheet' />
	<script src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-language/v0.10.1/mapbox-gl-language.js'></script>	
		
	<script src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.4.1/mapbox-gl-geocoder.min.js'></script>
	<link rel='stylesheet' href='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.4.1/mapbox-gl-geocoder.css' type='text/css' />
	
	<style>
		#map {
			height: 500px;
        	width: 1000px;
		}
	</style>
</head>

<body>

	      		
	<div id='map' style='width: 1000px; height: 700px;'></div>
	
	
	<script>

		mapboxgl.accessToken = 'pk.eyJ1Ijoia29zNTY2NyIsImEiOiJjank4cG8yM2cwY3VrM2ZwOTRmaXdweXRwIn0.pmirns4XMt_92FQMsndgyg';
		var map = new mapboxgl.Map({
		container: 'map',
		style: 'mapbox://styles/mapbox/streets-v10',
		center: [4.17 , 48.13],
		zoom: 3,
		});
		
		//mapboxgl.setRTLTextPlugin('https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-rtl-text/v0.1.0/mapbox-gl-rtl-text.js');
		//language
		map.addControl(new MapboxLanguage({
		  defaultLanguage: 'ko'
		}));
		//나의 위치 검색
		map.addControl(new mapboxgl.GeolocateControl({
			positionOptions: {
				enableHighAccuracy: true
			},
				trackUserLocation: true
			}));	
		//search geoCoder
		map.addControl(new MapboxGeocoder({
			accessToken: mapboxgl.accessToken,
			mapboxgl: mapboxgl
			}));
		//Marker	
		var lng;
		var lat;
	  	var marker = new mapboxgl.Marker()
		map.on('click', function(e) {
		  // When the map is clicked, set the lng and lat variables equal to the lng and lat properties in the returned lngLat object
		  lng = e.lngLat.lng;
		  lat = e.lngLat.lat;
		  console.log(lng + ', ' + lat);
		  
		  	marker.setLngLat([lng, lat])
		  	marker.addTo(map);
		  
			});

	
	</script>
</html>