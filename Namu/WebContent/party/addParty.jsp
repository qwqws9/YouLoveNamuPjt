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
	<!-- leaglet -->
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" />
   	<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js" ></script>
	<style>
		#map {
			height: 500px;
        	width: 1000px;
		}
	</style>
</head>

<body>
	<header><jsp:include page="/layout/header.jsp" /></header>

	<div class="container-fluid col-10">
		<div class="row justify-content-center">
			<div class="col-1"></div><!-- 사이드바 -->
			
			<div class="col-10"><!-- 메인바 -->
			<form>
				<br>
				<div class="row">
					<div class="col offset-1">
						<h4><strong>게시물 등록</strong></h4>
					</div>
				</div>
				<br><br><br>
				<div class="row">
					<div class="col-12">
						<div class="row">
							<div class="col-1">
								나의 위치는?
							</div>
							<div class="col-1">
								<span id="whereAmI" style="cursor: pointer;" data-toggle="modal" data-target="#exampleModalCenter">
									<i class="fas fa-map-marker-alt fa-lg" style="padding-top: 10px;"></i>
								</span>
							</div>
							<div class="col-9 form-group">
						    	<input type="text" class="form-control" placeholder="제목">
							</div>
						</div>
					
						<div class="row">
							<div class="col-1 text-right">
								Title
							</div>
							<div class="col-10 form-group">
								<input type="text" id="partyTitle" name="partyTitle" class="form-control" placeholder="제목">
							</div>
							<div class="col-1"></div>
						</div>	
						
							
						<div class="row">	
							<div class="col-1 text-right">
								내용
							</div>
							<div class="col-10 form-group">
						    	<textarea class="form-control" id="partyContent" name="partyContent" rows="3"></textarea>
							</div>
							<div class="col-1"></div>
						</div>	
						
						
						<div class="row">
							<div class="col-1 text-right">
								#해시태그
							</div>
							<div class="col-10 form-group">
						    	<input type="text" class="form-control" placeholder="제목">
							</div>
							<div class="col-1"></div>
						</div>
						
						
						<div class="row">
							<div class="col-1 text-right">
								동행지역
							</div>
							<div class="col-11 appendWhere">
								<div class="row">
									<div class="col-2 form-group">
										<select class="form-control">
										  	<option>Default select</option>
										</select>
									</div>
									<div class="col-2 form-group">
										<select class="form-control">
										  	<option>City</option>
										</select>
									</div>
									<div class="col-7 form-group">
										<select class="form-control">
										  	<option>관광명소</option>
										</select>
									</div>
									<div class="col-1">
										<span id="partyWhere" style="cursor: pointer;">
											<i class="fas fa-plus-square fa-lg" style="padding-top: 10px;"></i>
										</span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-1"></div>
							<div class="col-10">
								<!-- 해시태그 들어갈곳 -->
							</div>
							<div class="col-1"></div>
						</div>
						
						<div class="row">
							<div class="col-1 text-right">
								동행기간
							</div>
							<div class="col-10 form-group">
						    	<input type="text" class="form-control" placeholder="제목">
							</div>
							<div class="col-1"></div>
						</div>
						
						
						<div class="row">
							<div class="col-1 text-right">
								희망성별
							</div>
							<div class="col-3 form-group">
						    	<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="gender1" name="gender" class="custom-control-input gender">
								  	<label class="custom-control-label" for="gender1">남자</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
								  	<input type="radio" id="gender2" name="gender" class="custom-control-input gender">
								  	<label class="custom-control-label" for="gender2">여자</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
								  	<input type="radio" id="gender3" name="gender" class="custom-control-input gender">
								  	<label class="custom-control-label" for="gender3">상관없음</label>
								</div>
							</div>
							<div class="col-1"></div>
						</div>
						
						
						<div class="row">
							<div class="col-1 text-right">
								희망나이
							</div>
							<div class="col-10 form-group">
								<div class="row">
									<div class="col-2">
										<select class="form-control">
										  	<option>1980</option>
										</select>
									</div>
							    	<div class="col-1 text-center">
							    		<span style="font-size: 20px;">~</span>
							    	</div>
							    	<div class="col-2">
							    		<select class="form-control">
										  	<option>2000</option>
										</select>
							    	</div>
								</div>
							</div>
							<div class="col-1"></div>
						</div>
						
						
						<div class="row">
							<div class="col-1 text-right">
								모집유무
							</div>
							<div class="col-10 form-group">
								<select class="form-control">
								  	<option>모집중</option>
								  	<option>모집마감</option>
								</select>
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-1"></div>
							<div class="col-10 form-group text-right">
								<button type="button" id="add">등록</button>
								<button type="button" id="cencle">취소</button>
							</div>
							<div class="col-1"></div>
						</div>
						
						
						<br><br><br>
					</div>
				</div>
			</form>
			</div>
			<div class="col-1"></div><!-- 사이드바 -->
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog-lg modal-dialog-centered" role="document">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="exampleModalLongTitle">나의 위치 등록하기</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
	      			<div id="map"></div>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary">확인</button>
	        		<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	<script>
		function mapPopup(){
			
		}
		$(function(){
			var map = L.map('map').setView([51.505, -0.09], 13);

			L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
			    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
			}).addTo(map)
			
		});	
		
		
	
		$(function(){
			//append 동행 지역
			$("#partyWhere").on("click",function(){
				$(".appendWhere").append(
					'<div class="row">'
						+'<div class="col-2 form-group">'
							+'<select class="form-control">'
							  	+'<option>Default select</option>'
							+'</select>'
						+'</div>'
						+'<div class="col-2 form-group">'
							+'<select class="form-control">'
							  	+'<option>City</option>'
							+'</select>'
						+'</div>'
						+'<div class="col-6 form-group">'
							+'<select class="form-control">'
							  	+'<option>관광명소</option>'
							+'</select>'
						+'</div>'
						+'<div class="col-1">'
							+'<span id="partyWhere" style="cursor: pointer;">'
								+'<i class="fas fa-minus-square fa-lg" style="padding-top: 10px;"></i>'
							+'</span>'
						+'</div>'
					+'</div>'
				);
			});
			
			$("#whereAmI").on("click", function(){
				//alert("ddd");
			});
			
			
		});/* end of ready function */
	</script>
</body>
</html>