<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 

</head> 
<body>

<%-- <label class="sr-only" for="searchKeyword"> 도시명 </label> 
<input type="text"  id="searchKeyword" name="searchKeyword" placeholder="검색어"
value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
 --%>
<form name="multiForm" id="multiForm" action="/planner/addRoute" method="post">
	<div class="container">
		<div class="row">
	  	<div class="col-md-12 col-lg-12">
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

	    	 </table>
	    	 </div>
	    	 </div>
	    	 </div>
	    	</form>
		<script type="text/javascript">	

		
$('#list_table').on("click", ".deletebtn", function () {

  // this == a의 부모의 부모는 tr태그
  	var deletebtn = $(this);
				
		var tr = deletebtn.parent().parent();
			var td = tr.children();
			var no = td.eq(0).text();
			
			alert(no);
			  $(this).parent().parent().remove();
			for (var i = 0; i < myMarkers.length; i++) {
	            if (myMarkers[i].id == no) {                
	                myMarkers[i].setMap(null);
	              
	                myMarkers.splice(i, 1);
	                array.splice(i, 1);
	                poly.getPath().removeAt(i)
	                return;
	            	}
	            }
			}) 
</script>
<div class="container">
<div class="row">
<div class="col-md-12 col-lg-12">
  <div id="map" style="width: 1000px; height: 700px;"></div>
  </div>
  </div>
  </div>
<!-- 
	<div id="floating-panel">
      <input onclick="clearMarkers();" type=button value="Hide Markers">
      <input onclick="showMarkers();" type=button value="Show All Markers">
      <input onclick="deleteMarkers();" type=button value="Delete Markers">
    </div>  -->
  <script>
  var locations = ['런던','파리','니스','프랑크푸르트','베를린','로마','베니스','바르셀로나','마드리드','부다페스트'];
  var locationLat = ['51.5073509','48.856614','43.7101728','50.1109221','52.52000659999999','41.9027835','45.4408474','41.3850639','40.4167754','47.497912'];
  var locationLng = ['-0.1277583','2.3522219','7.261953200000001','8.6821267','13.404954','12.4963655','12.3155151','2.1734035','-3.7037902','19.040235'];
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
    var myMarker;
    var iconURLPrefix = 'http://maps.google.com/mapfiles/ms/icons/';
	var myMarkers=new Array();
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
    var plannerCode=${planner.plannerCode};
 	 $.ajax({
 	url : "/planner/json/getRouteCityName/"+plannerCode,
 	method : "GET",
 	dataType : "json",
 	 async:false,
 	headers : {
 	"Accept" : "application/json",
 	"Content-Type" : "application/json"
 	},

 	success : function(JSONData) {
 		console.log(JSONData);   
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
  	 async:false,
  	headers : {
  	"Accept" : "application/json",
  	"Content-Type" : "application/json"
  	},

  	success : function(JSONData2) {
  		console.log(JSONData2);   
  	routeLat = JSONData2;

  	}
  	});
  	

   	$.ajax({
   	url : "/planner/json/getRouteLng/"+plannerCode,
   	method : "GET",
   	dataType : "json",
    async:false,
   	headers : {
   	"Accept" : "application/json",
   	"Content-Type" : "application/json"
   	},

   	success : function(JSONData3) {
   		console.log(JSONData3);   
   	routeLng = JSONData3;

   	}
   	});
	$.ajax({
   	  	url:"/planner/json/getRouteList/"+plannerCode,
   		method : "GET" ,
        dataType : "json",
        async:false,
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
            	displayValue += ('<td>'+"<select><option value='"+value.stayDay+"' selected='selected'>"+value.stayDay+"</option><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option></select>"+'</td>');
            	  
            	//displayValue += ('</tr>');                                    
            /* //}); */});
            //displayValue += ('</tbody>');
            //displayValue += ('</table>');
            $('#list_table' ).html(displayValue);
        }
    });          
            
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
		        id:route[i],
		      });     
	      markers.push(myMarker);
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
   		   marker.setMap(null);
   		   markers.push(marker);
   		   
   			
   	   
   		   google.maps.event.addListener(marker, 'mouseover', function(){
   			
   			//var isFirst=true;
			  // if(isFirst){
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
	   		      // We only have a limited number of possible icon colors, so we may have to restart the counter
	   		      if(iconCounter >= iconsLength) {
	   		        iconCounter = 0;
	   		      }
	   		    }
	   	});


	// Handles click events on a map, and adds a new point to the Polyline.

	
	
	 function addLatLng(event) {
	        var path=poly.getPath();

	        path.push(event.latLng);
	        //alert(event.latLng+"1");
	    
	        // Add a new marker at the new plotted point on the polyline.
	         myMarker = new google.maps.Marker({
	          position: event.latLng,
	          title: '#' + path.getLength(),
	         // id:path.getLength(),
	          map: map 
	        });
	        
	     myMarker.id=uniqueId;
	      uniqueId++;
	  
	       /*  google.maps.event.addListener(myMarker, 'click', function(){
	 		   myFunction();
	 	   }); */
	 	   
	        myMarkers.push(myMarker);
	      
	        
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