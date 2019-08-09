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
	<!-- party -->
	<script src="/resources/javascript/party.js"></script>
		
	
	<style>
		.btn.btn-outline-dark:not(:first-child){
	  			margin-left:5px;
	  	}
		#map {
			height: 500px;
        	width: 100%;
		}
	</style>
</head>

<body>
	<header><jsp:include page="/layout/header.jsp" /></header>
	<input type="hidden" id="update" value="update">
	<div class="container-fluid col-10">
		<div class="row justify-content-center">
			<div class="col-1"></div><!-- 사이드바 -->
			
			<div class="col-md-10 col-lg-10"><!-- 메인바 -->
			<form>
				<input type="hidden" name="partyCode" value="${party.partyCode }">
				<br>
				<div class="row">
					<div class="col">
						<h4><strong>게시물 수정</strong></h4>
					</div>
				</div>
				
				<br><br>
				
				<div class="row"><!-- map -->
					<div id='map'></div>
				</div>
				
				
				<br>
				
				
				<div class="row">
					<div class="col-md-12 col-lg-12">
<!-- 						<div class="row"> -->
<!-- 							<div class="col-md-2 col-lg-2"> -->
<!-- 								나의 위치는? -->
<!-- 							</div> -->
<!-- 							<div class="col-md-10  col-lg-10 form-group"> -->
<!-- 								<div class="row"> -->
<!-- 									<div class="col-md-6 col-lg-6"> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-3"> -->
<!-- 												위도 -->
<!-- 											</div> -->
<!-- 											<div class="col-8"> -->
									   			<input type="hidden" id="latitude" name="latitude" class="form-control" placeholder=""
									   				value="${party.latitude }" readonly="readonly" style="border: none; background: none;">
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="col-md-6 col-lg-6"> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-3"> -->
<!-- 												경도 -->
<!-- 											</div> -->
<!-- 											<div class="col-8"> -->
									   			<input type="hidden" id="longitude" name="longitude" class="form-control" placeholder=""
									   				value="${party.longitude }" readonly="readonly" style="border: none; background: none;">
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					
						<div class="row">
							<div class="col-md-2 col-lg-2 text-center">
								제목
							</div>
							<div class="col-md-10 col-lg-10 form-group">
								<input value="${party.partyTitle }" type="text" id="partyTitle" name="partyTitle" class="form-control" placeholder="제목">
							</div>
						</div>	
						
							
						<div class="row">	
							<div class="col-md-2 col-lg-2 text-center">
								내용
							</div>
							<div class="col-md-10 col-lg-10 form-group">
						    	<textarea class="form-control" id="partyContent" name="partyContent" rows="3">
						    	${party.partyContent}
						    	</textarea>
							</div>
						</div>	
						
						
						<div class="row">
							<div class="col-md-2 col-lg-2 text-center">
								#해시태그
							</div>
							<div class="col-md-10 col-lg-10 form-group">
						    	<input type="text" class="form-control" id="hashtag" name="hashtag" placeholder="#태그를 입력하세요. ex) #파리#에펠탑#abc"
						    			onkeypress="javascript:if(event.keyCode==13){addHashtag();}">
							</div>
						</div>
						<div class="row">
							<div class="col-md-2 col-lg-2 text-center">
							</div>
							<div class="col-md-10 col-lg-10 form-group" id="hashtagContent">
								<c:forEach var="hashtag" items="${hashtag}">
				  					<button onclick="remove()" type="button" class="btn btn-outline-dark" style="height: 25px; border-radius: 10px; padding: 0px; padding-left: 1%; padding-right: 1%;">
								    	<span style="font-size: 14px;">${hashtag}</span>
								    </button>
			  					</c:forEach>
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-md-2 col-lg-2 text-center">
								동행지역
							</div>
							<div class="col-md-10 col-lg-10 appendWhere">
								<span>나의 이전 위치는? : ${party.city.countryName}   ${party.city.cityName}</span>
								<div class="row">
									<div class="col-3 form-group">
										<select class="form-control" id="country" title="Country">
											<option>Country</option>
										</select>
									</div>
									<div class="col-3 form-group">
										<select class="form-control" id="city" name="cityName" title="City">
											<option>City</option>
										</select>
									</div>
									<div class="col-6 form-group">
										<select class="form-control">
										  	<option>관광명소</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-md-2 col-lg-2 text-center">
								동행기간
							</div>
							<div class="col-md-10 col-lg-10 form-group">
								<div class="row">
									<div class="col-md-12 col-md-12">
										<div class="row">
											<div class="col-2 text-center">
												<a href="#" data-toggle="modal" data-target="#Schedule"><i class="far fa-calendar fa-lg"></i></a>
											</div>
											<div class="col-5">
										    	<input value="${party.partyStart }" type="text" id="partyStart" name="partyStart" class="form-control" readonly="readonly" placeholder="Start Date">
											</div>
											<div class="col-5">
										    	<input value="${party.partyEnd }" type="text" id="partyEnd" name="partyEnd" class="form-control" readonly="readonly" placeholder="End Date">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-md-2 col-lg-2 text-center">
								희망성별
							</div>
							<div class="col-md-6 col-lg-6 form-group">
								<c:if test="${party.gender eq '1' }">
							    	<div class="custom-control custom-radio custom-control-inline">
										<input checked="checked" type="radio" id="gender1" name="gender" class="custom-control-input gender" value="1" >
									  	<label class="custom-control-label" for="gender1" >남자</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
									  	<input type="radio" id="gender2" name="gender" class="custom-control-input gender" value="2">
									  	<label class="custom-control-label" for="gender2">여자</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
									  	<input type="radio" id="gender3" name="gender" class="custom-control-input gender" value="3">
									  	<label class="custom-control-label" for="gender3">상관없음</label>
									</div>
								</c:if>
								<c:if test="${party.gender eq '2' }">
							    	<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="gender1" name="gender" class="custom-control-input gender" value="1" >
									  	<label class="custom-control-label" for="gender1" >남자</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
									  	<input checked="checked" type="radio" id="gender2" name="gender" class="custom-control-input gender" value="2">
									  	<label class="custom-control-label" for="gender2">여자</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
									  	<input type="radio" id="gender3" name="gender" class="custom-control-input gender" value="3">
									  	<label class="custom-control-label" for="gender3">상관없음</label>
									</div>
								</c:if>
								<c:if test="${party.gender eq '3' }">
							    	<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="gender1" name="gender" class="custom-control-input gender" value="1" >
									  	<label class="custom-control-label" for="gender1" >남자</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
									  	<input type="radio" id="gender2" name="gender" class="custom-control-input gender" value="2">
									  	<label class="custom-control-label" for="gender2">여자</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
									  	<input checked="checked" type="radio" id="gender3" name="gender" class="custom-control-input gender" value="3">
									  	<label class="custom-control-label" for="gender3">상관없음</label>
									</div>
								</c:if>
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-md-2 col-lg-2 text-center">
								희망나이
							</div>
							<div class="col-md-10 col-lg-10 form-group">
								<div class="row">
									<div class="col-2">
										<select class="form-control" name="age">
										<c:if test="${party.age eq '0'}">
									  		<option value="0" selected="selected">10대</option>
									  		<option value="1">20대</option>
									  		<option value="2">30대</option>
									  		<option value="3">40대</option>
									  		<option value="4">50대</option>
										</c:if>
										<c:if test="${party.age eq '1'}">
									  		<option value="0">10대</option>
									  		<option value="1" selected="selected">20대</option>
									  		<option value="2">30대</option>
									  		<option value="3">40대</option>
									  		<option value="4">50대</option>
										</c:if>
										<c:if test="${party.age eq '2'}">
									  		<option value="0">10대</option>
									  		<option value="1">20대</option>
									  		<option value="2" selected="selected">30대</option>
									  		<option value="3">40대</option>
									  		<option value="4">50대</option>
										</c:if>
										<c:if test="${party.age eq '3'}">
									  		<option value="0">10대</option>
									  		<option value="1">20대</option>
									  		<option value="2">30대</option>
									  		<option value="3" selected="selected">40대</option>
									  		<option value="4">50대</option>
										</c:if>
										<c:if test="${party.age eq '4'}">
									  		<option value="0">10대</option>
									  		<option value="1">20대</option>
									  		<option value="2">30대</option>
									  		<option value="3">40대</option>
									  		<option value="4" selected="selected">50대</option>
										</c:if>
										</select>
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-md-2 col-lg-2 text-center">
								모집유무
							</div>
							<div class="col-md-10 col-lg-10 form-group">
								<select class="form-control" name="partyRecruitment">
								<c:if test="${party.partyRecruitment eq '1' }">
								  	<option value="1" selected="selected">모집중</option>
								  	<option value="2">모집마감</option>
								</c:if>
								<c:if test="${party.partyRecruitment eq '2' }">
								  	<option value="1">모집중</option>
								  	<option value="2" selected="selected">모집마감</option>
								</c:if>
								</select>
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-2"></div>
							<div class="col-10 form-group text-right">
								<button type="button" id="add">등록</button>
								<button type="button" id="cencle">취소</button>
							</div>
						</div>
						
						
						<br><br><br>
					</div>
				</div>
			</form>
			</div>
			<div class="col-1">
			</div><!-- 사이드바 -->
		</div>
	</div>
	
	<!-- getScheduleModal -->
	<div class="modal" id="my">
		
	</div>
	
	<div class="modal fade" id="Schedule" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
	  	<div class="modal-dialog modal-dialog-centered" role="document">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="exampleModalCenterTitle">My Scedule</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
		      	<div class="modal-body" id="calendar">
		      	</div>
		      	<div class="modal-footer">
		      		<div>S</div>
		      		<input type="text" id="partyStartModal" name="partyStart" class="form-control" readonly="readonly" placeholder="Start Date">
		      		<div>E</div>
		      		<input type="text" id="partyEndModal" name="partyEnd" class="form-control" readonly="readonly" placeholder="End Date">
		      	</div>
	    	</div>
	  	</div>
	</div>
	
	<script>
	
		
	
		function getSchedule (){
			$.ajax({
				url : "/planner/getScheduleList",
				method : "POST",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "appliction/json"
				},
				success : function(JSONData, status){
						console.log("시작");
					$.each(JSONData,function(index,item){
						console.log(item);
					});
						console.log("끝");
				},
				error:function(jqXHR, textStatus, errorThrown){
					alert(error);	
				}
			});
		}
		/* function renderCalcEvent(data) {
			  for (var i = 0; i < data.length; i++) {
			    var locIdx = data[i].locationIdx;
			    var eventIdx = data[i].eventIdx;
			    var sdate = new Date(data[i].regDt).toString();
			    var edate = new Date(data[i].regDt).toString();
			    var col = "blue";
			    var date = data[i].regDt;
			 
			    var event = {
			      id: data[i].eventIdx,
			      title: data[i].locationName,
			      url: '/',
			      start: moment(data[i].regDt),
			      allDay: false,
			      color: col
			    };
			 
			    $('#calendar').fullCalendar('renderEvent', event);
			  }
			} */
		
		var startDate;
		var endDate;
		function addDate(startDate,endDate){
			startDate = startDate;
			endDate = endDate;
			    console.log(startDate +" , "+endDate);
			    $("#partyStart").val(startDate);
				$("#partyEnd").val(endDate);
				$("#partyStartModal").val(startDate);
				$("#partyEndModal").val(endDate);
			}
		$(function(){
			//현재시간
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();
			if(dd<10) {
			    dd='0'+dd
			} 
			if(mm<10) {
			    mm='0'+mm
			} 
			today = yyyy+'-'+mm+'-'+dd;
			console.log(today);
			//스케줄
			$("#calendar").fullCalendar({
				selectable : true,
				dafaultDate : today,
				//수정가능
				editable : true,
				eventLimit : true,
				//날짜선택
				dayClick: function(date, jsEvent, view) {
				    console.log('Clicked on: ' + date.format());
				    startDate = date.format();
				    endDate = date.format();
				    //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
				    //alert('Current view: ' + view.name);
				    //$(this).css('background-color', 'red');
				},
				//드래그
				select : function(start, end){
					console.log("select : "+start.format() + 'to' + end.format());
					startDate = start.format();
					endDate = end.format();
					addDate(startDate,endDate);
					
				},
				//Schedule
			  	events: [
					    {
					        title  : 'event1',
					        start  : '2019-07-05'
				    	},
				    	{
					        title  : 'event2',
					        start  : '2019-07-05',
					        end    : '2019-07-07'
				    	},
				    	{
					        title  : 'event3',
					        start  : '2019-07-09T12:30:00',
					        allDay : false // will make the time show
				    	}
				]
		
			    
			    
			   
				//선택취소
				
				//DB data
				
			});/* end of calender */
			
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
			
			
			$("#add").on("click",function(){
				addParty();
			});
			
			
		});/* end of ready function */
		mapboxgl.accessToken = 'pk.eyJ1Ijoia29zNTY2NyIsImEiOiJjank4cG8yM2cwY3VrM2ZwOTRmaXdweXRwIn0.pmirns4XMt_92FQMsndgyg';
		var map = new mapboxgl.Map({
		container: 'map',
		style: 'mapbox://styles/mapbox/streets-v10',
		center: [4.17 , 48.13],
		zoom: 3,
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
	  	marker.setLngLat([${party.latitude },${party.longitude }]).addTo(map)
		map.on('click', function(e) {
		  // When the map is clicked, set the lng and lat variables equal to the lng and lat properties in the returned lngLat object
	  	lng = e.lngLat.lng;
	  	lat = e.lngLat.lat;
	  	console.log(lng + ', ' + lat);
		  
	  	marker.setLngLat([lng, lat])
	  	marker.addTo(map);
		$("#latitude").val(lat);
		$("#longitude").val(lat);
	  	
			});
	</script>
</body>
</html>