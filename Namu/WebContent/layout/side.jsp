<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>YouLovePlan</title>
	
	
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
	//var url = "http://192.168.0.13:8005?nickname=${user.nickname}";
	var url = "http://192.168.0.13:8005?nickname=${user.nickname}&profile=${user.profileImg}";
	
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