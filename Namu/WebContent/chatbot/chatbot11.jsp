<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Chatbot</title>
	
	<script  src="https://code.jquery.com/jquery-3.4.1.slim.js"  integrity="sha256-BTlTdQO9/fascB1drekrDVkaKd9PkwBymMlHOiG+qLI="  crossorigin="anonymous"></script>
	<style type="text/css">
	.dd{
		width: 100%;
/* 		background: rgba(242, 192, 41, 0.2); */
		background: none;
		outline: none;
		border: 2px solid rgba(163, 218, 255, 0.5);
		border-radius: 4px;
		height: 30px;
	}
	.dd:hover{
		box-shadow: 0 0 3pt 2pt red;
/* 		outline: 2px solid red; */
		transition: 0.3s;
		border-radius: 4px;
	}
	</style>
</head>

<body onload="defaultChatBot();">
<h1>챗봇 입니당당</h1>


<div id="chatBotArea">
</div>
<div style="text-align: center;">
	<div>
		<input class="dd" type="button" id="cata1" name="cata1" value="플래너" onclick="cataPick(1);">
	</div>
	<br>
	<div>
		<input class="dd" type="button" id="cata2" name="cata2" value="커뮤니티" onclick="cataPick(2);">
	</div>
	<br>
	<div>
		<input class="dd" type="button" id="cata3" name="cata3" value="동행" onclick="cataPick(3);">
	</div>
</div>



<script type="text/javascript">
var cataPickNum=0;// 카테고리 전역변수 
function defaultChatBot(){

		$("#chatBotArea").html('<div>안녕하세요? 하하호호입니다. 챗봇 시작하곘습니다.</div>');
		$("#chatBotArea").append('<div>원하시는 카테고리를 클릭해주세요.</div>');
		$("#chatBotArea").append('<div>');
		$("#chatBotArea").append('<input type="button" id="cata1" name="cata1" value="test1" onclick="cataPick(1);">');
		$("#chatBotArea").append('<input type="button" id="cata2" name="cata2" value="test2" onclick="cataPick(2);">');
		$("#chatBotArea").append('<input type="button" id="cata3" name="cata3" value="test3" onclick="cataPick(3);">');
		$("#chatBotArea").append('<input type="button" id="cata4" name="cata4" value="test4" onclick="cataPick(4);">');
		$("#chatBotArea").append('</div>');
}

function cataPick(pick){
	cataPickNum = pick;
	$("#chatBotArea").append('<div id="keywordInput">');
	$("#chatBotArea").append('<input type="text" id="keyword" name="keyword"  > <div id="go" onclick="javascript:go();">입력</div>');
	$("#chatBotArea").append('</div>');
	
}

function go(){
	
	/*  카테고리 cataPickNum 와 keyword를 가지고 컨트롤러가서 db접근후 답변 ㄱㄱ*/
	var keyword = $("#keyword").val().trim();

	

	$.ajax({
		url : '/chatbot/json/getChatB',
		method : 'post',
		data : keyword,
		headers : {
			"Accpet" : "application/json",
			"Content-Type" : "application/json"
		},
		success : function(data) {
			
			
		}
		
	});
		
	
}
</script>
</body>

</html>
