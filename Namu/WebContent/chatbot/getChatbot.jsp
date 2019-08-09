<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<jsp:include page="/layout/head.jsp" />
		
	<script  src="https://code.jquery.com/jquery-3.4.1.slim.js" integrity="sha256-BTlTdQO9/fascB1drekrDVkaKd9PkwBymMlHOiG+qLI=" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	
	<!-- Font Awesome SVG with JavaScript -->
	<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
	
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	
	<link  rel="stylesheet"  href="/resources/css/chatbot.css" /> 
		
	<script type="text/javascript">
	
	//카테고리 전역변수 선언
	var keywordTypeNum=0;
	//챗봇 프로필
	var chatbotProfile = "../resources/images/favicon.ico";
	//비회원 공통 프로필
	//var userProfile= "../resources/images/captcha/stitch.png";
	var userProfile= "../resources/images/blank-profile.png";
	
	//첨부할 이미지 설정
	
	// 메인 이미지 랜덤
	var imgRandom = Math.floor(Math.random() * 3);
		
	if(imgRandom == 0){
		imgRandom = 'main_images_01.jpg';
	}else if(imgRandom == 1){
		imgRandom = 'main_images_02.jpg';
	}else if(imgRandom == 2){
		imgRandom = 'main_images_03.jpg';
	}

	//시간 설정
	function formatAMPM(date) {
	    var hours = date.getHours();
	    var minutes = date.getMinutes();
	    var ampm = hours >= 12 ? 'PM' : 'AM';
	    hours = hours % 12;
	    hours = hours ? hours : 12;
	    minutes = minutes < 10 ? '0'+minutes : minutes;
	    var strTime = hours + ':' + minutes + ' ' + ampm;
	    return strTime;
	}            

	//챗봇,유저 말 남기는 function
	function insertChat(who, text, time){
	    if (time === undefined){
	        time = 0;
	    }
	    var control = "";
	    var date = formatAMPM(new Date());
	    
	    if (who == "system"){
	        control = '<li style="width:100%">' +
	                        '<div class="msj macro">' +
	                        '<div class="avatar"><img class="img-circle" style="width:60%;" src="'+ chatbotProfile +'" /></div>' +
	                            '<div class="text text-l">' +
	                            	'<p>'+ text +'</p>' +
	                                '<p><small style="font-size: 12px;">'+date+'</small></p>' +
	                            '</div>' +
	                        '</div>' +
	                    '</li>';
	                    
	    }else if(who == "my"){
	        control = '<li style="width:100%;">' +
	                   		'<div class="msj-rta macro">' +
	                   		'<div class="avatar"><img class="img-circle" style="width:60%;" src="'+ userProfile +'" /></div>' +
	                            '<div class="text text-r">' +
	                                '<p>'+text+'</p>' +
	                                '<p><small style="font-size: 12px;">'+date+'</small></p>' +
	                            '</div>' +
	                  '</li>';
	    }
	    setTimeout(
	        function(){                        
	            $("ul").append(control).scrollTop($("ul").prop('scrollHeight'));
	        }, time);
	}
	
	function insertChatImg(who, text, time){
	    if (time === undefined){
	        time = 0;
	    }
	    var control = "";
	    var date = formatAMPM(new Date());
	    
	    if (who == "system"){
	        control = '<li style="width:100%">' +
	                        '<div class="msj macro">' +
	                        '<div class="avatar"><img class="img-circle" style="width:60%;" src="'+ chatbotProfile +'" /></div>' +
	                            '<div class="text text-l">' +
	                            	'<img src="/resources/images/main/'+ imgRandom +'" style="width: 240px; border-radius: 10px;"/>'+
	                            	'<p>'+ text +'</p>' +
	                                '<p><small style="font-size: 12px;">'+date+'</small></p>' +
	                            '</div>' +
	                        '</div>' +
	                    '</li>';
	    }
	    setTimeout(
	        function(){                        
	            $("ul").append(control).scrollTop($("ul").prop('scrollHeight'));
	        }, time);
	}
	//채팅 입력란 초기화
	function resetChat(){
	    $("ul").empty();
	}
				
	insertChat("system", "안녕하세요 챗봇 발발이 입니다."+"<br>"+" 검색 메뉴를 선택해 주세요." + 
			'<div><input class="dd" type="button" id="keywordType1" name="keywordType1" value="플래너" onclick="keywordType(1);"></div>'+
			'<div><input class="dd" type="button" id="keywordType2" name="keywordType2" value="커뮤니티" onclick="keywordType(2);"></div>'+
			'<div><input class="dd" type="button" id="keywordType3" name="keywordType3" value="동행" onclick="keywordType(3);"></div>', 0);
	
	//button클릭
	function keywordType(num){
		//검색 keywordType 확인
		keywordTypeNum = num;
		//alert(keywordTypeNum);
		
		if(keywordTypeNum == 1){
			insertChat("system", $('#keywordType1').val()+" 카테고리를 선택하셨습니다." +"<br>" +"검색어를 입력해주세요.", 0);
				
		}else if(keywordTypeNum == 2){
			insertChat("system", $('#keywordType2').val()+" 카테고리를 선택하셨습니다." +"<br>" +"검색어를 입력해주세요.", 0);
					
		}else{
			insertChat("system", $('#keywordType3').val()+" 카테고리를 선택하셨습니다." +"<br>" +"검색어를 입력해주세요.", 0);
		}
				
		$("#chatbotText").append('<div class="msj-rta macro">');
				
		$(".msj-rta.macro").append('<div class="text text-r" style="background:whitesmoke !important">');
		$(".text.text-r").append('<input class="mytext" id="keyword" placeholder="검색어를 입력해주세요."></div>');
		$(".msj-rta.macro").append('</div>');
		$(".msj-rta.macro").append('</div>');
		
		$("#chatbotText").append('<div id="sendButton" style="padding:10px;">');
		$("#sendButton").append('<span class="glyphicon glyphicon-share-alt" onclick="searchKeyword()"></span>');
		$(".msj-rta.macro").append('</div>');
		
		$("li").remove();
		
	}	
	
	//console.log(imgRandom);
	
	//$('.visual_image').css('background-image', 'url(/resources/images/main/' + imgRandom + ')');
	
	
	//입력한 keyword 챗봇창에 보여주기
	//입력한 keyword DB검색
	function searchKeyword(){
		
		if($('.mytext').val() != ''){
			insertChat("my", $('.mytext').val(), 0);
			insertChat("system", $('.mytext').val()+"를 검색하셨습니다.",0);
			$.ajax({
				url : "/chatbot/json/getChatbot",
			  	method : "post",
			  	dataType : "json",
			  	data : JSON.stringify ({
			  		//keywordType : keywordTypeNum,//1:플래너 2:커뮤니티 3:동행
			  		keyword : $('#keyword').val().trim()
				}),
			  	headers : {
			  	"Accept" : "application/json",
			  	"Content-Type" : "application/json"
			  	},
				success : function(data) {
			  		console.log("data ====="+ data)
					//db에 없는 내용이면
					var answer = JSON.stringify(data.answer)
			  		insertChatImg("system", answer+"<br>"+"더 검색하실 내용이 있으신가요??", 0);
			  	},
			  	error : function(data){
			  		//console.log('검색내용 없음')
			  		insertChat("system", "검색 내용을 찾을 수 없습니다."+"<br>"+"다시 검색하시거나 "+"<br>"+
		  					"QnA 게시판을 이용해주세요.", 0);
			  	},
			});
		}else{
			insertChat("system", "검색어를 입력해주세요.",0);
		}
				
		//data전송 후 입력칸 clear
		$('.mytext').val('');
	}
	
	/*키다운 안먹음 왜지*/
	/* $(".mytext").on("keydown", function(e){
	    if (e.which == 13){
	        var text = $(this).val();
	        if (text !== ""){
	            insertChat("my", text);              
	            $(this).val('');
	        }
	    }
	});

	$('body > div > div > span').click(function(){
	    $(".mytext").trigger({type: 'keydown', which: 13, keyCode: 13});
	}) */
		
	resetChat();
	
	
	
	</script>
	</head>
	
    <body>
    	<input type="hidden" id="answer" value="${chatbot.answer}">
        <div class="col-sm-3 col-sm-offset-4 frame">
            
            <!-- 채팅 표시되는 ul -->
            <ul id="ul"></ul>
            <!-- keyword입력하는 곳 -->
            <div id='chatbotText'></div>
        </div>       
    </body>
    
</html>
