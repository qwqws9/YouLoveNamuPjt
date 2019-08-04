<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 

</head> 
<body>
<script type="text/javascript">	

		
</script>

		<div class="col-md-12">
	<div class="row">
	
	<div class="col-md-1"></div>
		<div class="col-md-8">
	  		<div id="map" style="width: width: 100%; height: 500px;">
			</div>
		</div>
		<div class="col-md 2">
	<!-- 	<div class="col-md-2" style="border: 1px solid #A3DAFF; overflow: hidden; text-overflow: ellipsis; "> -->
			<div class="where" id="where">
				<div class="row text-center">
					<div class="col-md-6 col-lg-6">
						<strong style="font-size: 15px;">
							<span style="color:#a3daff;">체류도시</span>
						</strong>
					</div>
					<div class="col-md-6 col-lg-6">
						<strong style="font-size: 15px;">
							<span style="color:#a3daff;">체류기간</span>
						</strong>
					</div></div></div>
			
			
			</div>
  		<!-- </div> -->
  		<div class="col-md-1"></div>
  
	</div>
</div>  
<!-- 
	<div id="floating-panel">
      <input onclick="clearMarkers();" type=button value="Hide Markers">
      <input onclick="showMarkers();" type=button value="Show All Markers">
      <input onclick="deleteMarkers();" type=button value="Delete Markers">
    </div>  -->
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
   	var image = "/resources/images/favicon.ico";
   	
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
       		
       		$('#where').append('<hr><div class="row text-center">'+
	           						'<div class="col-md-6 col-lg-6">'+
	            						'<strong style="font-size: 15px;">'+
	            						'<span>'+value.city+'</span>'+
	            						'</strong>'+
	            					'</div>'+
	            					'<div class="col-md-6 col-lg-6">'+
										'<strong style="font-size: 15px;">'+
											'<span>'+value.stayDay+'</span>'+
										'</strong>'+
									'</div>'+
	           					'</div>'
	           					);
           	  
           	//$('#where').html(displayValue);
        	});
    	}
	});
            
	 
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
    	  strokeColor: '#30a9de',
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
		        icon:image
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
	              icon:image,
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