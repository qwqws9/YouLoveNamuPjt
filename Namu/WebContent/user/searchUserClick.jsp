<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
</head>

<div style="display: none;">
<header><jsp:include page="/layout/header.jsp" /></header>
</div>
<br>
<div class="container">
<div class="row">
<div class="col-md-12">

					<div class="profilePop_wrap">
						<div class="profilePop_contain">
				     <div class="profileInfo" >
					<div class="card bg-light mb-3">
					  <div class="row no-gutters">
					    <div class="col-md-4">
					      <img src="/resources/images/profile/${userForm.profileImg }" class="userProfile card-img" alt="...">
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
						    <input type="hidden" id="inviteUserCode" value="${userForm.userCode }">
					        <p class="userNick card-text">닉네임 : ${userForm.nickname }</p>
					        <p class="userGend card-text">성별 : ${userForm.gender }</p>
					        <p class="userAge card-text">나이 : ${userForm.birth }</p>
					        <p class="card-text">자기소개</p>
					        <p class="userIntro card-text">${userForm.introduce }</p>
					        <button type="button" class="profChatInvite btn btn-outline-info btn-sm" >채팅초대</button>
					        <button type="button" class="profMessageSend btn btn-outline-info btn-sm" >쪽지전송</button>
					        <c:if test="${!empty friendAl}">
					        <button type="button" class="profFriendAdd btn btn-outline-info btn-sm" disabled="disabled" >이미친구</button>
					        </c:if>
					        <c:if test="${!empty timelineFriend}">
					        <button type="button" class="profFriendAdd btn btn-outline-info btn-sm" disabled="disabled" >수락대기</button>
					        </c:if>
					        <c:if test="${empty friendAl && empty timelineFriend }">
					        <button type="button" class="profFriendAdd btn btn-outline-info btn-sm" >친구추가</button>
					        </c:if>
					        <button type="button" class="profGroupInvite btn btn-outline-info btn-sm" >일행초대</button>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
</div>
</div>
</div>
</div>
</div>
<input type="hidden" id="profileSessionUserCode" value="${user.userCode }">
<input type="hidden" id="thisUser" value="${thisUser}">

<script type="text/javascript">
	$(function(){
		var thisUser = $('#thisUser').val().trim();
		if(thisUser == 'true') {
			$('.profChatInvite').attr('disabled',true);
			$('.profMessageSend').attr('disabled',true);
			$('.profFriendAdd').attr('disabled',true);
			$('.profGroupInvite').attr('disabled',true);
		}
		
		
		$('.profFriendAdd').on('click',function(){
			var senduserCode = $('#profileSessionUserCode').val().trim();
			var receiverUserCode = $(this).parents('div').children().val().trim();
			//타임라인콜 + 소켓콜
			addTimelineFriend(senduserCode,receiverUserCode,'2');
			$(this).attr("disabled",true).text('수락대기');
			alert("친구신청 메시지를 전달하였습니다.")
		})
		
	
	});

</script>	

</html>