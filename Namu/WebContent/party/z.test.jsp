<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<title>Add custom icons with Markers</title>
<meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />
<script src='https://api.tiles.mapbox.com/mapbox-gl-js/v1.1.1/mapbox-gl.js'></script>
<link href='https://api.tiles.mapbox.com/mapbox-gl-js/v1.1.1/mapbox-gl.css' rel='stylesheet' />
<style>
body { margin:0; padding:0; }
#map { position:absolute; top:0; bottom:0; width:100%; }
</style>
</head>
<body>
 
<style>
.marker {
display: block;
border: none;
border-radius: 50%;
cursor: pointer;
padding: 0;
}
</style>
 
<div id='map'></div>
 
<script>
mapboxgl.accessToken = 'pk.eyJ1Ijoia29zNTY2NyIsImEiOiJjank4cG8yM2cwY3VrM2ZwOTRmaXdweXRwIn0.pmirns4XMt_92FQMsndgyg';
var geojson = {
"type": "FeatureCollection",
"features": [
{
"type": "Feature",
"properties": {
"message": "Foo",
"iconSize": [60, 60]
},
"geometry": {
"type": "Point",
"coordinates": [
-66.324462890625,
-16.024695711685304
]
}
},
{
"type": "Feature",
"properties": {
"message": "Bar",
"iconSize": [50, 50]
},
"geometry": {
"type": "Point",
"coordinates": [
-61.2158203125,
-15.97189158092897
]
}
},
{
"type": "Feature",
"properties": {
"message": "Baz",
"iconSize": [40, 40]
},
"geometry": {
"type": "Point",
"coordinates": [
-63.29223632812499,
-18.28151823530889
]
}
}
]
};
 
var map = new mapboxgl.Map({
container: 'map',
style: 'mapbox://styles/mapbox/streets-v11',
center: [-65.017, -16.457],
zoom: 5
});
 
// add markers to map
geojson.features.forEach(function(marker) {
// create a DOM element for the marker
var el = document.createElement('div');
el.className = 'marker';
el.style.backgroundImage = 'url(https://placekitten.com/g/' + marker.properties.iconSize.join('/') + '/)';
el.style.width = marker.properties.iconSize[0] + 'px';
el.style.height = marker.properties.iconSize[1] + 'px';
 
el.addEventListener('click', function() {
window.alert(marker.properties.message);
});
 
// add marker to map
new mapboxgl.Marker(el)
.setLngLat(marker.geometry.coordinates)
.addTo(map);
});
</script>
 
</body>
</html>