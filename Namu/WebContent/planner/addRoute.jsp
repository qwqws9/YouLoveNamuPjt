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

<form name="multiForm" id="multiForm" method="post">
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
 <input type="button" id="mul_input_submit" name="mul_input_submit" value="submit"/>

	    	 </table>
	    	</form>

<script type="text/javascript">


/* function submit() {

    var form = document.createElement("form");
    form.setAttribute("charset", "UTF-8");
    form.setAttribute("method", "Post");  //Post 방식
    form.setAttribute("action", "/planner/addRoute"); //요청 보낼 주소

    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "mName");
    hiddenField.setAttribute("value", mName);
    form.appendChild(hiddenField);

    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "mEmail");
    hiddenField.setAttribute("value", mEmail);
    form.appendChild(hiddenField);

    document.body.appendChild(form);
    form.submit();
 } */


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

  <div id="map" style="width: 1300px; height: 700px;"></div>
	<div id="floating-panel">
      <input onclick="clearMarkers();" type=button value="Hide Markers">
      <input onclick="showMarkers();" type=button value="Show All Markers">
      <input onclick="deleteMarkers();" type=button value="Delete Markers">
    </div>
  <script>

    var locations = ['런던','파리','니스','프랑크푸르트','베를린','로마','베니스','바르셀로나','마드리드','부다페스트'];
    var locationLat = ['51.5073509','48.856614','43.7101728','50.1109221','52.52000659999999','41.9027835','45.4408474','41.3850639','40.4167754','47.497912'];
    var locationLng = ['-0.1277583','2.3522219','7.261953200000001','8.6821267','13.404954','12.4963655','12.3155151','2.1734035','-3.7037902','19.040235'];
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
   	var day = ["1","2","3","4","5","6","7","8","9","10"];
   	var option=day;
   	
  $(function() {

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
   		for (var i = 0; i < locations.length; i++) {
   		      var marker = new google.maps.Marker({
   		        position: new google.maps.LatLng(locationLat[i], locationLng[i]),
   		        map: map,
   		        id:locations[i],
   		        icon: icons[iconCounter]
   		      });
   		      markers.push(marker);
   		 
   		      
   		      
   		   google.maps.event.addListener(marker, 'mouseover', function(){
   			
   			//var isFirst=true;
			  // if(isFirst){
				   var marker= this;
	   				infowindow.setContent(this.id+ '</p>' +"도시설명");
			        infowindow.open(map, marker);
   		   });
			        //isFirst = false;	
				  // }
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
						$('<td>').append("<input name=cityName' type='text' id='cityName' value="+array[path.getLength()-1]+" readonly>"),
						$('<td>').append( "<input name='lat' type='text' id='lat' value="+myMarker.position.lat()+" readonly>"),
						
						$('<td>').append( "<input name='lng' type='text' id='lng' value="+myMarker.position.lng()+" readonly>"),
						$('<td>').append( "<input name='stayDay' type='text' id='stayDay'>"),
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
	  
	 
	  function clearMarkers() {
	        setMapOnAll(null);
	      }

	      // Shows any markers currently in the array.
	      function showMarkers() {
	        setMapOnAll(map);
	      }

	      // Deletes all markers in the array by removing references to them.
	      function deleteMarkers() {
	    	  
	        clearMarkers();
	      	myMarkers = [];
	      	 poly.setPath(null);
	 			
	      }
	
	 
        /////////////////////////        ////////////////////////        ////////////////////////
	 /*  function DeleteMarker(myMarkerId){  */
	/*  function DeleteMarker(myMarkerId) { */
	        //Find and remove the marker from the Array
	        //myMarker.id=myMarkerId;
	
	      //no =$(this).parent().parent().children().eq(0).text();
	       // no=$(this).closest('tr').prevAll().length;

			
	        //poly.setPath(null);
	
	     
        ////////////////////////        ////////////////////////        ////////////////////////  
	  function searchMarker() {

			for (var i = 0; i < markers.length; i++) {
	            if (searchKeyword.text() == markers[i].id) {              
	    	infowindow.open(map, marker);  
	   }
			}
	    }; 


	</script> 
	</body>

</html>