<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원검색/친구목록</title>

<style>
/* .friend_click {height: 35px; background-size: cover;background-repeat:no-repeat;background-position: center; margin: 0; padding:0; border: 0;} */
/* .friend_click span {line-height:35px ;display:inline-block; width: 100%; height:100%; background-color: rgba(255, 255, 255, 0.3)} */
/* .friend_click span small {font-size: 16px; font-weight: 700; } */
.friend_click > div::after {content:''; display: block; clear:both;}
</style>

</head>
<body>
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle"><button class="btn btn-secondary" id="userSearchBlock">회원 검색&nbsp;<i class="fas fa-user"></i></button>&nbsp;&nbsp;<button class="btn btn-secondary" id="friendSearchBlock">친구목록&nbsp;<i class="fas fa-users"></i></button></h5>
            
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      <!-- 회원검색 부분 -->
      <div class="userSearchList" style="display: block; margin-top: 20px">
      <input type="text" class="form-control" id="searchUser" placeholder="닉네임을 입력하세요">
      <br>
      <div class="onCheckUser">
		    </div>
		    
       
      
      <div class="userList col-md-4" style="margin-top:8px;">
      
      
       </div>
       </div>
       
       
       <!-- 친구목록 부분 -->
       <div class="friendSearchList" style="display: none; margin-top: 20px">
    		 <div class="list-group">
			  <button type="button" class="friendRole1 list-group-item list-group-item-action text-center">친구 목록</button>
			  <button type="button" class="friendRole2 list-group-item list-group-item-action text-center">동행 목록</button>
<!-- 			  <button type="button" class="friendRole3 list-group-item list-group-item-action text-center">일행 목록</button> -->
			</div>
       </div>
       
       
      <div class="modal-footer" style="padding-top: 10px">
      
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
        <div class="multipleInvite btn-group" role="group">
		    <button id="btnGroupDrop1" type="button" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		      선택 초대
		    </button>
		    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
		      <a class="searchAddFriend dropdown-item" href="#">친구추가</a>
		      <a class="searchChatInvite dropdown-item" href="#">채팅초대</a>
		      <a class="searchMessageSend dropdown-item" href="#">쪽지전송</a>
<!-- 		      <a class="searchGroupInvite dropdown-item" href="#">일행초대</a> -->
		    </div>
		  </div>
      </div>
    </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(function(){
	var sessionUser = $('#nodeUserCode').val().trim();
	//선택초대에서 친구추가 선택
	
	$(document).on('click','.searchAddFriend',function(){
		var multipleUser;
		if($('.uploadNick').length === 0) {
			alert('회원을 한명이상 선택해주세요.')
			return;
		}else {
			multipleUser = '';
			$('.uploadNick').each(function(){
				//alert('회원코드'+$(this).children().next().val().trim());
				multipleUser += '#'+$(this).children().next().val().trim();
			});
			multipleAdd(multipleUser,'2');
			alert('초대메시지를 보냈습니다.')
		}
		//alert(multipleUser);
			
		
	});
	
	// 회원검색에서 다중선택 초대메시지 전달
	function multipleAdd(multipleUser,protocol) {
		$.ajax({
			url : '/user/json/multipleAdd',
			method : 'post',
			data : JSON.stringify({
				sessionUser : sessionUser,
				multipleUser : multipleUser,
				protocol : protocol
			}),
			headers: {
				"Accpet" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(data,status){
				$.each(data,function(index,item){
					//console.log("소켓 받는 유저 코드"+item.userCode);
					socketcall(item.userCode,'2');
				})
			}			
		});
	}
	
	
	// 회원검색 메인
	$('#userSearchBlock').on('click',function(){
		$('.userSearchList').css('display','block');
		$('.friendSearchList').css('display','none');
		$('.multipleInvite').css('display','block');
	});
	
	//친구목록 메인
	$('#friendSearchBlock').on('click',function(){
		$('.userSearchList').css('display','none');
		$('.friendSearchList').css('display','block');
		$('.multipleInvite').css('display','none');
	});
	
	// 친구목록 활성화
	$('.friendRole1').on('click',function(){
		var userCode = $('#nodeUserCode').val().trim();
		
		if($(this).hasClass('act') === true) {
			$(this).removeClass('act');
			$('.friendRole2').css('display','block');
			$('.friendRole3').css('display','block');
			$('div[class^=friend_click').remove();
		}else {
			$(this).addClass('act');
			$('.friendRole2').css('display','none');
			$('.friendRole3').css('display','none');
			getFriendList(userCode,'1')
		}
	});
	
	//동행목록 활성화
	$('.friendRole2').on('click',function(){
		var userCode = $('#nodeUserCode').val().trim();
		
		if($(this).hasClass('act') === true) {
			$(this).removeClass('act');
			$('.friendRole1').css('display','block');
			$('.friendRole3').css('display','block');
			$('div[class^=friend_click').remove();
		}else {
			$(this).addClass('act');
			$('.friendRole1').css('display','none');
			$('.friendRole3').css('display','none');
			getFriendList(userCode,'2')
		}
	});
	
	//일행목록 활성화
	$('.friendRole3').on('click',function(){
		var userCode = $('#nodeUserCode').val().trim();
		
		if($(this).hasClass('act') === true) {
			$(this).removeClass('act');
			$('.friendRole1').css('display','block');
			$('.friendRole2').css('display','block');
			$('div[class^=friend_click').remove();
		}else {
			$(this).addClass('act');
			$('.friendRole1').css('display','none');
			$('.friendRole2').css('display','none');
			getFriendList(userCode,'3')
		}
	});
	

	//친구목록 메모 수정창
	$(document).on("click",".friendMemoEdit",function(){  
		var color = $(this).css('color');
		if(color == 'rgb(0, 0, 0)'){
			$(this).parents('div[class^=friend_click]').children().next().css('display','block');
			//alert($(this).parents('div[class^=friend_click]').find($('.friend_memo')).text());
			$(this).parents('div[class^=friend_click]').find($('input[type=text]')).val($(this).parents('div[class^=friend_click]').find($('.friend_memo')).text().trim());
			$(this).css('color','red');
		}else {
			$(this).parents('div[class^=friend_click]').children().next().css('display','none');
			$(this).css('color','black');
		}
	});
	
	// 친구목록 메모 수정버튼 클릭  
	$(document).on("click",".memoEditBtn",function(){  
		var memo = $(this).parents('.friendMemoEditForm').children().val().trim();
		var friendNo = $(this).next().val().trim();
		var friendRole = $(this).next().next().val().trim();
		//alert(friendNo);
		//alert(memo);
		$.ajax({
			url : '/user/json/addFriendMemo',
			method : 'post',
			data : JSON.stringify({
				friendNo : friendNo,
				memo : memo
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(data,status) {
				if(data == true) {
					getFriendList(sessionUser,friendRole)
				}
			}
		});
	});
	
	
	function getFriendList(userCode,friendRole) {
		
		$('div[class^=friend_click').remove();
		
		$.ajax({
			url : '/user/json/getFriend',
			method : 'post',
			data : JSON.stringify({
				userCode : userCode,
				friendRole : friendRole
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(data,status) {
				$.each(data,function(index,item){
					//alert(item.friendCode.profileImg);
					
					$('button[class^=friendRole'+item.friendRole).after(
					'<div class="friend_click" style="padding-top:10px;">'
					+'<div><img class="rounded-circle" height="50" width="55" style="float:left; margin-left: 5px;" src="/resources/images/profile/'+item.friendCode.profileImg+'"></img>'
					+'<div style="float:left; margin-left: 15px;"><strong>'+item.friendCode.nickname+'</strong>'
					+'<div class="friend_memo" style="font-size: 13px;">'+item.memo+'&nbsp;&nbsp;<i class="friendMemoEdit far fa-edit" style="color:black;"></i>&nbsp;&nbsp;&nbsp;<i class="friendMemoDelete far fa-trash-alt"></i></div></div>'
					+'<div style="float:right;" class="custom-control custom-checkbox">'
					 +' <input type="checkbox" class="custom-control-input">'
					+'</div></div>'
					+'<div class="friendMemoEditForm" style="width:100%; margin-top:5px; display:none;"><input type="text" class="form-control" style="display:inline-block; margin-left: 70px;width:60%;"><span style="width:30%">'
					+'<button type="button" class="memoEditBtn btn btn-outline-primary" style="margin-left:5px; margin-top:-5px;">수정</button>'
					+'<input type="hidden" value="'+item.friendNo+'">'
					+'<input type="hidden" value="'+item.friendRole+'"></span></div></div>'
					);
				})
			}
			
		});// end ajax
		
	}
	
	
	$('#searchUser').on('keyup',function(){
		$('.userList').empty();
		var nick = $(this).val();
		if(nick != '') {
			searchUser(nick);
		}else {
			return;
		}
	});
})

$(document).on('click','.userCheck',function(){
	var nick = $(this).next().text().trim();
	//console.log('코드코드'+$(this).next().children().next().val().trim());
	var userCode = $(this).next().children().next().next().val().trim();
	var check = true;
	$.each($('.uploadNick'),function(){
		//console.log('들어옴')
		var nick2 = $(this).text().trim();
		//console.log(nick);
		//console.log(nick2);
		//console.log(userCode);
		
		if(nick == nick2) {
			check = false;
		}else {
			
		}
	})
	if(check){
	$('.onCheckUser').append(
					 '<button type="button" class="uploadNick btn btn-outline-dark" style="height: 25px; border-radius: 10px; padding: 0px; padding-left: 1%; padding-right: 1%;">'
				    	+'<span style="font-size: 12px;">'+nick+'&nbsp;<i class="far fa-times-circle"></i></span>'
				    	+'<input type="hidden" value="'+userCode+'"></button>&nbsp;');
	}
})

$(document).on('click','.uploadNick',function(){
	$(this).remove();
	//$('.onCheckUser').empty();
	console.log($('.uploadNick').length);
	if($('.uploadNick').length === 0) {
		$('.onCheckUser').empty();
	}
});

$(document).on('click','.getUserCode',function(){
	//alert($(this).children('input').val().trim());
	var userCode = $(this).children('input').val().trim();
	var url = '/user/searchUserClick/'+userCode;
	var name = "_blank";
	var option = "width = 810,height = 320,marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no,location = no"
	window.open(url,name,option);
});

	function searchUser(nick) {
	
	$.ajax({
		url : '/user/json/getUser',
		method : 'post',
		data : JSON.stringify({
			nickname : nick
		}),
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		success : function(data, status) {
			if(data != '') {
				$('.userList').empty();
				
				$.each(data,function(index,item){
					$('.userList').append(
							'<div class="userNick'+index+'">'
						    +' <input class="userCheck" type="checkbox">'
						    +'<button class="getUserCode" style="border:none; background: none">'
						     +' <small>'+item.nickname+'</small>&nbsp;&nbsp;<i class="fas fa-user-circle" style="color:darkgray;"></i>'
						     +'<input type="hidden" value="'+item.userCode+'"'
						     +'</button>'
						      +' </div>'
					);
					//현재 접속중인 사람 체크 후 컬러 변경
					//setTimeout(currentUser(item.userCode,'userNick'+index),5000);
					setTimeout(function(){
						currentUser(item.userCode,'userNick'+index);
					},100)
				})
				
			}	else {
				//alert("데이터없음");
			}
			
		}
	})
}

</script>
</body>
</html>