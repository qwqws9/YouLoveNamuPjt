<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/layout/head.jsp" />
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	<!-- Font Awesome SVG with JavaScript -->
	<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="/resources/javascript/jquery-ui.min.js"></script>
	<!-- Our Own Resources -->
	<script src="../resources/javascript/jquery.oLoader.min.js"></script>
	<!-- 날씨, 환율 정보를 위한 국가 도시 리스트 출력 -->
	<script src="/resources/javascript/getProfile.js"></script>
	<script src="/resources/javascript/index.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/wallet.css">
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	
	<style type="text/css">
		#callCountry {width: 100%; margin-top: 15px; color: #f2c029; border: 1px solid #f2c029;}
		#callCountry:hover {color: #fff; background-color: #f2c029;}
		#callCountry:focus {box-shadow: none; border-color: #f2c029; outline: 0;}
	</style>
</head>
<body>
	<header><jsp:include page="/layout/header.jsp" /></header>
	<!-- 사이드바 추가(채팅, 관리자채팅) -->
	<div class="container">
		<br><br>
		<!-- <button type="button" id="ooo">로그인</button> -->
		<br><br>
		
		<div class="row">
			<!-- 날씨 -->
			<div class="col-sm-4">
				<div class="card" style="height: 335px;">
					<div class="card-body">
						<h5 class="weatherCity card-title" style="margin-bottom: 25px; font-weight: 700; line-height: 30px;">날씨</h5>
						<div style="text-align: center;">
							<img class="weatherImg" src="/resources/images/weather/01d.png" height="50px">
							<h3 class="mainTemp" style="margin-top: 15px;">27도</h3>
							<p class="mainMinMaxTemp card-text" style="margin-top: 15px; font-size: 18px;">
								<span style="color: #30a9de;">27도</span> / <span style="color: #f2c029;">32도</span>
							</p>
							<p><span style="color: #30a9de;"><i class="fas fa-tint"></i></span>&nbsp;&nbsp;<span class="humidity card-text">80%</span></p>
						</div>
						<button class="btn btn-outline-primary" id="callCountry" style="margin-top: 5px;">도시 선택</button>
					</div>
				</div>
			</div>
			<!-- 환율 -->
			<div class="col-sm-8">
				<div class="card" style="height: 335px;">
					<div class="card-body" id="exchange_container"></div>
				</div>
			</div>
		</div>
		
			<br><br>
			<!-- <button id="callCountry">국가 정보 호출</button> -->
		<input type="hidden" id="weatherCountry" value="대한민국">
		<input type="hidden" id="weatherCity" value="서울">
	</div>
	
	<!-- <script type="text/javascript">
	//var url = "http://192.168.0.13:8005?nickname=123&profile=123";
	//var url = "http://192.168.0.13:8005?nickname=${user.nickname}";
	//var url = "http://192.168.0.13:8005?nickname=${user.nickname}&profile=${user.profileImg}";
	//var url = "http://192.168.0.13:8005"
	
	/* $(document).ready(function(){
		$("#getChat").on("click", function(){
			window.open(url, "popup_chat", "width=450, height=800, location=no, resizable=no")
		});
	}); */
	
	/* $("#getChat").on("click", function(){
		$.post("http://192.168.0.13:8005/", {
			data= ${user.nickname},
		}),
		function(data, status){
			alert(data);
		}
	}) */

	
	</script> -->
	
	<script type="text/javascript">
	$(function() {
		$(document).on('click','.wallet_box .square',function(){
			var plannerCode = $(this).children(':eq(0)').val();
			self.location = '/planner/getPlanner?plannerCode=' + plannerCode;
	 	});
	});
	
	</script>
	
	<div class="wrap">
	<h2 class="wallet_title"><span> 여행 플래너 공유 </span></h2>
	<section class="wallet_box">
	<div class="square_wrap clear" id="bestPlanner">
	</div>
	 
	<br><br>
	<h2 class="wallet_title"><span> 커뮤니티 게시판 </span></h2>
		<div class="" id="bestCommunity" >
		</div>
	</section>
	</div>
		
	<div>
	
	</div>	
	
	
	
<jsp:include page="/guide/countryCity.jsp"></jsp:include>
</body>
</html>