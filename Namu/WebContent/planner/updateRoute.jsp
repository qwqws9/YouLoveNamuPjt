<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
   <jsp:include page="/layout/head.jsp" />
   
<jsp:include page="/guide/tourModal.jsp" />
	<!-- bootstrap -->
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
	
	<!-- Font Awesome SVG with JavaScript -->
	<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
	
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	
<script src="http://maps.google.com/maps/api/js?key=AIzaSyBbf0HKJJ4i60j9RDc4qMj_bNR7prq4FxI"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
   <link rel="stylesheet" type="text/css" href="/resources/css/planner.css">
<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>

<style> 
.table-fill {
  
   border-radius: 10px ;
   box-shadow: 3px 3px 0 rgba(0,0,0,0.1);
   max-width: calc(100% - 2em);
   margin: 1em auto;
   overflow: hidden;
   width: 300px;
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
<div style="display:none">
<button type="button" class="btn btn-primary" data-toggle="modal" id="tourModalShow"  data-target="#modalTourList" >관광지</button>
</div>
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
		
	<!-- area  -->
<div class="col-md-10 col-lg-12" >
  <div class="row">	
  	<!-- left area  -->
   <div class="col-md-1"></div>	
<!-- map area -->

 	<div class="col-md-7">
<div id="map" style="width: 100%px; height: 600px;"></div>
</div>

<!-- table area -->
<div class="col-md-2" >
<form>
<table  class="table-fill" id="list_table">
	<thead>
		<tr>
			<th style="display:none;"> </th>
			<th style="display:none;"> </th>
			<th > 도시  </th>
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
	    	</form></div>
	    	
<!-- right area -->
	   
	    	
	   <!-- area -->
	    	</div>
	    	</div>
<!--  area end -->
	<br>	<br>	<br>	<br>
	 <div class="col-md-10 col-lg-12" >
<div class="row">
   <div class="col-md-8"></div>
      <div class="col-md-2">
		      <button type="button" class="btn btn-default" id="previous" style="color:#868296" > 이전 단계  </button>
		      <button type="button" class="btn btn-default" id="save" style="color:#868296"> 다음 단계  </button>
		      </div></div></div>
		         <br>   <br>   <br>   <br>
	<script type="text/javascript">	

		function fncUpdateRoute(){
			
			$($("form")[1]).attr("method" , "POST").attr("action" , "/planner/updateRoute").attr("enctype" , "multipart/form-data").submit();
		}	
			
		
		$(function(){
	    $("#save").on("click",function(){    	
	    	fncUpdateRoute();    	
	    });
		
	    $("#previous").on("click",function(){
	    	var plannerCode  =<%= (int)session.getAttribute("plannerCode")%>
			
	    	self.location = "/planner/updatePlanner?plannerCode="+plannerCode;


	    });
	    
	     
	     $(document).on('click','#tourModal',function(){
	    	 var tourId = $(this).next().val().trim();
	    	 tourModal(tourId);
	    	 $('#tourModalShow').trigger('click');
	     })
		 
	    
	});
		
$('#list_table').on("click", ".deletebtn", function () {

  // this == a의 부모의 부모는 tr태그
  	var deletebtn = $(this);
				
		var tr = deletebtn.parent().parent();
			var td = tr.children();
			var no = td.eq(0).html();
			var cn = td.eq(1).text(); 
		/* 	var cn =$("#list_table td input").eq(0).val(); */
			
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

  <script>
    var locations = [];
    var locationLat = [];
    var locationLng = []; 
    var locationFlag=[];
    
    var route=[];
    var routeLat=[];
    var routeLng=[];
   
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
    var image = "/resources/images/planner/icon.png";
    
    var infowindow;
    var map;
   	var myMarkerId;
   	
   	
   	$(function() {	
   		console.log('1번째');
    	 $.ajax({
    	url : "/guide/json/getCityList/all",
    	method : "get",
    	dataType : "json",
    	async: false,
    	headers : {
    	"Accept" : "application/json",
    	"Content-Type" : "application/json"
    	},

    	success : function(JSONData,status){
    		console.log('2번째');
    		$.each(JSONData,function(index,item){
    			locations.push(item.cityName);
    			locationLat.push(item.lat);
    			locationLng.push(item.lng);
    			locationFlag.push(item.flagImage);
    			});
    		}
    	 });
    	 
    var plannerCode  =<%= (int)session.getAttribute("plannerCode")%>
    console.log('3번째');
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
 		console.log('4번째');
 	route = JSONData;
 	
/* 
 	$("#searchKeyword").autocomplete({
 	source : route

 	}); */
 	}
 	});
 	console.log('5번째');
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
  		console.log('6번째');
  	routeLat = JSONData2;

  	}
  	});
  	
  	console.log('7번째');
   	$.ajax({
   	url : "/planner/json/getRouteLng/"+plannerCode,
   	method : "GET",
   	dataType : "json",
    async: false,
   	headers : {
   	"Accept" : "application/json",
   	"Content-Type" : "application/json"
   	},

   	success : function(JSONData3) {
   		console.log('8번째');
   	routeLng = JSONData3;

   	}
   	});
   	console.log('9번째');
   	$.ajax({
   	  	url:"/planner/json/getRouteList/"+plannerCode,
   		method : "GET" ,
        dataType : "json",
        async: false,
        headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
        success:function(JSONData){
        	console.log(JSONData);   
        	console.log('10번째');
        	
  
        	var displayValue;
        	   $(JSONData).each(function(data,value) {
        		   
            	displayValue += ('<tr>');                
              displayValue += ('<td style="display:none">'+''+'</td>');  
   			displayValue += ('<td style="display:none">'+value.city+'</td>'); 

   			/* displayValue += ('<td>'+value.city+'</td>'); 
 */
            	 displayValue += ('<td "text-align:center;">'+"<input name='cityName'  type='text' style='background-color:transparent;border:0 solid black;' value='"+ value.city+ "'>"+'</td>'); 
            	/* displayValue += ('<td>'+$("#tbl tr td input").eq(1).val() */
            /* 	displayValue += ('<td style="display:none">'+value.city+'</td>');  */
				/* displayValue += ('<td>'+value.lat+'</td>');
            	displayValue += ('<td>'+value.lng+'</td>');    */ 
            	 displayValue += ('<td style="display:none">'+"<input name='lat' type='text' value=' "+value.lat+"'>"+'</td>');
            	displayValue += ('<td style="display:none">'+"<input name='lng' type='text' value=' "+value.lng+"'>"+'</td>');     
            	displayValue += ('<td>'+"<select name='stayDay' ><option value='"+value.stayDay+"' selected='selected'>"+value.stayDay+"</option><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option></select>"+'</td>');
            	displayValue += ('<td>'+"<button class='deletebtn' type='button'  style='border:none; background: none' id='delete'>"
			    		+"<i class='fas fa-minus-circle'></i></button>"+'</td>');  
            	//displayValue += ('</tr>');                                    
            /* //}); */});
            //displayValue += ('</tbody>');
            //displayValue += ('</table>');
            $('#list_table' ).html(displayValue);
        }
    });          
            
   	//});
 	
	 //alert(route);
   /* alert(locations); */ 
    console.log('11번째');
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
   		console.log('12번째');
   		for (var i = 0; i < locations.length; i++) {
   		      var marker = new google.maps.Marker({
   		        position: new google.maps.LatLng(locationLat[i], locationLng[i]),
   		        map: map,
   		        id:locations[i],
   		    	icon: icons[iconCounter],
   		    	zIndex: 100,
   		 		content:locationFlag[i]
   		      });
   		   //marker.setMap(map) ;  
   		
   		
   		   //markers.push(marker);
   		   
			/* marker.setMap(map) ;  
			myMarker.setMap(map) ;   */
   		   google.maps.event.addListener(marker, 'mouseover', function(){
   			var marker= this;
   			infowindow.setContent('<img src="/resources/images/flag/'+this.content+'" alt="..." height="20" width="35">'    
					+"　"+this.id+ '</p>'+'<button type="button" style="border-radius:10px;border:0;width:100px;height:35px;background:#F2C029;color:#ffffff; " id="tourModal" >'+this.id+'<p> 관광지 살펴보기 </button>'
					+'<input type="hidden" value="'+this.id+'">'
		
					);
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
   		console.log('13번째');
   		redMarker();
   		console.log('15번째');
  	});
   function redMarker() {
	   console.log('14번째');
	   for (var i = 0; i < route.length; i++) {
		      var myMarker = new google.maps.Marker({
		        position: new google.maps.LatLng(routeLat[i], routeLng[i]),
		        map: map,
		        id:route[i],
		        zIndex: 201,
		        icon:image
		      });     
		
		      myMarkers.push(myMarker);
		    
		      /* marker.setMap(null); */
		      //myMarker.setMap(map)
			   
		      array.push(myMarker.id);
		      firstMarkers=myMarkers.length; 
	      
		      var path=poly.getPath();
	      path.push(new google.maps.LatLng(routeLat[i], routeLng[i]));
	    
		}
   }

	
	 function addLatLng(event) {
	        var path=poly.getPath();

	        path.push(event.latLng);
	        //alert(event.latLng+"1");
	    
	         myMarker = new google.maps.Marker({
	          position: event.latLng,
	         title: '#' + path.getLength(),
	         // id:path.getLength(),
	         icon:image,
	          map: map,
	          zIndex: 205
	        });
	        
	 	 	myMarker.id=uniqueId;
	     	uniqueId++; 
	  
	       /*  google.maps.event.addListener(myMarker, 'click', function(){
	 		   myFunction();
	 	   }); */
	 	   
	        myMarkers.push(myMarker);
	 	  	/* alert(path.getLength());
		    alert(firstMarkers); */
	        
	   /*   $.each(myMarkers,function(index){
	    	   alert(index+" 번째 "+myMarkers[index].position);
	    	   alert(" 번째 "+myMarker.id.position);
	  
	    	var index; 
	    */
	    	   $('#list_table').append(
					$('<tr>').append(
					/* 	$('<td>').append("<img src='/resources/images/flag/'"+array2[path.getLength()-1]+"alt='...' height='20' width='35'>"), */
						$('<td  style="display:none;">').append(""+myMarker.id),
						$('<td  style="display:none;">').append(""),
						$('<td "text-align:center;">').append("<input name='cityName' type='text' id='cityName' value='"+array[path.getLength()-1]+"' style='background-color:transparent;border:0 solid black;' readonly>"),
						$('<td  style="display:none;" >').append( "<input name='lat' type='text' id='lat' value="+myMarker.position.lat()+" style='display:none;' readonly>"),
						$('<td  style="display:none;" >').append( "<input name='lng' type='text' id='lng' value="+(myMarker.position.lng()).toFixed(6)+" style='display:none;' readonly>"),
						$('<td>').append( "<select name='stayDay' id='stayDay'><option value='1' selected='selected'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option></select>"),
						$('<td>').append(
								"<button class='deletebtn' type='button'  style='border:none; background: none' id='delete'>"
					    		+"<i class='fas fa-minus-circle'></i>"
					    		+' </button>'
						
								/*  "<input class='deletebtn' type='button' value = 'delete' id='delete' />" */)
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