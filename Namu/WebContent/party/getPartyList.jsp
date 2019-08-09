<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<!-- jQuerty -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<!-- common -->
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<script type="text/javascript" src="/resources/javascript/party.js"></script>
	<!-- 이모티콘 -->
	<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
	<!-- MapBox -->
	<script src='https://api.tiles.mapbox.com/mapbox-gl-js/v1.1.1/mapbox-gl.js'></script>
	<link href='https://api.tiles.mapbox.com/mapbox-gl-js/v1.1.1/mapbox-gl.css' rel='stylesheet' />
	<script src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-language/v0.10.1/mapbox-gl-language.js'></script>	
	<!-- MapBoxGeocoder -->	
	<script src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.4.1/mapbox-gl-geocoder.min.js'></script>
	<link rel='stylesheet' href='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.4.1/mapbox-gl-geocoder.css' type='text/css' />
	
	
	<!-- Full Calendar -->
	<script type="text/javascript"  src="/resources/javascript/moment.min.js"></script>  
	<script type="text/javascript"  src="/resources/javascript/fullcalendar.js"></script>
	<link  rel="stylesheet"  href="/resources/css/fullcalendar.css" />
	
	<style>
		/* 연파  #A3DAFF
		파   #30A9DE
		노   #F2C029
		회   #CBCBCB
		검   #282C37 */
	
	
		.marker {
		  cursor: pointer;
		  background-color: rgba(0, 0, 0, 0);
		}
		/* body {
		  background: #404040;
		  color: #f8f8f8;
		  font: 500 20px/26px 'Helvetica Neue', Helvetica, Arial, Sans-serif;
		  margin: 0;
		  padding: 0;
		  -webkit-font-smoothing: antialiased;
		} */
		
		/* The page is split between map and sidebar - the sidebar gets 1/3, map
		gets 2/3 of the page. You can adjust this to your personal liking. */
		
		/* body {
		  color: #404040;
		  font: 400 15px/22px 'Source Sans Pro', 'Helvetica Neue', Sans-serif;
		  margin: 0;
		  padding: 0;
		  -webkit-font-smoothing: antialiased;
		} */
		
		* {
		  -webkit-box-sizing: border-box;
		  -moz-box-sizing: border-box;
		  box-sizing: border-box;
		}
		h1 {
		  font-size: 22px;
		  margin: 0;
		  color: white;
		  font-weight: 400;
		  line-height: 20px;
		  padding: 20px 2px;
		}
		
		a {
		  color: #404040;
		  text-decoration: none;
		}
		
		.leftbar {
		  width: 33.3333%;
		  height: 100%;
		  top: 0;
		  left: 0;
		  overflow: hidden;
		  border-right: 1px solid rgba(0, 0, 0, 0.25);
		}
		
		/* .pad2 {
		  padding: 20px;
		} */
		
		.map {
		  position: absolute;
		  left: 33.3333%;
		  width: 66.6666%;
		  height: 100%;
		  top: 0;
		  bottom: 0;
		  border: 1px solid rgba(0, 0, 0, 0.25);
		}
		
		.heading {
		  background: #A3DAFF;
		  border-bottom: 1px solid #eee;
		  height: 60px;
		  line-height: 60px;
		  padding: 0 10px;
		}
		
		.listings {
		  height: 100%;
		  overflow: auto;
		  padding-bottom: 60px;
		}
		
		.listings .item {
		  display: block;
		  border-bottom: 1px solid #eee;
		  padding: 10px;
		  text-decoration: none;
		}
		
		.listings .item:last-child { border-bottom: none; }
		
		.listings .item .title {
		  display: block;
		  word-break:break-all;
		  color: #A3DAFF;
		  height: 26px;
		  font-weight: 700;
		  text-overflow: ellipsis;
		  text-decoration: none;
		  transition: 0.3s;
		}
		
		.listings .item .content {
		  display: block;
		  overflow:hidden;
		  height: 26px;
		  word-break:break-all;
		  text-overflow: ellipsis;
		}
	
	
		.listings .item .title small { font-weight: 400; }
		
		.listings .item.active .title,
		.listings .item .title:hover {
		 	color: rgba(242, 192, 41, 0.7) !important;
		 	overflow: visible;
		 	text-overflow: ellipsis;
		 	height: 100%;
		 }
		 
		 
		 /* 내리기 */
		.listings .item.active .content,
		.listings .item .content:hover {
		 	/* overflow: visible;
		 	text-overflow: ellipsis;
		 	height: 100%; */
		 	width: 100%;
		 
		 }
		 /* 클릭후 */
		.listings .item.active .content,
		.listings .item .content:visited {
		 	overflow: visible;
		 	text-overflow: ellipsis;
		 	height: 100%;
		 	width: 100%;
		 
		 }
		
		.listings .item.active {
		  background-color: #f8f8f8;
		}
		
		
		.clearfix { display: block; }
		
		.clearfix::after {
		  content: '.';
		  display: block;
		  height: 0;
		  clear: both;
		  visibility: hidden;
		}
		
			/* Marker tweaks */
			
		.mapboxgl-popup {
		  padding-bottom: 50px;
		}	
		
		.mapboxgl-popup-close-button {
		  display: none;
		}
		
		.mapboxgl-popup-content {
		  font: 400 15px/22px 'Source Sans Pro', 'Helvetica Neue', Sans-serif;
		  padding: 0;
		  width: 220px;
		}
		
		.mapboxgl-popup-content-wrapper {
		  padding: 1%;
		}
		
		.mapboxgl-popup-content h4 {
		  background: rgba(242, 192, 41, 0.8);
		  color: #fff;
		  margin: 0;
		  display: block;
		  padding: 10px;
		  border-radius: 3px 3px 0 0;
		  font-weight: 700;
		  margin-top: -15px;
		  overflow:hidden;
		  text-overflow: ellipsis;
		  word-break:break-all;
		  height: 40px;
		}
		
		.mapboxgl-popup-content h5 {
		  margin: 0;
		  display: block;
		  padding: 10px;
		  font-weight: 400;
		}
		
		.mapboxgl-popup-content div {
		  padding: 3px;
		  overflow:hidden;
		  text-overflow: ellipsis;
		  word-break:break-all;
		}
		
		.mapboxgl-container .leaflet-marker-icon {
		  cursor: pointer;
		}
		
		.mapboxgl-popup-anchor-top > .mapboxgl-popup-content {
		  margin-top: 25px;
		}
		
		.mapboxgl-popup-anchor-top > .mapboxgl-popup-tip {
		  border-bottom-color: #91c949;
		}
		
		.fas.fa-paper-plane.sendParty:hover {
			color: #F2C029;
			transition: 0.3s;
		}
		
		.partySearch{
			border: none;
			border-bottom: 2px solid #A3DAFF;
		}
		.partySearch:focus {
			outline:none;
			border-bottom: 2px solid #F2C029;
			transition: 0.3s;
		}
		
		.fas.fa-cog.update{
			color: #30A9DE;
			cursor: pointer;
/* 			left: 0; */
/* 			padding-left: 0; */
			
		}
		.fas.fa-cog.update:hover{
			color: #F2C029;
			transition: 0.3s;
		}
		.fas.fa-trash-alt.remove{
			color: #30A9DE;
			cursor: pointer;
			left: 0;
			padding-left: 0;
		}
		.fas.fa-trash-alt.remove:hover{
			color: #F2C029;
			transition: 0.3s;
		}
		
	</style>
</head>

<body>
	<header><jsp:include page="/layout/header.jsp" /></header>
	
	<br><br>
	
	
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-1"></div><!-- 사이드바 -->
			
			
			<div class="col-md-10 col-lg-10"><!-- 메인바 -->
			
			
			
<!-- 				<div class="row">Search -->
<!-- 					<div class="col-md-12 col-lg-12"> -->
<!-- 						<div class="row"> -->
<!-- 							<i class="fas fa-search-location" onclick="partySearch()"></i> -->
<!-- 						  	<input type="text" id="partySearch" class="partySearch" placeholder="검색..."> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			
				<br>
							
				<div class="row justify-content-center"><!-- map -->
					<div class="col-md-12 col-lg-12">
						<div class="row" style="height: 800px; border: 1px solid rgba(0, 0, 0, 0.25);">
							<div class='leftbar'>
							  	<div class='heading'>
							    	<h1>동행 게시물 목록</h1>
							  	</div>
							  	<div id='listings' class='listings'></div>
							</div>
							<div id='map' class='map pad2'></div>
						</div>
					</div>
				</div>
				
				<br>	
					
<%-- 				<div class="row justify-content-center"><!-- 게시글 -->
					<div class="col-md-10 col-lg-10">
						<hr>
						<c:forEach var="party" items="${list}">
							<div class="row">
							
							
								<!-- top -->
								<div class="col-md-3 col-lg-3">
									<div class="row justify-content-center">
										<div id="profile-image">
											<a href="#"><img src="/resources/images/profile/${party.partyWriter.profileImg }" id="userImage" name="userImage" alt="글쓴이" class="rounded-circle" width="50px" height="50px"></a>
										</div>
										<div id="profile-nickname" style="padding-top: 8px;">
											<div style="font-size: small; color: #3c64a6;">글쓴이</div>
											<div style="font-size: small; color: #344157;">${party.partyWriter.nickname }</div>
										</div>
									</div>
									
									<p class="text-center" style="font-size: small; color: #344157;">
									<input type="hidden" class="partyCode" value="${party.partyCode}">
										No.<span class="">${party.partyCode}</span>
									</p>
									
									<p class="text-center" style="font-size: small; color: #344157;">
										<span class="">${party.regDate}</span>
									</p>
								</div>
								
								<!-- body -->
								<div class="col-md-7 col-lg-7">
									<div class="row">
										<div class="alert alert-light" role="alert">
											<c:if test="${party.partyRecruitment eq '1' }">모집중</c:if>
											<c:if test="${party.partyRecruitment eq '2' }">모집마감</c:if>
										</div>
									</div>
									<div class="row">
										<div style="overflow: hidden; text-overflow: ellipsis;">
											<h5 style="resize: none; display: inline-blocke">
												<strong class="getParty title" style="cursor: pointer;">${party.partyTitle }</strong>
											</h5>
										</div>
									</div>
									<div class="row">
										<div class="getParty content" style="overflow: hidden; text-overflow: ellipsis; height: 50px;">
											<span class="content" style="resize: none; display: inline-blocke;">${party.partyContent }</span>
										</div>
									</div>
								</div>
								
								<!-- footer -->
								<div class="col-md-2 col-lg-2">
									<div class="row justify-content-center">
										${party.partyStart}
									</div>
									<div class="row justify-content-center">
										${party.partyEnd}
									</div>
									
									<div class="row justify-content-center">
										${party.age}
									</div>
									
									<div class="row justify-content-center">
										<c:if test="${party.gender eq '1' }">남자</c:if>
										<c:if test="${party.gender eq '2' }">여자</c:if>
										<c:if test="${party.gender eq '3' }">상관없음</c:if>
									</div>
								</div>
							</div>
						<hr>
						</c:forEach>
					</div>
				</div><!-- end of for -->
				
 --%>			</div><!-- end of main -->
			
			
						
			
		</div><!-- end row of container -->
	</div><!-- end of container -->
	<script>
		$(document).ready(function(){
			
			
			$(document).on("click",".fas.fa-cog.update",function(event){
				var partyCode = $(this).parent().parent().text().split('·',1);
            	var update = $.trim(partyCode);
            	self.location = "/party/updatePartyView?partyCode="+update;
          	});
			$(document).on("click",".fas.fa-trash-alt.remove",function(event){
				var partyCode = $(this).parent().parent().text().split('·',1);
				var remove = $.trim(partyCode);
				self.location = "/party/deleteParty?partyCode="+remove;
			});
			
			$(document).on('click','.fas.fa-paper-plane.sendParty',function(event){
				var sendUser = '${user.userCode}';
				var receive = $('.userCode').val();
				console.log(sendUser);
				console.log(receive);
				addTimelineParty(sendUser,receive,'4');
				alert("신청이 완료되었습니다.");
			})
			

			
			
		});
		

	
	
	
// 		function partySearch(e){
			
// 			//비우고 안돌아온다.
// 			if($(".listings").length != 0){
// 				alert("dsdd");
// 				$(".listings").empty();
					
// 			}
// 			if($(".marker").length != 0){
// 				//alert($(".marker").length);
// 				//$('div').remove('.marker');
// 			}
			
			
			
// 			var keyword = $(".partySearch").val();
			
// 			$.ajax({
// 				url : "/party/json/getPartyList?sea",
// 			    method : "POST",
// 			    data : JSON.stringify({
// 			    	'searchKeyword' : keyword,
// 			    	'pageSize' : '3'
// 			    }),
// 			    dataType : "json",
// 			    headers : {
// 	     			 "Accept" : "application/json",
// 	                 "Content-Type" : "application/json"
// 	     		},
// 	     		success : function(JSONData, status){
// 	     			$.each(JSONData.list,function(index,item){
// 	     				geo = {type: 'Feature',
// 					    		geometry: {type: 'Point', coordinates: [item.latitude, item.longitude]},
// 					    		properties: { 
// 					    			writer: item.partyWriter.nickname,
// 					    			writerGender: item.partyWriter.gender,
// 					    			writerBirth: item.partyWriter.birth,
// 					    			writerProfileImg: item.partyWriter.profileImg,
// 					    			partyCode: item.partyCode,
// 							    	partyTitle: item.partyTitle,
// 							    	partyAge: item.age,
// 							    	partyContent: item.partyContent,
// 							    	regDate: item.regDate,
// 							    	partyStart: item.partyStart,
// 							    	partyEnd: item.partyEnd,
// 							    	partyRecruitment: item.partyRecruitment,
// 							    	gender: item.gender,
// 							    	country: item.city.countryName,
// 							    	city: item.city.cityName,
// 							    	flag: item.city.flagImage
// 					    		}};
// 	     				json.push(geo);
// 	     				profile = item.partyWriter.profileImg
	     				
// 	     			});
	     			
// 					console.log(geo);
					
					
// 					geojson = {
// 							  type: 'FeatureCollection',
// 							  features: json
// 					};
// 					map.on('load', function(e) {
// 				  		map.addSource('places', {
// 						  type: 'geojson',
// 						  data: geojson
// 						});
// 						  buildLocationList(geojson);
					  
// 					});
// 				 	//회원 변경되었을때 프로필사진 변경되는지 체크필요?????????????????
// 					geojson.features.forEach(function(marker) {
// 						  var el = document.createElement('div');
// 						  el.className = 'marker';
// 						  el.style.cssText = 'background-size: cover;width: 50px;height: 50px;background-image: url("/resources/images/profile/'+profile+'");';
// 						  new mapboxgl.Marker(el, { offset: [0, -23] })
// 						    .setLngLat(marker.geometry.coordinates)
// 						    .addTo(map);
						  
// 						  el.addEventListener('click', function(e) {
// 							  var activeItem = document.getElementsByClassName('active');
// 							  getParty(marker);
// 							  createPopUp(marker);
// 							  e.stopPropagation();
// 							  if (activeItem[0]) {
// 							    activeItem[0].classList.remove('active');
// 							  }
// 							  var listing = document.getElementById('listing-' + i);
// 							  console.log(listing);
// 							});
// 					});
					
// 	     		},
// 	     		error:function(jqXHR, textStatus, errorThrown){
// 	    			alert(textStatus );
// 	    			alert( errorThrown );
// 	    		}
// 			});
			
			
// 		}
	
		$(function(){
			
			
			
			//도시
			$.ajax({
				url : "/guide/json/getCityList/country",
			    method : "POST",
			    //dataType : "json",
			    headers : {
	     			 "Accept" : "application/json",
	                 "Content-Type" : "application/json"
	     		},
	     		success : function(JSONData, status){
	     			$.each(JSONData,function(index,item){
	     				$("#country").append('<option value="'+item.countryName+'">'+item.countryName+'</option>');
	     			});
	     		},
	     		error:function(jqXHR, textStatus, errorThrown){
	    			alert( textStatus );
	    			alert( errorThrown );
	    		}
			});
			//국가
			$("#country").change(function(){
				var selectCountryAfter = $("#country option:selected").text();
				$("#city").empty();
				$.ajax({
					url : "/guide/json/getCityList/"+selectCountryAfter,
				    method : "POST",
				    dataType : "json",
				    headers : {
		     			 "Accept" : "application/json",
		                 "Content-Type" : "application/json"
		     		},
		     		success : function(JSONData, status){
		     			$.each(JSONData,function(index,item){
		     				$("#city").append('<option value="'+item.cityName+'">'+item.cityName+'</option>');
		     			});
		     		},
		     		error:function(jqXHR, textStatus, errorThrown){
		    			alert(textStatus );
		    			alert( errorThrown );
		    		}
				});
			});
		})
		
		
		if (!('remove' in Element.prototype)) {
		  Element.prototype.remove = function() {
		    if (this.parentNode) {
		      this.parentNode.removeChild(this);
		    }
		  };
		}
		
		
		mapboxgl.accessToken = 'pk.eyJ1Ijoia29zNTY2NyIsImEiOiJjanlmeDF5dHMwZXFrM25waDY0Nm9kY2o3In0.bXrnQ0ZqZ2ul0OdF-SzW0w';
		
		
		var map = new mapboxgl.Map({
			container: 'map',
			style: 'mapbox://styles/mapbox/streets-v10',
			center: [4.17 , 48.13],
			zoom: 4,
		});
		
		
		var geo;
		var geojson;
		var json = new Array();
		var profile;
		$.ajax({
			url : "/party/json/getPartyList",
		    method : "POST",
		    data : JSON.stringify({
		    	'pageSize' : '3'
		    }),
		    dataType : "json",
		    headers : {
     			 "Accept" : "application/json",
                 "Content-Type" : "application/json"
     		},
     		success : function(JSONData, status){
     			$.each(JSONData.list,function(index,item){
     				geo = {type: 'Feature',
				    		geometry: {type: 'Point', coordinates: [item.longitude, item.latitude]},
				    		properties: {
				    			userCode: item.partyWriter.userCode,
				    			writer: item.partyWriter.nickname,
				    			writerGender: item.partyWriter.gender,
				    			writerBirth: item.partyWriter.birth,
				    			writerProfileImg: item.partyWriter.profileImg,
				    			partyCode: item.partyCode,
						    	partyTitle: item.partyTitle,
						    	partyAge: item.age,
						    	partyContent: item.partyContent,
						    	regDate: item.regDate,
						    	partyStart: item.partyStart,
						    	partyEnd: item.partyEnd,
						    	partyRecruitment: item.partyRecruitment,
						    	gender: item.gender,
						    	country: item.city.countryName,
						    	city: item.city.cityName,
						    	flag: item.city.flagImage,
				    		}};
     				json.push(geo);
     				profile = item.partyWriter.profileImg
					console.log(geo);
     				
     			});
     			
     			
				
				
				geojson = {
						  type: 'FeatureCollection',
						  features: json
				};
     			
				//add markers on map
				map.on('load', function(e) {
			  		// map에 데이터 추가
			  		//커스텀 마커
			  		map.addSource('places', {
					  type: 'geojson',
					  data: geojson
					});
			  		//기본마커
			  		/* 
				  	map.addLayer({
						id: 'locations',
					    type: 'symbol',
					    // 장소좌표와 정보가 포함된 GeoJSON 소스추가
					    source: {
					      type: 'geojson',
					      data: geojson
					    },
					    layout: {
					      'icon-image': 'restaurant-15',
					      'icon-allow-overlap': true,
					    }
					  });
			  		*/
					  //목록 초기화
					  buildLocationList(geojson);
				  
				});
				/* 
				geojson.features.forEach(function(marker) {
			  	  	//HTML 만들기
			  		var el = document.createElement('div');
			  	 	el.className = 'marker';

			  	  	// make a marker for each feature and add to the map
			  	  	new mapboxgl.Marker(el)
			  	    	.setLngLat(marker.geometry.coordinates)
			  	    	.addTo(map);
			 		// make a popup
			  	  	new mapboxgl.Marker(el)
						.setLngLat(marker.geometry.coordinates)
						.setPopup(new mapboxgl.Popup({ offset: 25 })
						.setHTML('<h3>' + marker.properties.writer + '</h3>'
								 +'<p>' + marker.properties.writerProfileImg + '</p>'
								 +'<p>' + marker.properties.partyCode + '</p>'
								 +'<p>' + marker.properties.partyTitle + '</p>'
								 +'<p>' + marker.properties.partyContent + '</p>'
								 +'<p>' + marker.properties.regDate + '</p>'
								 +'<p>' + marker.properties.partyStart + '</p>'
								 +'<p>' + marker.properties.partyEnd + '</p>'
								 +'<p>' + marker.properties.partyRecruitment + '</p>'
								 +'<p>' + marker.properties.gender + '</p>'
								 +'<p>' + marker.properties.country + '</p>'
								 +'<p>' + marker.properties.city + '</p>'
								 +'<p>' + marker.properties.flag + '</p>'
								 ))
						.addTo(map);
			 	})
			 	 */
			 	//회원 변경되었을때 프로필사진 변경되는지 체크필요?????????????????
				geojson.features.forEach(function(marker) {
					  // Create a div element for the marker
					  console.log(marker);
					  var el = document.createElement('div');
					  // Add a class called 'marker' to each div
					  el.className = 'marker';
// 					  el.style.cssText = 'background-size: cover;width: 45px;height: 45px;background-image: url("/resources/images/profile/'+profile+'");';
					  
					  var img = el.appendChild(document.createElement('img'));
					  img.className = 'rounded-circle';
					  img.src = '/resources/images/profile/'+marker.properties.writerProfileImg;
					  img.style.cssText = 'width: 45px;height: 45px;  border: 1px solid rgba(0, 0, 0, 0.25);'
					  
					  // By default the image for your custom marker will be anchored
					  // by its center. Adjust the position accordingly
					  // Create the custom markers, set their position, and add to map
					  new mapboxgl.Marker(el, { offset: [0, -23] })
					    .setLngLat(marker.geometry.coordinates)
					    .addTo(map);
					  
					  
					  el.addEventListener('click', function(e) {
						  var activeItem = document.getElementsByClassName('active');
						  // 1. Fly to the point
						  getParty(marker);
						  // 2. Close all other popups and display popup for clicked store
						  createPopUp(marker);
						  // 3. Highlight listing in sidebar (and remove highlight for all other listings)
						  e.stopPropagation();
						  if (activeItem[0]) {
						    activeItem[0].classList.remove('active');
						  }
						  var listing = document.getElementById('listing-' + i);
						  console.log(listing);
						  //listing.classList.add('active');
						});
				});
				
     		},
     		error:function(jqXHR, textStatus, errorThrown){
    			alert(textStatus );
    			alert( errorThrown );
    		}
		});
		
		
		
		
		
		//지도 클릭시 인베트 리스너 추가
		/* map.on('click', function(e) {
		  // 뷰에서 렌더링된 모든 점을 쿼리
		  var features = map.queryRenderedFeatures(e.point, { layers: ['locations'] });
		  if (features.length) {
		    var clickedPoint = features[0];
		    // 1. Fly to the point
		    getParty(clickedPoint);
		    // 2. Close all other popups and display popup for clicked store
		    createPopUp(clickedPoint);
		    // 3. Highlight listing in sidebar (and remove highlight for all other listings)
		    var activeItem = document.getElementsByClassName('active');
		    if (activeItem[0]) {
		      activeItem[0].classList.remove('active');
		    }
		    // Find the index of the store.features that corresponds to the clickedPoint that fired the event listener
		    var selectedFeature = clickedPoint.properties.partyTitle;

		    for (var i = 0; i < geojson.features.length; i++) {
		      if (geojson.features[i].properties.partyTitle === selectedFeature) {
		        selectedFeatureIndex = i;
		      }
		    }
		    // Select the correct list item using the found index and add the active class
		    var listing = document.getElementById('listing-' + selectedFeatureIndex);
		    listing.classList.add('active');
		  }
		}); */
		
		
		//animation of fly
		function getParty(currentFeature) {
			  map.flyTo({
			    center: currentFeature.geometry.coordinates,
			    zoom: 7
			  });
			  
			}
		
		//지도위 팝업
		function createPopUp(currentFeature) {
		  var popUps = document.getElementsByClassName('mapboxgl-popup');
		  // Check if there is already a popup on the map and if so, remove it
		  if (popUps[0]) popUps[0].remove();
		  
		  var gender;
		  if(currentFeature.properties.gender == 1){ gender = '남' }
		  else if(currentFeature.properties.gender == 2){gender = '여'}
		  else{ gender = '상관없음'}
		  
		  var Age;
		  if(currentFeature.properties.partyAge = 0){ Age = '10대' }
		  else if(currentFeature.properties.partyAge = 1){ Age = '20대' }
		  else if(currentFeature.properties.partyAge = 2){ Age = '30대' }
		  else if(currentFeature.properties.partyAge = 3){ Age = '40대' }
		  else{Age = '50대'}
		  
		  var popup = new mapboxgl.Popup({ closeOnClick: false })
		    .setLngLat(currentFeature.geometry.coordinates)
		    .setHTML('<h4>'+ currentFeature.properties.partyCode +' · '+currentFeature.properties.partyTitle+'</h4>'
		    		+'<div class="receiver">작성자 : ' +currentFeature.properties.writer +'</div>'
		    		+'<div style="font-size: small;">작성시간 : '+currentFeature.properties.regDate+'</div>'
				 	+'<div style="font-size: small;">희망성별 : ' 
				 	+ gender
				 	+ '</div>'
				 	+'<div style="font-size: small;">희망나이 : ' + Age + '</div>'
				 	+'<div>'
				 	+'<span style="border: 1px solid rgba(0, 0, 0, 0.25); font-size: small;">'
				 	+ ((currentFeature.properties.partyRecruitment == 1) ? '모집중' : '모집마감')  
				 	+'</span>'
				 	+'<span>'
				 	+'<i onclick="" class="fas fa-paper-plane sendParty" style="padding-left: 140px;cursor: pointer;"></i>'
				 	/* +'<button type="button" class="sendParty" style="background: none; border-radius: 3px;float: right;">신청하기</button>' */
				 	+'</span>'
				 	+'</div>'
				 	+'<input type="hidden" class="userCode" value="'+currentFeature.properties.userCode+'"/>'
		    )
		    .addTo(map);
		}
		
		
		//mapboxgl.setRTLTextPlugin('https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-rtl-text/v0.1.0/mapbox-gl-rtl-text.js');
		//language
		map.addControl(new MapboxLanguage({
		  defaultLanguage: 'ko'
		}));
		//search geoCoder
		map.addControl(new MapboxGeocoder({
			accessToken: mapboxgl.accessToken,
			mapboxgl: mapboxgl,
			marker : {
				color : 'orange'
			}
			}));
		//Fullscreen		
		map.addControl(new mapboxgl.FullscreenControl());
		//나의 위치 검색
		map.addControl(new mapboxgl.GeolocateControl({
			positionOptions: {
				enableHighAccuracy: true
			},
				trackUserLocation: true
			}));	
		//Marker	
		var lng;
		var lat;
	  	var marker = new mapboxgl.Marker()
		map.on('click', function(e) {
			//map click add marker
		  	/* lng = e.lngLat.lng;
		  	lat = e.lngLat.lat;
		  	console.log(lng + ', ' + lat);
			  
		  	marker.setLngLat([lng, lat])
		  	//marker.addTo(map);
			$("#latitude").val(lat);
			$("#longitude").val(lat); */
		});
	  	
	  	function buildLocationList(data) {
			  // 데이터 뽑기
			  for (i = 0; i < data.features.length; i++) {
			    var currentFeature = data.features[i];
			    var prop = currentFeature.properties;
			    
			    
			    // HTML에서 목록 컨테이너를 선택하고 div 추가
			    // 각 동행에 대한 'item'클래스 사용
			    var listings = document.getElementById('listings');
			    var listing = listings.appendChild(document.createElement('div'));
			    listing.className = 'item';
			    listing.id = 'listing-' + i;

			    //각 동행에 대해 'title'클래스로 새 링크 만들기
			    //제목
			    
			    var link = listing.appendChild(document.createElement('a'));
			    link.href = '#a';
			    link.className = 'title';
			    link.style.cssText = 'overflow: hidden; text-overflow: ellipsis;';
			    link.dataPosition = i;
			    link.innerHTML = prop.partyCode + ' · ' + prop.partyTitle;
				
			    
			    
			    var writer = listing.appendChild(document.createElement('div'));
			    writer.innerHTML = '작성자 : '+prop.writer;
			    if (prop.writerGender){
			    	if(prop.writerGender == 'M'){
				    	writer.innerHTML += ' · ' + '남'
			    	}else{
				    	writer.innerHTML += ' · ' + '여'
			    	}
			    }
			    
			    if (prop.writerBirth){
			    	var yy = prop.writerBirth.substring(0,2);
			    	writer.innerHTML += ' · ' + yy + ' 년생'
			    }
			    writer.className = 'writer';
			    writer.style.cssText = 'font-size: small;';
			    //각 동행에 대해 'details'클래스로 새 div 만들기
			    //내용
			    var details = listing.appendChild(document.createElement('div'));
			    details.innerHTML = '내용 : ' + prop.partyContent;
			    details.className = 'content';
			    
			    
// 			    var hashtag = listing.appendChild(document.createElenet('div'));
// 			    hashtag.innerHTML = '#해쉬태그 : '+ prop.hashtag;
// 			    hashtag.className = 'hashtag';
			    
				//date			    
			    var date = listing.appendChild(document.createElement('div'));
			    date.innerHTML = '동행 기간 : ' + '시작 - '+prop.partyStart + ' · ' + '끝 - '+ prop.partyEnd
			    date.style.cssText = 'font-size: small;';
			    
			    	
			    //country
			    var where = listing.appendChild(document.createElement('div'));
			    where.innerHTML = '동행 지역 : '+ prop.country+' · '+prop.city
			    where.style.cssText = 'font-size: small;';
				
			    
				var userCode = ${user.userCode};			    	
			    if(${user != null}){
			    if(userCode == prop.userCode){
			    
			    //update delete
			    var update 
			    update = where.appendChild(document.createElement('i'));
			    update.className = 'fas fa-cog update';
			    //update.style.cssText = 'text-align:right;'
			    
			    //<i class="fas fa-cog"></i>
			    var remove 
			    remove = where.appendChild(document.createElement('i'));
			    remove.className = 'fas fa-trash-alt remove';
			    //remove.style.cssText = 'text-align:right;'
			    //<i class="fas fa-trash-alt"></i>
			    //var partyCode = prop.partyCode;
			    	//updateParty(partyCode);
			    }
			    }	
			    
			    
				// Add an event listener for the links in the sidebar listing
				link.addEventListener('click', function(e) {
				  // click 한 링크와 geojson 을 업데이트
				  var clickedListing = data.features[this.dataPosition];
				  // 1. Fly to the point associated with the clicked link
				  getParty(clickedListing);
				  // 2. Close all other popups and display popup for clicked store
				  createPopUp(clickedListing);
				  // 3. Highlight listing in sidebar (and remove highlight for all other listings)
				  var activeItem = document.getElementsByClassName('active');
				  if (activeItem[0]) {
				    activeItem[0].classList.remove('active');
				  }
				  this.parentNode.classList.add('active');
				  
				  
				});
				
				
			    
			  }//end of for
		}//end of buildLocationList
	 	
		
		
		
	</script>
</body>
</html>