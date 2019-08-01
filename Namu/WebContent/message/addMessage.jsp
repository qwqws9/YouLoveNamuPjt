<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<!-- jQuerty -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<!-- websocket -->
  	<script src="/socket.io/socket.io.js"></script>
  
</head>
<body>
	<div class="container-fluid">
		<form id="messageForm">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<strong>받는 사람</strong>
							<input class="" type="text" name="to">
							<button>주소록</button>
						</div>
					</div>
					
					<hr>
					
					<div class="row">
						<div class="col-md-12 col-lg-12">
								<textarea class="form-control" id="messageContent" name="messageContent" ></textarea>
						</div>
					</div>
					
					<hr>
					
					<div class="row">
						<div class="col-md-9 col-lg-9">
							<span>
								<input type="checkbox" name="sendBox">
								<strong>보낸쪽지함에 저장</strong>
							</span>
						</div>
						<div class="col-md-3 col-lg-3 text-right">
								<span></span>
								<span>/1000</span> 자
						</div>
					</div>
					
					<hr>
					
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<div class="row">
								<input type="submit" class="btn btn-primary" value="Send Message"/>
								<button>취소</button>
							</div>
						</div>
					</div>
					
					<div id="chat">
					
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		$(function(){
			var socket = io.connect();
			var messageForm = $('#messageForm');
			var messageContent = $('#messageContent');
			var chat = $('#chat');
			
			
			messageForm.submit(function(e){
				e.preventDefault();
				socket.emit('send message', messageContent.val());
				messageContent.val('');
			});
			
			socket.on('newMesssage',function(data){
				//console.log(data.msg);
				chat.append('<div class="well">'+data.msg+'</div>');
			});
			
		});
	</script>
</body>
</html>