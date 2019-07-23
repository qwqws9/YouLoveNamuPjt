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
	
	
	<style>
		#map {
			height: 500px;
        	width: 1000px;
		}
	</style>
</head>

<body>
	<header><jsp:include page="/layout/header.jsp" /></header>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-1"></div><!-- 사이드바 -->
			<div class="col-10"><!-- 메인바 -->
				<div class="row">
					<div class="col-12">
						<div class="row">
				
							<div class="col-1">
								Title
							</div>
							<div class="col-11">
							</div>
					
				
						</div>
					</div>
				</div>
			</div>
			<div class="col-1"></div><!-- 사이드바 -->
		</div>
	</div>
	<script>
	
		var map = L.map('map').setView([48.0978755, 4.1416308], 4);
		
		L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
		        attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
		}).addTo(map);
	
		var marker = L.marker([51.5, -0.09]).addTo(map);
	</script>
</body>
</html>