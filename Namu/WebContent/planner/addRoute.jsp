<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- bootstrap -->

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
	 
	 <!--  map -->
	 <script src="http://maps.google.com/maps/api/js?key=AIzaSyBbf0HKJJ4i60j9RDc4qMj_bNR7prq4FxI"></script>
	 
	 <!-- Font Awesome  -->
	<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
	
	 <!-- bootstrap css-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

	<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	<!-- css -->
  <link rel="stylesheet" type="text/css" href="/resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="/resources/css/planner.css">

<style>
.table-fill {
  
   border-radius: 10px ;
   box-shadow: 3px 3px 0 rgba(0,0,0,0.1);
   max-width: calc(100% - 2em);
   margin: 1em auto;
   overflow: hidden;
   width: 800px;
}


   tr:nth-child(odd) td {
  background:#cbcbcb;
}
tr:hover td {
  background:#A3DAFF;
} 
tr:nth-child(odd):hover td {
  background:#A3DAFF;
} 


</style>
</head> 
<body>
	<header><jsp:include page="/layout/header.jsp" /></header>
<!-- progress bar  -->
<div class="container-fluid " id="progress">
      <ul class="progressbar">
          <li > 1 Step</li>
          <li class="active">2 Step </li>
          <li>3 Step</li>
  		</ul>
		</div>
	<br><br><br>
<h4 class="text-center"> 루트 짜기 </h4>
		<br><br>
<!-- map -->
<div class="container">
<div id="map" style="width: 1200px; height: 700px;"></div>
</div>
	
<%-- 
<label class="sr-only" for="searchKeyword"> 도시명 </label> 
<input type="text"  id="searchKeyword" name="searchKeyword" placeholder="검색어"
value="${! empty search.searchKeyword ? search.searchKeyword : '' }"> --%>

<!-- <form name="multiForm" id="multiForm" action="/planner/addRoute" method="post"> -->

<form>
<table  class="table-fill" id="list_table">
	<thead>
		<tr>
		<!-- <th>dd</th> -->
			<th style="display:none;"> </th>
			<th style="text-align:center;"> 도시  </th>
			<th style="display:none;"> </th>
			<th style="display:none;"> </th>
			<th>체류일   </th>
			<th>삭제 </th>
		</tr>
	</thead>
	
	<tbody class="table-hover">
	</tbody>
	    	 </table>
	 <!--    	 <input type="submit" id="mul_input_submit" name="mul_input_submit" />
	    -->
	    	</form>

	
	 <div class="col-md-10 col-lg-12" >
<div class="row">
   <div class="col-md-6"></div>
      <div class="col-md-4">
		     <a class="btn btn-default" href="#" role="button">취&nbsp;소</a>
		  
		      <button type="button" class="btn btn-default"  > 다음 단계  </button>
		      </div></div></div>
	<script type="text/javascript">	
	
	function fncAddRoute(){
		
		$($("form")[1]).attr("method" , "POST").attr("action" , "/planner/addRoute").attr("enctype" , "multipart/form-data").submit();
	}	
		
	
	$(function(){
    $("button").on("click",function(){    	
    	fncAddRoute();    	
    });
	
    $("a[href='#']").on("click",function(){
    	
    	history.go(-1);
    	
    });
    
});
$('#list_table').on("click", ".deletebtn", function () {

  	var deletebtn = $(this);
				
		var tr = deletebtn.parent().parent();
			var td = tr.children();
			var no = td.eq(0).html();
			
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

  <script>
  
  	var locations = [];
    var locationLat = [];
    var locationLng = []; 
    var locationFlag=[];
    
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
	var array2=[];

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
    var image = "/resources/images/favicon.ico";
    
    var infowindow;
    var map;
   	var myMarkerId;
   	
  $(function() {	
 	 $.ajax({
 	url : "/guide/json/getCityList/all",
 	method : "get",
 	dataType : "json",
 	async:"false",
 	headers : {
 	"Accept" : "application/json",
 	"Content-Type" : "application/json"
 	},

 	success : function(JSONData,status){
 		$.each(JSONData,function(index,item){
 			locations.push(item.cityName);
 			locationLat.push(item.lat);
 			locationLng.push(item.lng);
 			locationFlag.push(item.flagImage);
 			});
 		}
 	 });
 
   alert(locations); 
  
   ////////////////////initmap setting///////////////
    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 5,
      center: new google.maps.LatLng(47.5, 7),
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
   ////////////////////////////////////////////////////
      poly = new google.maps.Polyline({
          strokeColor: '#f25c5c',
          strokeOpacity: 1.0,
          strokeWeight: 3
        });
        poly.setMap(map);
});
   	
   	//////////////////location marker /////////////////////
   	$(function(){
   		for (var i = 0; i < locations.length; i++) {
   		      var marker = new google.maps.Marker({
   		        position: new google.maps.LatLng(locationLat[i], locationLng[i]),
   		        map: map,
   		        id:locations[i],
   		        icon: icons[iconCounter],
   		      	content:locationFlag[i]
   		      });
   		      markers.push(marker);
   		      
///////////////location marker mouseover event -infowindow /////////////////////
   		   google.maps.event.addListener(marker, 'mouseover', function(){
			var marker= this;
				  
			infowindow.setContent('<img src="/resources/images/flag/'+this.content+'" alt="..." height="20" width="35">'    
						+"　"+this.id+ '</p>' + "도시설명");
	        infowindow.open(map, marker);
   		   });
	
//////////////////location marker click event /////////////////////
   		   google.maps.event.addListener(marker, 'click', function(){
			var marker= this;
			array.push(this.id);
			array2.push(this.content);
			});
   		   google.maps.event.addListener(marker, 'click', addLatLng);

	   		      iconCounter++;
	  
	   		      if(iconCounter >= iconsLength) {
	   		        iconCounter = 0;
	   		      }
	   		    }
	   	});

/////////////////////add myMarker , polyline ////////////////// ///////
	 function addLatLng(event) {
	        var path=poly.getPath();

	        path.push(event.latLng);
	        //alert(event.latLng+"1");

	         myMarker = new google.maps.Marker({
	          position: event.latLng,
	          title: '#' + path.getLength(),
	         // id:path.getLength(),
	         icon:image,
	          map: map 
	        });
	        
	    	myMarker.id=uniqueId;
	    	uniqueId++;

	        myMarkers.push(myMarker);
	      
//////////////////////route table에 append ////////////////////////
		   $('#list_table').append(
					$('<tr>').append(
					/* 	$('<td>').append("<img src='/resources/images/flag/'"+array2[path.getLength()-1]+"alt='...' height='20' width='35'>"), */
						$('<td  style="display:none;">').append(""+myMarker.id),
						$('<td>').append("<input name='cityName' type='text' id='cityName' value='"+array[path.getLength()-1]+"' style='background-color:transparent;border:0 solid black;' readonly>"),
						$('<td  style="display:none;" >').append( "<input name='lat' type='text' id='lat' value="+myMarker.position.lat()+" style='display:none;' readonly>"),
						$('<td  style="display:none;" >').append( "<input name='lng' type='text' id='lng' value="+(myMarker.position.lng()).toFixed(6)+" style='display:none;' readonly>"),
						$('<td>').append( "<select name='stayDay' id='stayDay'><option value='1' selected='selected'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option></select>"),
						$('<td>').append(
								 "<input class='deletebtn' type='button' value = 'delete' id='delete' />")
					)
				);
		   }
	 
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


	      function showMarkers() {
	        setMapOnAll(map);
	      }

	      function deleteMarkers() {
	    	  
	        clearMarkers();
	      	myMarkers = [];
	      	 poly.setPath(null);
	 			
	      }

	</script> 
	</body>

</html>