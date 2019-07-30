<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Chatbot</title>
	
	<script  src="https://code.jquery.com/jquery-3.4.1.slim.js"  integrity="sha256-BTlTdQO9/fascB1drekrDVkaKd9PkwBymMlHOiG+qLI="  crossorigin="anonymous"></script>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	
	<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
	<!------ Include the above in your HEAD tag ---------->
	<link  rel="stylesheet"  href="/resources/css/chatbot.css" /> 
	
	
	
	<script type="text/javascript">
	//카테고리 전역변수 선언
	var cataPickNum=0;
	//챗봇 프로필
	var chatbotProfile = "../resources/images/youloveplan_logo.png";
		
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

	//-- No use time. It is a javaScript effect.
	function insertChat(who, text, time){
	    if (time === undefined){
	        time = 0;
	    }
	    var control = "";
	    var date = formatAMPM(new Date());
	    
	    if (who == "system"){
	        control = '<li style="width:100%">' +
	                        '<div class="msj macro">' +
	                        '<div class="avatar"><img class="img-circle" style="width:100%;" src="'+ chatbotProfile +'" /></div>' +
	                            '<div class="text text-l">' +
	                                '<p>'+ text +'</p>' +
	                                '<p><small>'+date+'</small></p>' +
	                            '</div>' +
	                        '</div>' +
	                    '</li>';
	                    
	    }else if(who == "my"){
	        control = '<li style="width:100%;">' +
	                   		'<div class="msj-rta macro">' +
	                   		'<div class="avatar"></div>' +
	                            '<div class="text text-r">' +
	                                '<p>'+text+'</p>' +
	                                '<p><small>'+date+'</small></p>' +
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
		
	/* $(".mytext").on("keydown", function(e){
	    if (e.which == 13){
	        var text = $(this).val();
	        if (text !== ""){
	            insertChat("me", text);              
	            $(this).val('');
	        }
	    }
	}); */

	/* $('body > div > div > div:nth-child(2) > span').click(function(){
	    $(".mytext").trigger({type: 'keydown', which: 13, keyCode: 13});
	}) */
	
	//-- Clear Chat
	/* resetChat(); */

	//-- Print Messages
	
	insertChat("system", "안녕하세요 챗봇 발발이 입니다. 카테고리를 선택해 주세요." + 
			'<input type="button" id="cata1" name="cata1" value="플래너" onclick="cataPick(1);">'+
			'<input type="button" id="cata2" name="cata2" value="커뮤니티" onclick="cataPick(2);">'+
			'<input type="button" id="cata3" name="cata3" value="동행" onclick="cataPick(3);">', 0);
	
	//button클릭 시 입력창 출력
	function cataPick(pick){
		insertChat("system", "해당하는 검색어를 입력해주세요.", 0);
		$(".msj-rta.macro").append('<div class="text text-r" style="background:whitesmoke !important">');
		$(".text.text-r").append('<input class="mytext" placeholder="검색어를 입력해주세요."/></div>');
		$(".msj-rta.macro").append('</div>');
		
		$("#sendButton").append('<span class="glyphicon glyphicon-share-alt" onclick="searchKeyword()"></span>');
		$("li").remove();
	}
	
	//입력한 keyword 챗봇창에 보여주기
	//입력한 keyword DB검색
	function searchKeyword(){
		$(".mytext").on("keydown", function(e){
		    if (e.which == 13){
		        var text = $(this).val();
		        if (text !== ""){
		        	insertChat("my", text, 0);             
		            $(this).val("");
		        }
		    }
		});
	}
			
	$('body > div > div > div:nth-child(2) > span').click(function(){
	    $(".mytext").trigger({type: 'keydown', which: 13, keyCode: 13});
	})
	resetChat();
	
	
	
	</script>
	</head>
	
    <body>
        <div class="col-sm-3 col-sm-offset-4 frame">
            
            <!-- 채팅 표시되는 ul -->
            <ul></ul>
            <div id='chatbotText'>
            	<!-- 채팅 입력칸 -->
               	<div class="msj-rta macro">                        
                  
                </div>
                
                <!-- 채팅 전송 버튼 -->
                <div id="sendButton" style="padding:10px;">
                    
                </div>      
            </div>
        </div>       
    </body>
    
</html>
