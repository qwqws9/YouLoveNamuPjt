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
	
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
</head>
<body>
	<header><jsp:include page="/layout/header.jsp" /></header>

	<br><br>
	<!-- <button type="button" id="ooo">로그인</button> -->
	<br><br>
	
	<div style="width: 100%;">
		<h4 style="margin: auto;">
			<a href="/wallet/getWalletList?walletCode=1">규리 가계부 목록</a><br>
			<a href="http://192.168.0.13:8005/">상욱 채팅</a><br>
			<a href="/user/loginView.jsp/">성용 회원가입</a><br>
			<a href="/planner/addRoute.jsp"> 민희 구글맵 루트</a> <br>
			 <a href="/planner/getScheduleList.jsp"> /</a> <br>
			<a href="/community/getCommunityList">중현 커뮤니티 등록</a>
			<a href="/party/getPartyList">중현 동행 리스트</a>
		</h4>
	</div>
</body>
</html>