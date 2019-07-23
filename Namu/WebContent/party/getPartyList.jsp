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
		#map {
			height: 600px;
        	width: 100%;
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
			
			
				<div class="row"><!-- City -->
					<div class="col-md-12 col-lg-12">
						<div class="row justify-content-end">
							<div class="col-2 form-group">
								<select class="form-control" id="country" title="Country">
								</select>
							</div>
							<div class="col-2 form-group">
								<select class="form-control" id="city" name="cityName" title="City">
								</select>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="row justify-content-center"><!-- map -->
					<div class="col-md-12 col-lg-12">
						<div id='map'></div>
					</div>
				</div>
				
				<br>	
					
				<div class="row justify-content-center"><!-- Search -->
					<div class="col-md-10 col-lg-10">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-md-2 col-lg-2 text-center">
										제목
									</div>
									<div class="col-md-8 col-lg-8">
										<div class="row">
											<input type="text" id="partyTitle" name="partyTitle" value="">
										</div>
									</div>
								</div>
								
								
								<div class="row">
									<div class="col-md-2 col-lg-2 text-center">
										내용
									</div>
									<div class="col-md-8 col-lg-8">
										<div class="row">
											<input type="text" id="partyContent" name="partyContent" value="">
										</div>
									</div>
								</div>
								
								
								<div class="row">
									<div class="col-md-2 col-lg-2 text-center">
										동행 기간
									</div>
									<div class="col-md-8 col-lg-8">
										<div class="row">
											<div class="col-5">
												<input type="text" id="partyStart" name="partyStart" value="">
											</div>
											<div class="col-5">
												<input type="text" id="partyEnd" name="partyEnd" value="">
											</div>
										</div>
									</div>
								</div>
								
								
								<div class="row">
									<div class="col-md-2 col-lg-2 text-center">
										희망 성별
									</div>
									<div class="col-md-8 col-lg-8">
										<div class="row">
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="gender1" name="gender" class="custom-control-input gender" value="1">
											  	<label class="custom-control-label" for="gender1">남자</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
											  	<input type="radio" id="gender2" name="gender" class="custom-control-input gender" value="2">
											  	<label class="custom-control-label" for="gender2">여자</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
											  	<input type="radio" id="gender3" name="gender" class="custom-control-input gender" value="3">
											  	<label class="custom-control-label" for="gender3">상관없음</label>
											</div>
										</div>
									</div>
								</div>
								
									
								<div class="row">
									<div class="col-md-2 col-lg-2 text-center">
										나이
									</div>
									<div class="col-md-8 col-lg-8">
										<div class="row">
											<div class="col-6">
												<select class="form-control" name="age">
											  		<option value="0">10대</option>
											  		<option value="1">20대</option>
											  		<option value="2">30대</option>
											  		<option value="3">40대</option>
											  		<option value="4">50대</option>
												</select>
											</div>
										</div>
									</div>
								</div>					  	
						  	</div>
						</div><!-- end of card -->
					</div>
				</div><!-- end of Search -->
				
				
				<div class="row justify-content-center"><!-- 게시글 -->
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
										<div class="getParty content" style="overflow: hidden; text-overflow: ellipsis; height: 50px; cursor: pointer;">
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
				
				
			</div><!-- end of main -->
			
			
			<div class="col-lg-1"></div><!-- 사이드바 -->
			
			
		</div><!-- end row of container -->
	</div><!-- end of container -->
	<script>
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
		
		mapboxgl.accessToken = 'pk.eyJ1Ijoia29zNTY2NyIsImEiOiJjank4cG8yM2cwY3VrM2ZwOTRmaXdweXRwIn0.pmirns4XMt_92FQMsndgyg';
		var geojson = [
  			{
  			    type: 'Feature',
  			    geometry: {
  			      type: 'Point',
  			      coordinates: [-77.031952, 38.913184]
  			    },
  			    properties: {
  			      'marker-color': '#3bb2d0',
  			      'marker-size': 'large',
  			      'marker-symbol': 'rocket'
  			    }
  			  },
  			  {
  			    type: 'Feature',
  			    geometry: {
  			      type: 'Point',
  			      coordinates: [-122.413682, 37.775408]
  			    },
  			    properties: {
  			      'marker-color': '#3bb2d0',
  			      'marker-size': 'large',
  			      'marker-symbol': 'rocket'
  			    }
  			  }
  			];
		var map = new mapboxgl.Map({
		container: 'map',
		style: 'mapbox://styles/mapbox/streets-v10',
		center: [4.17 , 48.13],
		zoom: 4,
		});
		
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
	  	lng = e.lngLat.lng;
	  	lat = e.lngLat.lat;
	  	console.log(lng + ', ' + lat);
		  
	  	marker.setLngLat([lng, lat])
	  	//marker.addTo(map);
		$("#latitude").val(lat);
		$("#longitude").val(lat);
	  	
			});
	  	

	 	// add markers to map
	  	geojson.features.forEach(function(marker) {
	  	  	// create a HTML element for each feature
	  		var el = document.createElement('div');
	  	 	el.className = 'marker';

	  	  	// make a marker for each feature and add to the map
	  	  	new mapboxgl.Marker(el)
	  	    	.setLngLat(marker.geometry.coordinates)
	  	    	.addTo(map);
	  	});
	 	
	</script>
</body>
</html>