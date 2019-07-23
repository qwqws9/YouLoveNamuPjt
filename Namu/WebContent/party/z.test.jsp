<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<title>Add custom icons with Markers</title>
<meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<script src='https://api.tiles.mapbox.com/mapbox-gl-js/v1.1.1/mapbox-gl.js'></script>
<link href='https://api.tiles.mapbox.com/mapbox-gl-js/v1.1.1/mapbox-gl.css' rel='stylesheet' />
<style>
body { margin:0; padding:0; }
#map { position:absolute; top:0; bottom:0; width:100%; }

.marker {
  width: 25px;
    height: 25px;
    border-radius: 50%;
    border:1px solid gray;
    background-color:lightblue;
}
</style>
</head>
<body>
 
 
<div id='map'></div>
 
	<script>
	mapboxgl.accessToken = 'pk.eyJ1Ijoia29zNTY2NyIsImEiOiJjanlmeDF5dHMwZXFrM25waDY0Nm9kY2o3In0.bXrnQ0ZqZ2ul0OdF-SzW0w';
	mapboxgl.accessToken = 'pk.eyJ1Ijoia29zNTY2NyIsImEiOiJjank4cG8yM2cwY3VrM2ZwOTRmaXdweXRwIn0.pmirns4XMt_92FQMsndgyg';
	var map = new mapboxgl.Map({
		container: 'map',
		style: 'mapbox://styles/mapbox/dark-v10',
		center: [-103.59179687498357, 40.66995747013945],
		zoom: 3
	});
	 
	var geojson = {
			"type": "FeatureCollection",
			"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
			"features": [
			{ "type": "Feature", "properties": { "id": "ak16994521", "mag": 2.3, "time": 1507425650893, "felt": null, "tsunami": 0 }, "geometry": { "type": "Point", "coordinates": [ -151.5129, 63.1016, 0.0 ] } },
			{ "type": "Feature", "properties": { "id": "ak16994519", "mag": 1.7, "time": 1507425289659, "felt": null, "tsunami": 0 }, "geometry": { "type": "Point", "coordinates": [ -150.4048, 63.1224, 105.5 ] } },
			{ "type": "Feature", "properties": { "id": "ak16994517", "mag": 1.6, "time": 1507424832518, "felt": null, "tsunami": 0 }, "geometry": { "type": "Point", "coordinates": [ -151.3597, 63.0781, 0.0 ] } }]}
	
	map.on('load', function() {
		// Add a new source from our GeoJSON data and set the
		// 'cluster' option to true. GL-JS will add the point_count property to your source data.
		map.addSource("dd", {
		type: "geojson",
		// Point to GeoJSON data. This example visualizes all M1.0+ earthquakes
		// from 12/22/15 to 1/21/16 as logged by USGS' Earthquake hazards program.
		data: geojson,
		cluster: true,
		clusterMaxZoom: 14, // Max zoom to cluster points on
		clusterRadius: 50 // Radius of each cluster when clustering points (defaults to 50)
		});
		 
		map.addLayer({
		id: "clusters",
		type: "circle",
		source: "dd",
		filter: ["has", "point_count"],
		paint: {
		"circle-color": [//단계별 원의 컬러 
			"step",
			["get", "point_count"],
			"#51bbd6",
			100,
			"#f1f075",
			750,
			"#f28cb1"
		],
		"circle-radius": [//단계별 카운트
			"step",
			["get", "point_count"],
			20,//100보다 작으면 20크기
			100,//
			30,//100과 750사이 30크기
			750,
			40//750보다 크면 40크기
		]
		}
		});
		 
		
		
		
		map.addLayer({
			id: "cluster-count",
			type: "symbol",
			source: "dd",
			filter: ["has", "point_count"],
			layout: {
			"text-field": "{point_count_abbreviated}",
			"text-font": ["DIN Offc Pro Medium", "Arial Unicode MS Bold"],
			"text-size": 12
		}
		});
		 
		map.addLayer({
			id: "unclustered-point",
			type: "circle",
			source: "dd",
			filter: ["!", ["has", "point_count"]],
			paint: {
			"circle-color": "#11b4da",
			"circle-radius": 4,
			"circle-stroke-width": 1,
			"circle-stroke-color": "#fff"
		}
		});
		 
		// inspect a cluster on click
		map.on('click', 'clusters', function (e) {
			var features = map.queryRenderedFeatures(e.point, { layers: ['clusters'] });
			var clusterId = features[0].properties.cluster_id;
			map.getSource('dd').getClusterExpansionZoom(clusterId, function (err, zoom) {
				if (err)
				return;
				//이전 값과 새 값 사이의 애니메이션 전환을 사용하여 가운데, 줌, 베어링 및 피치의 조합을 변경합니다.
				//지도에는 옵션에 지정되지 않은 모든 세부 정보가 현재 값으로 유지됩니다.
				map.easeTo({
					center: features[0].geometry.coordinates,
					zoom: zoom
				});
			});
		});
	 
		map.on('mouseenter', 'clusters', function () {
			map.getCanvas().style.cursor = 'pointer';
		});
		map.on('mouseleave', 'clusters', function () {
			map.getCanvas().style.cursor = '';
		});
	});

//나의 위치기록??
		
	</script>
</body>
</html>