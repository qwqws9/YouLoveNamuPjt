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
	
	<!-- Our Own Resources -->
	<script src="../resources/javascript/jquery.oLoader.min.js"></script>
	<!-- 날씨, 환율 정보를 위한 국가 도시 리스트 출력 -->
	<script src="/resources/javascript/getProfile.js"></script>
	<script src="/resources/javascript/index.js"></script>
	
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
		
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	
	<style type="text/css">
	body {
	  font-family: "Lato", sans-serif;
	}
	.sidenav {
	  height: 100%;
	  width: 160px;
	  position: fixed;
	  z-index: 1;
	  top: 85%;
	  left: 30px;
	  background-color: #FFFFFF;
	  overflow-x: hidden;
	  padding-top: 20px;
	}
	/* .sidenav a {
	  padding: 6px 8px 6px 16px;
	  text-decoration: none;
	  font-size: 25px;
	  color: #818181;
	  display: block;
	}
	.sidenav a:hover {
	  color: #f1f1f1;
	} */
	.main {
	  margin-left: 160px;
	  font-size: 28px;
	  padding: 0px 10px;
	}
	@media screen and (max-height: 450px) {
	  .sidenav {padding-top: 15px;}
	  .sidenav a {font-size: 18px;}
	}
	</style>
</head>
<body>
	<!-- 채팅 아이콘 -->
	<div class="sidenav">
		<i class="far fa-comment" id="getChat" style="font-size:50px;" onClick=onChat()></i>
	</div>
	
	<script type="text/javascript">
	var url = "http://192.168.0.13:8005?nickname=${user.nickname}";
	//var url = "http://192.168.0.13:8005?nickname=${user.nickname}&profile=${user.profileImg}";
	
	function onChat(){
		$(document).ready(function(){
			$("#getChat").on("click", function(){
				window.open(url, "popup_chat", "width=450, height=700, location=no, resizable=no, left=1000, top=70")
			});
		});
	};
	</script>

</body>
</html>