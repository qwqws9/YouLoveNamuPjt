<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>YouLovePlan</title>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	<!-- Font Awesome SVG with JavaScript -->
	<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="../resources/javascript/jquery.oLoader.min.js"></script>
	<link rel="stylesheet" href="/resources/css/common.css" >
	<!-- 날씨,시차,환율 정보를 위한 국가 도시 리스트 출력 -->
	<script src="/resources/javascript/getProfile.js"></script>
	
	<script src="/resources/javascript/index.js"></script>
		
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

    <!-- Our Own Resources -->
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">

</head>
<body>
	<header><jsp:include page="/layout/header.jsp" /></header>

	<div class="container">
		<br><br>
		<!-- <button type="button" id="ooo">로그인</button> -->
		<br><br>
		
		<h4 style="margin: auto;">
			<a href="/wallet/getWalletListView">규리 가계부</a><br>
			<a href="/wallet/getWalletList?walletCode=1"> /</a><br>
			
			<!-- <a href="http://192.168.0.13:8005/">상욱 채팅</a><br> -->
			<i id="getChat">상욱 채팅</i><br>

			<a href="/user/loginView.jsp/">성용 회원가입</a><br>
			
			<a href="/planner/addRoute.jsp">민희 구글맵</a><br>
			<a href="/planner/getScheduleList.jsp"> /</a><br>
			
			<a href="/community/getCommunityList">중현 커뮤니티 등록</a>
			<a href="/party/getPartyList">중현 동행 리스트</a><br><br>
		</h4>
		
		<div class="row">
			<!-- 날씨 -->
			<div class="col-sm-4">
			<div class="card">
			  <div class="card-body">
			    <h5 class="weatherCity card-title">날씨</h5>
			    <img class="weatherImg" src="http://openweathermap.org/img/wn/10d@2x.png">
			    <h3 class="mainTemp">27도</h3>
			    <p class="mainMinMaxTemp card-text"><span style="color:blue">27도</span>/<span style="color:red">32도</span></p>
			      <p class="humidity card-text">80%</p>
			      <button  class="btn btn-outline-primary" id="callCountry">도시 선택</button>
			    </div>
			  </div>
			</div>
			<!-- 환율 -->
			<div class="col-sm-8">
				<div class="card">
					<div class="card-body" id="exchange_container"></div>
				</div>
			</div>
		</div>
			<br><br>
			<!-- <button id="callCountry">국가 정보 호출</button> -->
		<input type="hidden" id="weatherCountry" value="프랑스">
		<input type="hidden" id="weatherCity" value="파리">
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
		  $("#getChat").on("click", function(){
			window.open("http://192.168.0.13:8005/", "popup_chat", "width=450, height=800, location=no, resizable=no")
		  });
		});
	</script>

	<jsp:include page="/guide/countryCity.jsp"></jsp:include>

</body>
</html>