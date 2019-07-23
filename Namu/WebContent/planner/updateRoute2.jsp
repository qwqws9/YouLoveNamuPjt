<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
  <title>Google Maps Multiple Markers</title> 
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  
<script src="http://maps.google.com/maps/api/js?key=AIzaSyBbf0HKJJ4i60j9RDc4qMj_bNR7prq4FxI"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head> 
<body>
<label class="sr-only" for="searchKeyword"> 도시명 </label> 
<input type="text"  id="searchKeyword" name="searchKeyword" placeholder="검색어"
value="${! empty search.searchKeyword ? search.searchKeyword : '' }">

<form name="multiForm" id="multiForm" action="/planner/addRoute" method="post">
<table border="1" id="list_table">
	<colgroup>
		<col style="width:70px;">
		<col style="width:200px;">
		<col style="width:300px;">
		<col style="width:200px;">
	</colgroup>

	<thead>
		<tr>
			<th>No</th>
			<th>City </th>
			<th>lat</th>
			<th>lng</th>
			<th>몇박  </th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>

	</tbody>
 <input type="submit" id="mul_input_submit" name="mul_input_submit" />

	    	 </table>
	    	 
	    	</form>
		<script type="text/javascript">	

		
$('#list_table').on("click", ".deletebtn", function () {

  // this == a의 부모의 부모는 tr태그
  	var deletebtn = $(this);
				
		var tr = deletebtn.parent().parent();
			var td = tr.children();
			var no = td.eq(0).text();
			var cn = td.eq(1).text();
			alert(no);
			
			  $(this).parent().parent().remove();
			for (var i = 0; i < myMarkers.length; i++) {
	            if (myMarkers[i].id == no || myMarkers[i].id == cn) {                
	                myMarkers[i].setMap(null);
	              
	                myMarkers.splice(i, 1);
	                array.splice(i, 1);
	                poly.getPath().removeAt(i)
	                return;
	            	}
	            }
			}) 
</script>

  <div id="map" style="width: 1300px; height: 700px;"></div>
	<div id="floating-panel">
      <input onclick="clearMarkers();" type=button value="Hide Markers">
      <input onclick="showMarkers();" type=button value="Show All Markers">
      <input onclick="deleteMarkers();" type=button value="Delete Markers">
    </div>
  <script>
  
    var route=[];
    var routeLat=[];
    var routeLng=[];
    
  /* var locations = [];
    var locationLat = [];
    var locationLng = []; */
    var markers = new Array();
    var iconCounter = 0;
    var iconsLength;
    var poly;
    var no;
    var uniqueId=1;
    var marker;
    var myMarker;
    var iconURLPrefix = 'http://maps.google.com/mapfiles/ms/icons/';
	var myMarkers=new Array();
	var firstMarkers;
	var array=[];
    var rowcount = 0;
    var icons = [
      iconURLPrefix + 'ltblue-dot.png',
      iconURLPrefix + 'green-dot.png',
      iconURLPrefix + 'blue-dot.png',
      iconURLPrefix + 'orange-dot.png',
      iconURLPrefix + 'purple-dot.png',
      iconURLPrefix + 'pink-dot.png',      
      iconURLPrefix + 'yellow-dot.png',
      iconURLPrefix + 'red-dot.png',
    ];
    var infowindow;
    var map;
   	var myMarkerId;
   	
   	
  $(function() {
    var plannerCode=1;
 	 $.ajax({
 	url : "/planner/json/getRouteCityName/"+plannerCode,
 	method : "GET",
 	dataType : "json",
 	headers : {
 	"Accept" : "application/json",
 	"Content-Type" : "application/json"
 	},

 	success : function(JSONData) {

 	route = JSONData;
 	

 	$("#searchKeyword").autocomplete({
 	source : route

 	});
 	}
 	});
 	
  	$.ajax({
  	url : "/planner/json/getRouteLat/"+plannerCode,
  	method : "GET",
  	dataType : "json",
  	headers : {
  	"Accept" : "application/json",
  	"Content-Type" : "application/json"
  	},

  	success : function(JSONData2) {

  	routeLat = JSONData2;

  	}
  	});
  	

   	$.ajax({
   	url : "/planner/json/getRouteLng/"+plannerCode,
   	method : "GET",
   	dataType : "json",
   	headers : {
   	"Accept" : "application/json",
   	"Content-Type" : "application/json"
   	},

   	success : function(JSONData3) {

   	routeLng = JSONData3;

   	}
   	});
   	
   	$.ajax({
   	  	url:"/planner/json/getRouteList/"+plannerCode,
   		method : "GET" ,
        dataType : "json",
        headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
        success:function(JSONData){
        	console.log(JSONData);   
        	
  
        	var displayValue;
        	   $(JSONData).each(function(data,value) {
        		   
            	displayValue += ('<tr>');                
            	displayValue += ('<td>'+''+'</td>');
            	displayValue += ('<td>'+value.city+'</td>');
            	displayValue += ('<td>'+value.lat+'</td>');
            	displayValue += ('<td>'+value.lng+'</td>');    
            	displayValue += ('<td>'+value.stayDay+'</td>');
            	displayValue += ('<td>'+"<input class='deletebtn' type='button' value = 'delete' id='delete' />"+'</td>');  
            	//displayValue += ('</tr>');                                    
            /* //}); */});
            //displayValue += ('</tbody>');
            //displayValue += ('</table>');
            $('#list_table' ).html(displayValue);
        }
    });          
            
   	//});
 	
	 alert(route);
   /* alert(locations); */ 
    
    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 5,
      center: new google.maps.LatLng(48.864716, 2.349014),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      mapTypeControl: false,
      streetViewControl: false,
      panControl: false,
      zoomControlOptions: {
         position: google.maps.ControlPosition.LEFT_BOTTOM
      }
    });

    infowindow = new google.maps.InfoWindow({
      maxWidth: 160
    });

    iconsLength = icons.length;
    
    
    ///////////////////////////////////////////
      poly = new google.maps.Polyline({
          strokeColor: '#f25c5c',
          strokeOpacity: 1.0,
          strokeWeight: 3
        });
        poly.setMap(map);
    /////////////////////////////////////////////


});
   	
   	//////////////////marker/////////////////////
   	$(function(){
   	  for (var i = 0; i < route.length; i++) {
	      var myMarker = new google.maps.Marker({
	        position: new google.maps.LatLng(routeLat[i], routeLng[i]),
	        map: map,
	        id:route[i]
	      });     
	      myMarkers.push(myMarker);
	      array.push(myMarker.id);
	      firstMarkers=myMarkers.length; 
      
	      var path=poly.getPath();
      path.push(new google.maps.LatLng(routeLat[i], routeLng[i]));
    
	}
   		for (var i = 0; i < locations.length; i++) {
   		      var marker = new google.maps.Marker({
   		        position: new google.maps.LatLng(locationLat[i], locationLng[i]),
   		        map: map,
   		        id:locations[i],
   		    	icon: icons[iconCounter]
   		      });
   		   markers.push(marker);

   		   google.maps.event.addListener(marker, 'mouseover', function(){

				   var marker= this;
	   				infowindow.setContent(this.id+ '</p>' +"도시설명");
			        infowindow.open(map, marker);
   		   });

			   google.maps.event.addListener(marker, 'click', function(){
				   var marker= this;
			  		array.push(this.id);
			   });
	   		 	google.maps.event.addListener(marker, 'click', addLatLng);
	   		   
	   		      iconCounter++;
	   		        if(iconCounter >= iconsLength) {
	   		        iconCounter = 0;
	   		      }
	   		        
	   		    }
 	 
  	});


	
	 function addLatLng(event) {
	        var path=poly.getPath();

	        path.push(event.latLng);
	        //alert(event.latLng+"1");
	    
	         myMarker = new google.maps.Marker({
	          position: event.latLng,
	         // title: '#' + path.getLength(),
	         // id:path.getLength(),
	          map: map 
	        });
	        
	 	 	myMarker.id=uniqueId;
	     	uniqueId++; 
	  
	       /*  google.maps.event.addListener(myMarker, 'click', function(){
	 		   myFunction();
	 	   }); */
	 	   
	        myMarkers.push(myMarker);
	 	  	alert(path.getLength());
		    alert(firstMarkers);
	        
	       /* $.each(myMarkers,function(index){
	    	   alert(index+" 번째 "+myMarkers[index].position);
	    	   alert(" 번째 "+myMarker.id.position);
	  
	    //////////////////////////////////////////////////////////
	    	var index; */
	    
	    	   rowcount=rowcount+1;
		   $('#list_table').append(
					$('<tr>').append(
						$('<td>').append(""+myMarker.id),
						//$('<td>').append(""+index),
						$('<td>').append("<input name='cityName' type='text' id='cityName' value="+array[path.getLength()-1]+" readonly>"),    
						$('<td>').append( "<input name='lat' type='text' id='lat' value="+myMarker.position.lat()+" readonly>"),
						$('<td>').append( "<input name='lng' type='text' id='lng' value="+(myMarker.position.lng()).toFixed(6)+" readonly>"),
						$('<td>').append( "<select name='stayDay' id='stayDay'><option value='1' selected='selected'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option></select>"),
						$('<td>').append(
								 "<input class='deletebtn' type='button' value = 'delete' id='delete' />")
					)
				);
		   }
	  ///////////////////////////////////////  

	  //////////////////////////////////////////전체마커 관리용//////////////////
	  function setMapOnAll(map) {
		 for (var j = 0; j < myMarkers.length; j++) {
		 	myMarkers[j].setMap(map); 
	 		}
		 poly.setMap();
		}

	
	</script> 
	</body>

</html>