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
<link rel="stylesheet" href="/resources/css/common.css" >
<script src="/resources/javascript/getProfile.js"></script>
</head>

<body>
<header><%@ include file="/layout/header.jsp" %></header>
<br><br>

<div class="container">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-12">
			
				
					<div class="my-3 p-3 bg-white rounded shadow-sm">
						<h6 class="border-bottom border-gray pb-2 mb-0">Recent updates</h6>
						<c:forEach var="item" items="${list }" varStatus="status">
						<!-- 답글 -->
						<c:if test="${item.protocol eq '9' && item.fromUser.userCode ne user.userCode }">
							<div class="timePreview-${status.index } media text-muted pt-3">
								<input type="hidden" value="${item.fromUser.userCode }">
								<input type="hidden" value="${item.commentCode }">
								<img class="timelineProf" alt="" src="/resources/images/profile/${item.fromUser.profileImg }" width="45" height="45">
								<p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
								<span class="timelineTarget d-block" style="position:relative;">
									<strong class="timelineProf text-gray-dark">@ ${item.fromUser.nickname }</strong>
									<button class="timelineDate" style="position: absolute; right: 0px; border:none; background: none;">${item.timeDate }</button>
								</span>
								<span class="timelineContent"><button class="timeComment" value="${item.commentCode }" style="border:none; background: none">회원님의 댓글을 좋아합니다.</button></span>
<!-- 								<button class="timelineTrue" >수락</button> -->
<!-- 								<button class="timelineFalse" >거절</button> -->
								</p>
							</div>
						</c:if>
						
						<!-- 추천 -->
						<c:if test="${item.protocol eq '8' && item.fromUser.userCode ne user.userCode }">
							<div class="timePreview-${status.index } media text-muted pt-3">
								<input type="hidden" value="${item.fromUser.userCode }">
								<input type="hidden" value="${item.commentCode }">
								<img class="timelineProf" alt="" src="/resources/images/profile/${item.fromUser.profileImg }" width="45" height="45">
								<p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
								<span class="timelineTarget d-block" style="position:relative;">
									<strong class="timelineProf text-gray-dark">@ ${item.fromUser.nickname }</strong>
									<button class="timelineDate" style="position: absolute; right: 0px; border:none; background: none;">${item.timeDate }</button>
								</span>
								<span class="timelineContent"><button class="timeComment"  value="${item.commentCode }" style="border:none; background: none">회원님의 댓글에 답글을 작성하셨습니다.</button></span>
<!-- 								<button class="timelineTrue" >수락</button> -->
<!-- 								<button class="timelineFalse" >거절</button> -->
								</p>
							</div>
						</c:if>
						
						<!-- 게시물 댓글 -->
						<c:if test="${item.protocol eq '1' && item.fromUser.userCode ne user.userCode }">
							<div class="timePreview-${status.index } media text-muted pt-3">
								<input type="hidden" value="${item.fromUser.userCode }">
								<img class="timelineProf" alt="" src="/resources/images/profile/${item.fromUser.profileImg }" width="45" height="45">
								<p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
								<span class="timelineTarget d-block" style="position:relative;">
									<strong class="timelineProf text-gray-dark">@ ${item.fromUser.nickname }</strong>
									<button class="timelineDate" style="position: absolute; right: 0px; border:none; background: none;">${item.timeDate }</button>
								</span>
								<span class="timelineContent"><button class="timeCommunity" style="border:none; background: none">회원님의 게시물에 댓글을 남겼습니다.</button></span>
								<input type="hidden" id="boardCode" value="${item.boardCode }">
								<input type="hidden" id="detailCode" value="${item.detailCode }">
								
<!-- 								<button class="timelineTrue" >수락</button> -->
<!-- 								<button class="timelineFalse" >거절</button> -->
								</p>
							</div>
						</c:if>
						
						
						
						<!-- 게시물 좋아요 -->
						<c:if test="${item.protocol eq '3' && item.fromUser.userCode ne user.userCode }">
							<div class="timePreview-${status.index } media text-muted pt-3">
								<input type="hidden" value="${item.fromUser.userCode }">
								<img class="timelineProf" alt="" src="/resources/images/profile/${item.fromUser.profileImg }" width="45" height="45">
								<p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
								<span class="timelineTarget d-block" style="position:relative;">
									<strong class="timelineProf text-gray-dark">@ ${item.fromUser.nickname }</strong>
									<button class="timelineDate" style="position: absolute; right: 0px; border:none; background: none;">${item.timeDate }</button>
								</span>
								<span class="timelineContent"><button class="timeCommunity" style="border:none; background: none">회원님의 게시물을 좋아합니다.</button></span>
								<input type="hidden" id="boardCode" value="${item.boardCode }">
								<input type="hidden" id="detailCode" value="${item.detailCode }">
								
<!-- 								<button class="timelineTrue" >수락</button> -->
<!-- 								<button class="timelineFalse" >거절</button> -->
								</p>
							</div>
						</c:if>
						
						
						
						<!-- 친구 초대 -->
						<c:if test="${item.protocol eq '2' && item.fromUser.userCode ne user.userCode }">
							<div class="timePreview-${status.index } media text-muted pt-3">
								<input type="hidden" value="${item.fromUser.userCode }">
								<img class="timelineProf" alt="" src="/resources/images/profile/${item.fromUser.profileImg }" width="45" height="45">
								<p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
								<span class="timelineTarget d-block" style="position:relative;">
									<strong class="timelineProf text-gray-dark">@ ${item.fromUser.nickname }</strong>
									<button class="timelineDate" style="position: absolute; right: 0px; border:none; background: none;">${item.timeDate }</button>
								</span>
								<span class=""><button class="inviteMessage" style="border:none; background: none" >
								<c:if test="${item.inviteCode eq '0' }">
								회원님과 친구맺기를 원합니다.
								</c:if>
								<c:if test="${item.inviteCode eq '1' }">
								회원님과 친구가 되었습니다.
								</c:if>
								<c:if test="${item.inviteCode eq '2' }">
								회원님과 친구맺기를 거절하셨습니다.
								</c:if>
								</button></span>
								<c:if test="${item.inviteCode eq '0' }">
								<input type="hidden" value="${item.timelineCode }">
								<button class="timelineFriendAcceptBtn btn btn-outline-success btn-sm" >수락</button>
								<button class="timelineFriendRefuseBtn btn btn-outline-danger btn-sm" >거절</button>
								</c:if>
								</p>
							</div>
						</c:if>
						
						
						<!-- 친구 초대 보낸사람 -->
						<c:if test="${item.protocol eq '2' && item.fromUser.userCode eq user.userCode }">
							<div class="timePreview-${status.index } media text-muted pt-3">
								<input type="hidden" value="${item.toUser.userCode }">
								<img class="timelineProf" alt="" src="/resources/images/profile/${item.toUser.profileImg }" width="45" height="45">
								<p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
								<span class="timelineTarget d-block" style="position:relative;">
									<strong class="timelineProf text-gray-dark">@ ${item.toUser.nickname }</strong>
									<button class="timelineDate" style="position: absolute; right: 0px; border:none; background: none;">${item.timeDate }</button>
								</span>
								<span class=""><button class="" style="border:none; background: none" >
								<c:if test="${item.inviteCode eq '0' }">
								친구 초대 메시지를 전달했습니다.
								</c:if>
								<c:if test="${item.inviteCode eq '1' }">
								회원님과 친구가 되었습니다.
								</c:if>
								<c:if test="${item.inviteCode eq '2' }">
								회원님과 친구맺기를 거절하셨습니다.
								</c:if>
								</button></span>
								</p>
							</div>
						</c:if>
						
			 		</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- <jsp:include page="../user/getProfile.jsp"></jsp:include> --%>
<div class="profilePopup" style="disaply:none;"></div>
<script type="text/javascript">
//닉네임 클릭시 회원코드로 프로필 출력
$(document).on("click",".timelineProf",function(){ 
	console.log("유저코드 : " + $(this).parents('div').children().val());
	getProfile($(this).parents('div').children().val());
});



$(document).on("click",".timelineFriendAcceptBtn",function(){ 
	var timeCode = $(this).prev().val().trim();
	var sendUser = $(this).parents('div').children().val().trim();
	var sessionUser = $('#nodeUserCode').val().trim();
	inviteProfile(sendUser,sessionUser,'1');
	inviteProfile(sessionUser,sendUser,'1');
	updateTimelineInvite(timeCode,'1');
	$(this).next().remove();
	$(this).parents('div[class^=timePreview]').find('.inviteMessage').text('회원님과 친구가 되었습니다.');
	$(this).remove();
});

$(document).on("click",".timelineFriendRefuseBtn",function(){ 
	var timeCode = $(this).prev().prev().val().trim();
	updateTimelineInvite(timeCode,'2');
	$(this).prev().remove();
	$(this).parents('div[class^=timePreview]').find('.inviteMessage').text('회원님과 친구맺기를 거절하셨습니다.');
	$(this).remove();
});


$(function(){
	// 댓글 or 추천 클릭시 이동할 페이지
	$('.timeComment').on('click',function(){
		var commentCode = $(this).val().trim();
		
		$.ajax({
			url : '/comment/json/getCommentOne',
			method : 'post',
			data : JSON.stringify({
				commentCode : commentCode
			}),
			headers : {
				"Accpet" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(data, status) {
				self.location = data;
			}
		})
	});
	
	
	
	// 게시물 클릭시 이동할 페이지
	$('.timeCommunity').on('click',function(){
		var boardCode = $('#boardCode').val().trim();
		var detailCode = $('#detailCode').val().trim();
		
		self.location = '/community/getCommunity?communityCode='+detailCode;
	})
})


	// 수락 , 거절 선택시 호출
	function inviteProfile(sendUserCode,receiverUserCode,friendRole) {
	
	$.ajax ({
		url : '/user/json/inviteUser',
		method : 'post',
		data : JSON.stringify({
			userCode : sendUserCode,
			friendCode : {
				userCode : receiverUserCode
			},
			friendRole : friendRole
		}),
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		success : function(data,status){
				alert(data);
		}
	})
	
}



//수락 , 거절 선택시 호출
function updateTimelineInvite(timeCode,inviteCode) {

$.ajax ({
	url : '/timeline/json/updateTimeline',
	method : 'post',
	data : JSON.stringify({
		timelineCode : timeCode,
		inviteCode : inviteCode
	}),
	headers : {
		"Accept" : "application/json",
		"Content-Type" : "application/json"
	},
	success : function(data,status){
			alert(data);
	}
})

}

</script>
</body>
</html>